#!/usr/bin/env php
<?php

declare(strict_types=1);
require dirname(__DIR__) . '/test-lab/api/bootstrap.php';

if (PHP_SAPI !== 'cli') {
    fwrite(STDERR, "Uso exclusivo via linha de comando.\n");
    exit(1);
}

$username = trim((string) ($argv[1] ?? ''));
$displayName = trim((string) ($argv[2] ?? ''));
$role = trim((string) ($argv[3] ?? 'analyst'));
if ($username === '' || $displayName === '' || !in_array($role, ['admin','analyst','viewer'], true)) {
    fwrite(STDERR, "Uso: php database/create-validator-user.php <usuario> \"<nome>\" [admin|analyst|viewer]\n");
    exit(1);
}

fwrite(STDOUT, "Senha para {$username}: ");
if (function_exists('shell_exec')) {
    shell_exec('stty -echo');
}
$password = rtrim((string) fgets(STDIN), "\r\n");
if (function_exists('shell_exec')) {
    shell_exec('stty echo');
}
fwrite(STDOUT, PHP_EOL);

if (strlen($password) < 12) {
    fwrite(STDERR, "A senha deve ter pelo menos 12 caracteres.\n");
    exit(1);
}

$hash = password_hash($password, PASSWORD_DEFAULT);
$pdo = ciata_db();
$stmt = $pdo->prepare('INSERT INTO validator_users (username, display_name, password_hash, role, active) VALUES (?, ?, ?, ?, 1) ON DUPLICATE KEY UPDATE display_name = VALUES(display_name), password_hash = VALUES(password_hash), role = VALUES(role), active = 1');
$stmt->execute([$username, $displayName, $hash, $role]);
fwrite(STDOUT, "Usuário {$username} salvo com perfil {$role}.\n");
