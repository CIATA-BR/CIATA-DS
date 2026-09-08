<?php

declare(strict_types=1);

require __DIR__ . '/bootstrap.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') !== 'GET') {
    ciata_json(['status' => 'erro', 'mensagem' => 'Método não permitido.'], 405);
}

$slug = trim((string) ($_GET['component'] ?? ''));
if ($slug === '') {
    ciata_json(['status' => 'erro', 'mensagem' => 'Componente obrigatório.'], 422);
}

try {
    $pdo = ciata_db();
    $stmt = $pdo->prepare(
        'SELECT c.slug, c.name, p.slug AS platform, p.name AS platform_name, cps.status, cps.total_required, cps.total_pass, cps.total_fail, cps.total_blocked, cps.total_not_applicable, cps.calculated_at
         FROM components c
         CROSS JOIN platforms p
         LEFT JOIN component_platform_status cps ON cps.component_id = c.id AND cps.platform_id = p.id
         WHERE c.slug = ? AND p.active = 1
         ORDER BY p.sort_order, p.name'
    );
    $stmt->execute([$slug]);
    $rows = $stmt->fetchAll();

    if (!$rows) {
        ciata_json(['status' => 'erro', 'mensagem' => 'Componente não encontrado.'], 404);
    }

    ciata_json(['status' => 'ok', 'component' => $slug, 'platforms' => $rows]);
} catch (Throwable $error) {
    error_log('CIATA-DS validation status: ' . $error->getMessage());
    ciata_json(['status' => 'erro', 'mensagem' => 'Não foi possível consultar o status.'], 500);
}
