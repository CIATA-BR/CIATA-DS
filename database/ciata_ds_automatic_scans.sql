USE ciata_ds;

CREATE TABLE IF NOT EXISTS automated_scan_runs (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  component_id BIGINT UNSIGNED NULL,
  requested_by_user_id BIGINT UNSIGNED NULL,
  target_url VARCHAR(1000) NOT NULL,
  commit_sha CHAR(40) NULL,
  status ENUM('queued','running','ok','issues','error') NOT NULL DEFAULT 'queued',
  engines_json JSON NOT NULL,
  result_json LONGTEXT NULL,
  started_at DATETIME NULL,
  completed_at DATETIME NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_automated_scan_component (component_id),
  KEY idx_automated_scan_status (status),
  KEY idx_automated_scan_created (created_at),
  CONSTRAINT fk_automated_scan_component FOREIGN KEY (component_id) REFERENCES components(id) ON DELETE SET NULL,
  CONSTRAINT fk_automated_scan_user FOREIGN KEY (requested_by_user_id) REFERENCES validator_users(id) ON DELETE SET NULL
) ENGINE=InnoDB;
