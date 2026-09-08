<?php

declare(strict_types=1);
require __DIR__ . '/api/bootstrap.php';
ciata_session_start();

$error = '';
$next = (string) ($_GET['next'] ?? $_POST['next'] ?? '/validation/');
if (!str_starts_with($next, '/')) {
    $next = '/validation/';
}

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'POST') {
    $username = trim((string) ($_POST['username'] ?? ''));
    $password = (string) ($_POST['password'] ?? '');
    $stmt = ciata_db()->prepare('SELECT id, username, display_name, password_hash, role FROM validator_users WHERE username = ? AND active = 1 LIMIT 1');
    $stmt->execute([$username]);
    $user = $stmt->fetch();
    if ($user && password_verify($password, $user['password_hash'])) {
        session_regenerate_id(true);
        $_SESSION['validator_user_id'] = (int) $user['id'];
        ciata_db()->prepare('UPDATE validator_users SET last_login_at = NOW() WHERE id = ?')->execute([(int) $user['id']]);
        header('Location: ' . $next, true, 303);
        exit;
    }
    $error = 'Usuário ou senha inválidos.';
}
?>
<!doctype html>
<html lang="pt-BR">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Entrar — CIATA Design System</title><link rel="stylesheet" href="/styles.css"><link rel="stylesheet" href="/validation/validation.css"></head>
<body><a class="skip-link" href="#main">Pular para o conteúdo</a><main id="main" class="panel" style="max-width:34rem;margin:3rem auto"><p><strong>CIATA Design System</strong></p><h1>Entrar no Validador</h1><?php if ($error !== ''): ?><p class="status" role="alert"><?= htmlspecialchars($error, ENT_QUOTES, 'UTF-8') ?></p><?php endif; ?><form method="post"><input type="hidden" name="next" value="<?= htmlspecialchars($next, ENT_QUOTES, 'UTF-8') ?>"><p><label for="username">Usuário</label><input id="username" name="username" autocomplete="username" required autofocus></p><p><label for="password">Senha</label><input id="password" name="password" type="password" autocomplete="current-password" required></p><button type="submit">Entrar</button></form></main></body></html>
