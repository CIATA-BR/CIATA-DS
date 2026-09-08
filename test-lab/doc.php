<?php

declare(strict_types=1);

$requested = trim((string) ($_GET['path'] ?? ''));
if (!preg_match('~^components/[a-z0-9-]+/(spec|validation-matrix)\.md$~', $requested)) {
    http_response_code(400);
    header('Content-Type: text/html; charset=UTF-8');
    echo '<!doctype html><html lang="pt-BR"><meta charset="utf-8"><title>Documento inválido — CIATA-DS</title><main><h1>Documento inválido</h1><p>O caminho solicitado não é permitido.</p></main></html>';
    exit;
}

$file = realpath(__DIR__ . '/' . $requested);
$componentsRoot = realpath(__DIR__ . '/components');
if ($file === false || $componentsRoot === false || !str_starts_with($file, $componentsRoot . DIRECTORY_SEPARATOR) || !is_file($file)) {
    http_response_code(404);
    header('Content-Type: text/html; charset=UTF-8');
    echo '<!doctype html><html lang="pt-BR"><meta charset="utf-8"><title>Documento não encontrado — CIATA-DS</title><main><h1>Documento não encontrado</h1><p>Não foi possível localizar o documento solicitado.</p></main></html>';
    exit;
}

$markdown = file_get_contents($file);
if ($markdown === false) {
    http_response_code(500);
    header('Content-Type: text/html; charset=UTF-8');
    echo '<!doctype html><html lang="pt-BR"><meta charset="utf-8"><title>Erro ao abrir documento — CIATA-DS</title><main><h1>Erro ao abrir documento</h1><p>O documento não pôde ser lido.</p></main></html>';
    exit;
}

