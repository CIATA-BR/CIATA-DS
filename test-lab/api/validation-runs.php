<?php

declare(strict_types=1);

require __DIR__ . '/bootstrap.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') !== 'POST') {
    ciata_json(['status' => 'erro', 'mensagem' => 'Método não permitido.'], 405);
}

$remoteUser = trim((string) ($_SERVER['REMOTE_USER'] ?? ''));
if ($remoteUser === '') {
    ciata_json(['status' => 'erro', 'mensagem' => 'Autenticação necessária para registrar validações.'], 401);
}

$raw = file_get_contents('php://input');
$payload = json_decode($raw ?: '{}', true);
if (!is_array($payload)) {
    ciata_json(['status' => 'erro', 'mensagem' => 'JSON inválido.'], 400);
}

$required = ['component_slug', 'platform', 'platform_version', 'assistive_resource', 'device_environment', 'matrix_path', 'tested_at', 'results'];
foreach ($required as $field) {
    if (!array_key_exists($field, $payload) || $payload[$field] === '' || $payload[$field] === []) {
        ciata_json(['status' => 'erro', 'mensagem' => "Campo obrigatório ausente: {$field}."], 422);
    }
}

if (!is_array($payload['results'])) {
    ciata_json(['status' => 'erro', 'mensagem' => 'Resultados inválidos.'], 422);
}

try {
    $pdo = ciata_db();
    $pdo->beginTransaction();

    $componentStmt = $pdo->prepare('SELECT id FROM components WHERE slug = ? LIMIT 1');
    $componentStmt->execute([$payload['component_slug']]);
    $componentId = $componentStmt->fetchColumn();
    if (!$componentId) {
        throw new RuntimeException('Componente não cadastrado na base.');
    }

    $platformStmt = $pdo->prepare('SELECT id FROM platforms WHERE slug = ? AND active = 1 LIMIT 1');
    $platformStmt->execute([$payload['platform']]);
    $platformId = $platformStmt->fetchColumn();
    if (!$platformId) {
        throw new RuntimeException('Plataforma não cadastrada na base.');
    }

    $resourceStmt = $pdo->prepare('SELECT id FROM assistive_resources WHERE LOWER(name) = LOWER(?) AND active = 1 LIMIT 1');
    $resourceStmt->execute([$payload['assistive_resource']]);
    $resourceId = $resourceStmt->fetchColumn() ?: null;

    $versionId = null;
    $commitSha = trim((string) ($payload['commit_sha'] ?? ''));
    if ($commitSha !== '' && preg_match('/^[0-9a-f]{40}$/i', $commitSha)) {
        $versionStmt = $pdo->prepare('SELECT id FROM component_versions WHERE component_id = ? AND commit_sha = ? LIMIT 1');
        $versionStmt->execute([$componentId, strtolower($commitSha)]);
        $versionId = $versionStmt->fetchColumn() ?: null;
    }

    $statusValues = array_column($payload['results'], 'status');
    $overall = in_array('fail', $statusValues, true) ? 'fail' : (in_array('blocked', $statusValues, true) ? 'blocked' : 'pass');
    if (count(array_unique($statusValues)) > 1 && $overall !== 'fail' && $overall !== 'blocked') {
        $overall = 'mixed';
    }

    $runStmt = $pdo->prepare('INSERT INTO validation_runs (component_id, component_version_id, platform_id, analyst_name_snapshot, platform_version, framework_runtime, assistive_resource_id, assistive_resource_name_snapshot, assistive_resource_version, browser_app, device_environment, product_harness, matrix_path, run_notes, overall_status, tested_at, completed_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())');
    $testedAt = (new DateTimeImmutable((string) $payload['tested_at']))->format('Y-m-d H:i:s');
    $runStmt->execute([
        $componentId,
        $versionId,
        $platformId,
        $remoteUser,
        $payload['platform_version'],
        $payload['framework_runtime'] ?? null,
        $resourceId,
        $payload['assistive_resource'],
        $payload['assistive_resource_version'] ?? null,
        $payload['browser_app'] ?? null,
        $payload['device_environment'],
        $payload['product_harness'] ?? null,
        $payload['matrix_path'],
        $payload['run_notes'] ?? null,
        $overall,
        $testedAt,
    ]);
    $runId = (int) $pdo->lastInsertId();

    $criterionLookup = $pdo->prepare('SELECT id FROM validation_criteria WHERE component_id = ? AND criterion_key = ? LIMIT 1');
    $resultStmt = $pdo->prepare('INSERT INTO validation_results (validation_run_id, validation_criterion_id, criterion_key_snapshot, criterion_name_snapshot, criterion_group_snapshot, acceptance_criteria_snapshot, status, expected_result, observed_result, severity, issue_url, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');

    foreach ($payload['results'] as $result) {
        foreach (['criterion_id', 'criterion_name', 'acceptance_criteria', 'status', 'observed'] as $field) {
            if (!isset($result[$field]) || $result[$field] === '') {
                throw new RuntimeException("Resultado incompleto: {$field}.");
            }
        }
        if (!in_array($result['status'], ['pass', 'fail', 'blocked', 'not-applicable'], true)) {
            throw new RuntimeException('Status de critério inválido.');
        }
        $criterionLookup->execute([$componentId, $result['criterion_id']]);
        $criterionId = $criterionLookup->fetchColumn() ?: null;
        $resultStmt->execute([
            $runId,
            $criterionId,
            $result['criterion_id'],
            $result['criterion_name'],
            $result['criterion_group'] ?? null,
            $result['acceptance_criteria'],
            $result['status'],
            $result['expected'] ?? null,
            $result['observed'],
            $result['severity'] ?: null,
            $result['issue_url'] ?: null,
            $result['notes'] ?: null,
        ]);
    }

    $pdo->commit();
    ciata_json(['status' => 'ok', 'validation_run_id' => $runId, 'overall_status' => $overall], 201);
} catch (Throwable $error) {
    if (isset($pdo) && $pdo instanceof PDO && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    error_log('CIATA-DS validation run: ' . $error->getMessage());
    ciata_json(['status' => 'erro', 'mensagem' => 'Não foi possível registrar a validação.'], 500);
}
