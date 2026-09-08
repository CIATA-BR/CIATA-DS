<?php

declare(strict_types=1);

require __DIR__ . '/bootstrap.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    ciata_json(['status' => 'erro', 'mensagem' => 'Método não permitido.'], 405);
}

$user = ciata_require_user(['admin', 'analyst']);
$payload = json_decode((string) file_get_contents('php://input'), true);
if (!is_array($payload)) {
    ciata_json(['status' => 'erro', 'mensagem' => 'JSON inválido.'], 400);
}

$url = trim((string) ($payload['url'] ?? ''));
$componentSlug = trim((string) ($payload['component_slug'] ?? ''));
$commitSha = trim((string) ($payload['commit_sha'] ?? ''));

if ($url === '' || !filter_var($url, FILTER_VALIDATE_URL)) {
    ciata_json(['status' => 'erro', 'mensagem' => 'Informe uma URL válida para a varredura.'], 422);
}

$parts = parse_url($url);
$scheme = strtolower((string) ($parts['scheme'] ?? ''));
$host = strtolower((string) ($parts['host'] ?? ''));
if (!in_array($scheme, ['http', 'https'], true) || $host === '') {
    ciata_json(['status' => 'erro', 'mensagem' => 'Somente URLs HTTP/HTTPS são permitidas.'], 422);
}

$env = ciata_load_env();
$allowedHosts = array_values(array_filter(array_map(
    static fn(string $value): string => strtolower(trim($value)),
    explode(',', (string) ($env['VALIDATOR_ALLOWED_HOSTS'] ?? 'ds.ciata.org.br'))
)));
if (!in_array($host, $allowedHosts, true)) {
    ciata_json([
        'status' => 'erro',
        'mensagem' => 'O host informado não está autorizado para varredura automática.'
    ], 422);
}

if ($commitSha !== '' && !preg_match('/^[a-f0-9]{40}$/i', $commitSha)) {
    ciata_json(['status' => 'erro', 'mensagem' => 'Commit SHA inválido.'], 422);
}

$db = ciata_db();
$componentId = null;
if ($componentSlug !== '') {
    $stmt = $db->prepare('SELECT id FROM components WHERE slug = ? LIMIT 1');
    $stmt->execute([$componentSlug]);
    $componentId = $stmt->fetchColumn();
    if (!$componentId) {
        ciata_json(['status' => 'erro', 'mensagem' => 'Componente não encontrado.'], 422);
    }
    $componentId = (int) $componentId;
}

$engines = ['axe', 'accessibility_tree', 'keyboard', 'contrast', 'viewport'];
$stmt = $db->prepare(
    'INSERT INTO automated_scan_runs (component_id, requested_by_user_id, target_url, commit_sha, status, engines_json, started_at) VALUES (?, ?, ?, ?, \'running\', ?, NOW())'
);
$stmt->execute([
    $componentId,
    (int) $user['id'],
    $url,
    $commitSha !== '' ? strtolower($commitSha) : null,
    json_encode($engines, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES),
]);
$scanId = (int) $db->lastInsertId();

$node = (string) ($env['NODE_BIN'] ?? '/usr/bin/node');
$timeout = (int) ($env['VALIDATOR_SCAN_TIMEOUT'] ?? 90);
$timeout = max(15, min($timeout, 180));
$script = realpath(__DIR__ . '/../../Validador/mcp-server/ciata/scan-page.mjs');
if ($script === false || !is_file($script)) {
    $db->prepare("UPDATE automated_scan_runs SET status='error', completed_at=NOW() WHERE id=?")->execute([$scanId]);
    ciata_json(['status' => 'erro', 'mensagem' => 'Ponte MCP não encontrada.', 'scan_id' => $scanId], 500);
}

$command = ['/usr/bin/timeout', $timeout . 's', $node, $script, $url];
$descriptors = [
    0 => ['pipe', 'r'],
    1 => ['pipe', 'w'],
    2 => ['pipe', 'w'],
];
$processEnv = $_ENV;
$processEnv['CIATA_MCP_URL'] = (string) ($env['MCP_URL'] ?? 'http://127.0.0.1:3100/mcp');

$process = proc_open($command, $descriptors, $pipes, dirname($script), $processEnv);
if (!is_resource($process)) {
    $db->prepare("UPDATE automated_scan_runs SET status='error', completed_at=NOW() WHERE id=?")->execute([$scanId]);
    ciata_json(['status' => 'erro', 'mensagem' => 'Não foi possível iniciar a varredura.', 'scan_id' => $scanId], 500);
}

fclose($pipes[0]);
$stdout = stream_get_contents($pipes[1]);
$stderr = stream_get_contents($pipes[2]);
fclose($pipes[1]);
fclose($pipes[2]);
$exitCode = proc_close($process);

$result = json_decode(trim((string) $stdout), true);
if (!is_array($result)) {
    $errorPayload = [
        'status' => 'error',
        'mensagem' => 'O motor MCP retornou uma resposta inválida.',
        'exit_code' => $exitCode,
        'stderr' => mb_substr(trim((string) $stderr), 0, 4000),
    ];
    $db->prepare("UPDATE automated_scan_runs SET status='error', result_json=?, completed_at=NOW() WHERE id=?")
        ->execute([json_encode($errorPayload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES), $scanId]);
    ciata_json(['status' => 'erro', 'mensagem' => 'Falha na execução automática.', 'scan_id' => $scanId], 502);
}

$status = (string) ($result['status'] ?? 'error');
if (!in_array($status, ['ok', 'issues', 'error'], true)) {
    $status = 'error';
}

$db->prepare('UPDATE automated_scan_runs SET status=?, result_json=?, completed_at=NOW() WHERE id=?')
    ->execute([
        $status,
        json_encode($result, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES),
        $scanId,
    ]);

ciata_json([
    'status' => $status,
    'scan_id' => $scanId,
    'target_url' => $url,
    'engines' => $result['engines'] ?? [],
]);