function inline_md(string $text): string
{
    $text = htmlspecialchars($text, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
    $text = preg_replace_callback('/`([^`]+)`/', static fn(array $m): string => '<code>' . $m[1] . '</code>', $text) ?? $text;
    $text = preg_replace('/\*\*([^*]+)\*\*/', '<strong>$1</strong>', $text) ?? $text;
    $text = preg_replace('/(?<!\*)\*([^*]+)\*(?!\*)/', '<em>$1</em>', $text) ?? $text;
    $text = preg_replace_callback('/\[([^\]]+)\]\(([^)]+)\)/', static function (array $m): string {
        $href = html_entity_decode($m[2], ENT_QUOTES | ENT_HTML5, 'UTF-8');
        if (!preg_match('~^(https?://|/|\./|\.\./|#)~i', $href)) {
            return $m[1] . ' (' . htmlspecialchars($href, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') . ')';
        }
        return '<a href="' . htmlspecialchars($href, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') . '">' . $m[1] . '</a>';
    }, $text) ?? $text;
    return $text;
}

function table_cells(string $line): array
{
    return array_map('trim', explode('|', trim($line, " \t|")));
}

function render_markdown(string $markdown): string
{
    $lines = preg_split('/\r?\n/', $markdown) ?: [];
    $out = [];
    $paragraph = [];
    $listType = null;
    $inCode = false;
    $code = [];

    $flushParagraph = static function () use (&$paragraph, &$out): void {
        if ($paragraph !== []) {
            $out[] = '<p>' . inline_md(implode(' ', array_map('trim', $paragraph))) . '</p>';
            $paragraph = [];
        }
    };
    $closeList = static function () use (&$listType, &$out): void {
        if ($listType !== null) {
            $out[] = '</' . $listType . '>';
            $listType = null;
        }
    };

    for ($i = 0, $count = count($lines); $i < $count; $i++) {
        $line = $lines[$i];

        if (preg_match('/^```/', $line)) {
            $flushParagraph();
            $closeList();
            if ($inCode) {
                $out[] = '<pre><code>' . htmlspecialchars(implode("\n", $code), ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') . '</code></pre>';
                $code = [];
                $inCode = false;
            } else {
                $inCode = true;
            }
            continue;
        }
        if ($inCode) {
            $code[] = $line;
            continue;
        }
        if (trim($line) === '') {
            $flushParagraph();
            $closeList();
            continue;
        }
        if (preg_match('/^(#{1,6})\s+(.+)$/', $line, $m)) {
            $flushParagraph();
            $closeList();
            $level = strlen($m[1]);
            $out[] = '<h' . $level . '>' . inline_md(trim($m[2])) . '</h' . $level . '>';
            continue;
        }
        if (str_starts_with(trim($line), '|') && isset($lines[$i + 1]) && preg_match('/^\s*\|?\s*:?-{3,}/', trim($lines[$i + 1]))) {
            $flushParagraph();
            $closeList();
            $headers = table_cells($line);
            $i += 2;
            $rows = [];
            while ($i < $count && str_starts_with(trim($lines[$i]), '|')) {
                $rows[] = table_cells($lines[$i]);
                $i++;
            }
            $i--;
            $out[] = '<div class="table-wrap"><table><thead><tr>';
            foreach ($headers as $header) {
                $out[] = '<th scope="col">' . inline_md($header) . '</th>';
            }
            $out[] = '</tr></thead><tbody>';
            foreach ($rows as $row) {
                $out[] = '<tr>';
                foreach ($row as $cell) {
                    $out[] = '<td>' . inline_md($cell) . '</td>';
                }
                $out[] = '</tr>';
            }
            $out[] = '</tbody></table></div>';
            continue;
        }
        if (preg_match('/^\s*[-*+]\s+(.+)$/', $line, $m)) {
            $flushParagraph();
            if ($listType !== 'ul') {
                $closeList();
                $listType = 'ul';
                $out[] = '<ul>';
            }
            $item = trim($m[1]);
            if (preg_match('/^\[([ xX])\]\s*(.*)$/', $item, $check)) {
                $state = strtolower($check[1]) === 'x' ? 'Concluído' : 'Pendente';
                $out[] = '<li><span class="task-state">' . $state . ':</span> ' . inline_md($check[2]) . '</li>';
            } else {
                $out[] = '<li>' . inline_md($item) . '</li>';
            }
            continue;
        }
        if (preg_match('/^\s*\d+[.)]\s+(.+)$/', $line, $m)) {
            $flushParagraph();
            if ($listType !== 'ol') {
                $closeList();
                $listType = 'ol';
                $out[] = '<ol>';
            }
            $out[] = '<li>' . inline_md(trim($m[1])) . '</li>';
            continue;
        }
        if (preg_match('/^>\s?(.*)$/', $line, $m)) {
            $flushParagraph();
            $closeList();
            $out[] = '<blockquote><p>' . inline_md($m[1]) . '</p></blockquote>';
            continue;
        }
        if (preg_match('/^\s*(---+|\*\*\*+)\s*$/', $line)) {
            $flushParagraph();
            $closeList();
            $out[] = '<hr>';
            continue;
        }
        $paragraph[] = $line;
    }

    if ($inCode) {
        $out[] = '<pre><code>' . htmlspecialchars(implode("\n", $code), ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') . '</code></pre>';
    }
    $flushParagraph();
    $closeList();
    return implode("\n", $out);
}

$title = basename(dirname($file)) . ' — ' . basename($file);
if (preg_match('/^#\s+(.+)$/m', $markdown, $m)) {
    $title = trim($m[1]);
}

header('Content-Type: text/html; charset=UTF-8');
header('X-Content-Type-Options: nosniff');
?>
<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title><?= htmlspecialchars($title, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?> — CIATA Design System</title>
  <link rel="stylesheet" href="/styles.css">
  <link rel="stylesheet" href="/doc.css">
</head>
<body>
  <a class="skip-link" href="#conteudo">Pular para o conteúdo</a>
  <header class="site-header">
    <p><a href="/">← Voltar ao Test Lab</a></p>
    <p><strong>CIATA Design System</strong></p>
  </header>
  <main id="conteudo" class="document-page">
    <nav class="document-actions" aria-label="Ações do documento">
      <a href="/<?= htmlspecialchars($requested, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?>">Ver Markdown original</a>
    </nav>
    <article class="markdown-body">
      <?= render_markdown($markdown) ?>
    </article>
  </main>
</body>
</html>
