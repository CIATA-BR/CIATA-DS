<?php

declare(strict_types=1);

require __DIR__ . '/bootstrap.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') !== 'GET') {
    ciata_json(['status' => 'erro', 'mensagem' => 'Método não permitido.'], 405);
}

try {
    $pdo = ciata_db();
    $row = $pdo->query(
        'SELECT DATABASE() AS database_name, CURRENT_USER() AS database_user, VERSION() AS database_version'
    )->fetch();

    ciata_json([
        'status' => 'ok',
        'servico' => 'CIATA-DS Validador',
        'database' => $row['database_name'] ?? null,
        'database_user' => $row['database_user'] ?? null,
        'database_version' => $row['database_version'] ?? null,
    ]);
} catch (Throwable $error) {
    error_log('CIATA-DS database health: ' . $error->getMessage());
    ciata_json([
        'status' => 'erro',
        'servico' => 'CIATA-DS Validador',
        'database' => 'indisponível',
    ], 503);
}
