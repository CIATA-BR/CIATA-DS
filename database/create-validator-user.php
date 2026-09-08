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

function readHiddenPassword(string $instruction): string
{
    fwrite(STDOUT, $instruction . PHP_EOL);
    fwrite(STDOUT, "A senha não será exibida enquanto é digitada. Pressione Enter ao terminar." . PHP_EOL);

    $sttyAvailable = function_exists('shell_exec') && trim((string) shell_exec('command -v stty 2>/dev/null')) !== '';
    if ($sttyAvailable) {
        shell_exec('stty -echo');
    }

    try {
        $value = fgets(STDIN);
        if ($value === false) {
            throw new RuntimeException('Não foi possível ler a senha do terminal.');
        }
        return rtrim($value, "\r\n");
    } finally {
        if ($sttyAvailable) {
            shell_exec('stty echo');
        }
        fwrite(STDOUT, PHP_EOL);
    }
}

$password = readHiddenPassword("Digite a nova senha para o usuário {$username}.");
if (strlen($password) < 12) {
    fwrite(STDERR, "A senha deve ter pelo menos 12 caracteres. Nenhuma alteração foi feita.\n");
    exit(1);
}

$confirmation = readHiddenPassword("Digite a mesma senha novamente para confirmar.");
if (!hash_equals($password, $confirmation)) {
    fwrite(STDERR, "As senhas não conferem. Nenhuma alteração foi feita.\n");
    exit(1);
}

$hash = password_hash($password, PASSWORD_DEFAULT);
if ($hash === false) {
    fwrite(STDERR, "Não foi possível gerar o hash da senha. Nenhuma alteração foi feita.\n");
    exit(1);
}

$pdo = ciata_db();
$stmt = $pdo->prepare('INSERT INTO validator_users (username, display_name, password_hash, role, active) VALUES (?, ?, ?, ?, 1) ON DUPLICATE KEY UPDATE display_name = VALUES(display_name), password_hash = VALUES(password_hash), role = VALUES(role), active = 1');
$stmt->execute([$username, $displayName, $hash, $role]);
fwrite(STDOUT, "Usuário {$username} salvo com perfil {$role}.\n");
