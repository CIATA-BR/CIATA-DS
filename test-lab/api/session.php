<?php

declare(strict_types=1);
require __DIR__ . '/bootstrap.php';
if (($_SERVER['REQUEST_METHOD'] ?? 'GET') !== 'GET') {
    ciata_json(['status' => 'erro', 'mensagem' => 'Método não permitido.'], 405);
}
$user = ciata_current_user();
if (!$user) {
    ciata_json(['authenticated' => false], 401);
}
ciata_json(['authenticated' => true, 'user' => $user]);
