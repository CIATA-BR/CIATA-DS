<?php

declare(strict_types=1);

const CIATA_DS_ENV_FILE = '/etc/ciata-ds/validator.env';

function ciata_json(array $payload, int $status = 200): never
{
    http_response_code($status);
    header('Content-Type: application/json; charset=utf-8');
    header('X-Content-Type-Options: nosniff');
    echo json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function ciata_load_env(): array
{
    if (!is_readable(CIATA_DS_ENV_FILE)) {
        throw new RuntimeException('Arquivo de configuração do CIATA-DS indisponível.');
    }

    $values = parse_ini_file(CIATA_DS_ENV_FILE, false, INI_SCANNER_RAW);
    if ($values === false) {
        throw new RuntimeException('Não foi possível ler a configuração do CIATA-DS.');
    }

    foreach (['DB_HOST', 'DB_PORT', 'DB_DATABASE', 'DB_USERNAME', 'DB_PASSWORD'] as $required) {
        if (!isset($values[$required]) || trim((string) $values[$required]) === '') {
            throw new RuntimeException("Configuração ausente: {$required}.");
        }
    }

    return $values;
}

function ciata_db(): PDO
{
    static $pdo = null;
    if ($pdo instanceof PDO) {
        return $pdo;
    }

    $env = ciata_load_env();
    $dsn = sprintf(
        'mysql:host=%s;port=%s;dbname=%s;charset=utf8mb4',
        $env['DB_HOST'],
        $env['DB_PORT'],
        $env['DB_DATABASE']
    );

    $pdo = new PDO($dsn, $env['DB_USERNAME'], $env['DB_PASSWORD'], [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);

    return $pdo;
}

function ciata_session_start(): void
{
    if (session_status() === PHP_SESSION_ACTIVE) {
        return;
    }
    ini_set('session.use_strict_mode', '1');
    ini_set('session.cookie_httponly', '1');
    ini_set('session.cookie_samesite', 'Lax');
    if (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') {
        ini_set('session.cookie_secure', '1');
    }
    session_name('CIATA_DS_VALIDATOR');
    session_start();
}

function ciata_current_user(): ?array
{
    ciata_session_start();
    if (empty($_SESSION['validator_user_id'])) {
        return null;
    }

    $stmt = ciata_db()->prepare('SELECT id, username, display_name, email, role FROM validator_users WHERE id = ? AND active = 1 LIMIT 1');
    $stmt->execute([(int) $_SESSION['validator_user_id']]);
    $user = $stmt->fetch();
    return $user ?: null;
}

function ciata_require_user(array $roles = []): array
{
    $user = ciata_current_user();
    if (!$user) {
        ciata_json(['status' => 'erro', 'mensagem' => 'Autenticação necessária.'], 401);
    }
    if ($roles && !in_array($user['role'], $roles, true)) {
        ciata_json(['status' => 'erro', 'mensagem' => 'Permissão insuficiente.'], 403);
    }
    return $user;
}
