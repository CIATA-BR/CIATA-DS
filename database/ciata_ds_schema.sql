-- CIATA-DS validation database schema
-- MariaDB 10.11+

CREATE DATABASE IF NOT EXISTS ciata_ds
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE ciata_ds;

CREATE TABLE components (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  component_code VARCHAR(32) NOT NULL UNIQUE,
  slug VARCHAR(120) NOT NULL UNIQUE,
  name VARCHAR(160) NOT NULL,
  repository_path VARCHAR(255) NOT NULL,
  lifecycle_status ENUM('draft','experimental','in_validation','partially_validated','stable','deprecated') NOT NULL DEFAULT 'experimental',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE component_versions (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  component_id BIGINT UNSIGNED NOT NULL,
  commit_sha CHAR(40) NOT NULL,
  version_label VARCHAR(80) NULL,
  source_ref VARCHAR(160) NULL,
  is_current BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_component_commit (component_id, commit_sha),
  CONSTRAINT fk_component_versions_component FOREIGN KEY (component_id) REFERENCES components(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE platforms (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  slug VARCHAR(80) NOT NULL UNIQUE,
  name VARCHAR(120) NOT NULL,
  sort_order INT NOT NULL DEFAULT 0,
  active BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE assistive_resources (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  slug VARCHAR(120) NOT NULL UNIQUE,
  name VARCHAR(160) NOT NULL,
  category VARCHAR(120) NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE validation_criteria (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  component_id BIGINT UNSIGNED NOT NULL,
  criterion_key VARCHAR(80) NOT NULL,
  criterion_group VARCHAR(180) NULL,
  name VARCHAR(255) NOT NULL,
  acceptance_criteria TEXT NOT NULL,
  source_type ENUM('table','checklist','manual') NOT NULL DEFAULT 'manual',
  source_path VARCHAR(255) NOT NULL,
  sort_order INT NOT NULL DEFAULT 0,
  required BOOLEAN NOT NULL DEFAULT TRUE,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_component_criterion (component_id, criterion_key),
  CONSTRAINT fk_validation_criteria_component FOREIGN KEY (component_id) REFERENCES components(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE analysts (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(160) NOT NULL,
  email VARCHAR(190) NULL UNIQUE,
  external_identity VARCHAR(190) NULL UNIQUE,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE validation_runs (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  component_id BIGINT UNSIGNED NOT NULL,
  component_version_id BIGINT UNSIGNED NULL,
  platform_id BIGINT UNSIGNED NOT NULL,
  analyst_id BIGINT UNSIGNED NULL,
  analyst_name_snapshot VARCHAR(160) NOT NULL,
  platform_version VARCHAR(120) NOT NULL,
  framework_runtime VARCHAR(180) NULL,
  assistive_resource_id BIGINT UNSIGNED NULL,
  assistive_resource_name_snapshot VARCHAR(160) NOT NULL,
  assistive_resource_version VARCHAR(120) NULL,
  browser_app VARCHAR(180) NULL,
  device_environment VARCHAR(255) NOT NULL,
  product_harness VARCHAR(180) NULL,
  matrix_path VARCHAR(255) NOT NULL,
  run_notes TEXT NULL,
  overall_status ENUM('in_progress','pass','fail','blocked','mixed') NOT NULL DEFAULT 'in_progress',
  tested_at DATETIME NOT NULL,
  completed_at DATETIME NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_runs_component_platform (component_id, platform_id),
  KEY idx_runs_status (overall_status),
  CONSTRAINT fk_validation_runs_component FOREIGN KEY (component_id) REFERENCES components(id),
  CONSTRAINT fk_validation_runs_component_version FOREIGN KEY (component_version_id) REFERENCES component_versions(id) ON DELETE SET NULL,
  CONSTRAINT fk_validation_runs_platform FOREIGN KEY (platform_id) REFERENCES platforms(id),
  CONSTRAINT fk_validation_runs_analyst FOREIGN KEY (analyst_id) REFERENCES analysts(id) ON DELETE SET NULL,
  CONSTRAINT fk_validation_runs_assistive_resource FOREIGN KEY (assistive_resource_id) REFERENCES assistive_resources(id) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE validation_results (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  validation_run_id BIGINT UNSIGNED NOT NULL,
  validation_criterion_id BIGINT UNSIGNED NULL,
  criterion_key_snapshot VARCHAR(80) NOT NULL,
  criterion_name_snapshot VARCHAR(255) NOT NULL,
  criterion_group_snapshot VARCHAR(180) NULL,
  acceptance_criteria_snapshot TEXT NOT NULL,
  status ENUM('pass','fail','blocked','not-applicable') NOT NULL,
  expected_result TEXT NULL,
  observed_result TEXT NOT NULL,
  severity ENUM('low','medium','high','critical') NULL,
  issue_url VARCHAR(500) NULL,
  notes TEXT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_run_criterion (validation_run_id, criterion_key_snapshot),
  KEY idx_results_status_severity (status, severity),
  CONSTRAINT fk_validation_results_run FOREIGN KEY (validation_run_id) REFERENCES validation_runs(id) ON DELETE CASCADE,
  CONSTRAINT fk_validation_results_criterion FOREIGN KEY (validation_criterion_id) REFERENCES validation_criteria(id) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE validation_evidence (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  validation_run_id BIGINT UNSIGNED NOT NULL,
  validation_result_id BIGINT UNSIGNED NULL,
  evidence_type ENUM('url','file','text','screenshot','video','audio','log','other') NOT NULL DEFAULT 'url',
  label VARCHAR(255) NOT NULL,
  uri VARCHAR(1000) NULL,
  text_content LONGTEXT NULL,
  checksum_sha256 CHAR(64) NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_validation_evidence_run FOREIGN KEY (validation_run_id) REFERENCES validation_runs(id) ON DELETE CASCADE,
  CONSTRAINT fk_validation_evidence_result FOREIGN KEY (validation_result_id) REFERENCES validation_results(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE component_platform_status (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  component_id BIGINT UNSIGNED NOT NULL,
  platform_id BIGINT UNSIGNED NOT NULL,
  component_version_id BIGINT UNSIGNED NULL,
  status ENUM('not_started','in_validation','has_failures','blocked','validated','stable') NOT NULL DEFAULT 'not_started',
  total_required INT UNSIGNED NOT NULL DEFAULT 0,
  total_pass INT UNSIGNED NOT NULL DEFAULT 0,
  total_fail INT UNSIGNED NOT NULL DEFAULT 0,
  total_blocked INT UNSIGNED NOT NULL DEFAULT 0,
  total_not_applicable INT UNSIGNED NOT NULL DEFAULT 0,
  calculated_at DATETIME NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_component_platform_status (component_id, platform_id),
  CONSTRAINT fk_component_platform_status_component FOREIGN KEY (component_id) REFERENCES components(id) ON DELETE CASCADE,
  CONSTRAINT fk_component_platform_status_platform FOREIGN KEY (platform_id) REFERENCES platforms(id),
  CONSTRAINT fk_component_platform_status_version FOREIGN KEY (component_version_id) REFERENCES component_versions(id) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE validation_audit_log (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  entity_type VARCHAR(80) NOT NULL,
  entity_id BIGINT UNSIGNED NOT NULL,
  action VARCHAR(80) NOT NULL,
  analyst_id BIGINT UNSIGNED NULL,
  payload_json JSON NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY idx_audit_entity (entity_type, entity_id),
  CONSTRAINT fk_validation_audit_analyst FOREIGN KEY (analyst_id) REFERENCES analysts(id) ON DELETE SET NULL
) ENGINE=InnoDB;

INSERT INTO platforms (slug,name,sort_order) VALUES
  ('web','Web',10),
  ('laravel','Laravel/PHP',20),
  ('python','Python/wxPython',30),
  ('android','Android/Jetpack Compose',40),
  ('ios','iOS/SwiftUI',50),
  ('flutter','Flutter',60)
ON DUPLICATE KEY UPDATE name=VALUES(name),sort_order=VALUES(sort_order);

INSERT INTO assistive_resources (slug,name,category) VALUES
  ('jaws','JAWS','leitor de tela'),
  ('nvda','NVDA','leitor de tela'),
  ('voiceover','VoiceOver','leitor de tela'),
  ('talkback','TalkBack','leitor de tela'),
  ('switch-control','Switch Control','acesso alternativo'),
  ('switch-access','Switch Access','acesso alternativo')
ON DUPLICATE KEY UPDATE name=VALUES(name),category=VALUES(category);
