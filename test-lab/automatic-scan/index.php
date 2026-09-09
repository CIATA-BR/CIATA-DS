<?php

declare(strict_types=1);
require __DIR__ . '/../api/bootstrap.php';
$user = ciata_current_user();
if (!$user) {
    header('Location: /login.php?next=' . rawurlencode('/automatic-scan/'));
    exit;
}
if (!in_array($user['role'], ['admin', 'analyst'], true)) {
    http_response_code(403);
    echo '<!doctype html><html lang="pt-BR"><meta charset="utf-8"><title>Acesso negado — CIATA-DS</title><main><h1>Acesso negado</h1><p>Este perfil não pode iniciar varreduras automáticas.</p></main></html>';
    exit;
}
?>
<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Varredura automática — CIATA Design System</title>
  <link rel="stylesheet" href="/styles.css">
  <link rel="stylesheet" href="/validation/validation.css">
</head>
<body>
  <a class="skip-link" href="#conteudo">Pular para o conteúdo</a>
  <header class="site-header">
    <p><a href="/">Voltar ao Test Lab</a></p>
    <p><strong>CIATA Design System</strong></p>
  </header>
  <main id="conteudo" class="page-shell">
    <h1>Varredura automática de acessibilidade</h1>
    <p>Executa os motores automáticos do Validador. O resultado serve como pré-validação e não substitui testes manuais com recursos de tecnologia assistiva.</p>

    <form id="scan-form">
      <div class="field">
        <label for="url">URL a testar</label>
        <input id="url" name="url" type="url" required placeholder="https://ds.ciata.org.br/button/">
        <p>Use uma URL pertencente a um host autorizado pelo CIATA-DS.</p>
      </div>
      <div class="field">
        <label for="component">Componente, se aplicável</label>
        <input id="component" name="component" type="text" placeholder="button">
        <p>Informe o slug do componente para vincular a varredura ao histórico dele.</p>
      </div>
      <div class="field">
        <label for="commit">Commit SHA, se aplicável</label>
        <input id="commit" name="commit" type="text" pattern="[A-Fa-f0-9]{40}" placeholder="40 caracteres hexadecimais">
      </div>
      <button id="run" type="submit">Executar varredura automática</button>
    </form>

    <section id="results" hidden aria-labelledby="results-title">
      <h2 id="results-title">Resultado da varredura</h2>
      <p id="scan-status" role="status" tabindex="-1"></p>
      <p id="manual-next" hidden></p>
      <div id="engine-results"></div>
    </section>
  </main>
<script>
const form=document.querySelector('#scan-form');
const button=document.querySelector('#run');
const section=document.querySelector('#results');
const status=document.querySelector('#scan-status');
const manualNext=document.querySelector('#manual-next');
const engines=document.querySelector('#engine-results');
const esc=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot',"'":'&#39;'}[c]));
const names={axe:'axe-core',accessibility_tree:'Árvore de acessibilidade',keyboard:'Navegação por teclado',contrast:'Contraste',viewport:'Reflow e viewport'};
form.addEventListener('submit',async e=>{
  e.preventDefault();
  button.disabled=true;
  section.hidden=false;
  manualNext.hidden=true;
  manualNext.textContent='';
  engines.innerHTML='';
  status.removeAttribute('role');
  status.setAttribute('role','status');
  status.textContent='Executando axe-core, árvore de acessibilidade, teclado, contraste e reflow. Isto pode levar alguns segundos.';
  try{
    const component=form.component.value.trim();
    const response=await fetch('/api/automatic-scan.php',{
      method:'POST',credentials:'same-origin',headers:{'Content-Type':'application/json','Accept':'application/json'},
      body:JSON.stringify({url:form.url.value.trim(),component_slug:component,commit_sha:form.commit.value.trim()})
    });
    const data=await response.json();
    if(!response.ok) throw new Error(data.mensagem||`Falha HTTP ${response.status}`);
    const label=data.status==='ok'?'nenhum problema detectado pelos motores executados':data.status==='issues'?'foram detectados pontos que exigem revisão':'a execução encontrou erros';
    status.textContent=`Varredura ${data.scan_id} concluída: ${label}.`;
    if(component){
      const link=document.createElement('a');
      link.href=`/validation/?component=${encodeURIComponent(component)}`;
      link.textContent='Continuar para a validação manual deste componente';
      manualNext.append('A varredura automática não aprova critérios por conta própria. ',link,'.');
      manualNext.hidden=false;
    }
    engines.innerHTML=(data.engines||[]).map(item=>`<section class="panel"><h3>${esc(names[item.engine]||item.engine)}</h3><p><strong>Situação:</strong> ${esc(item.status)}</p><details><summary>Ver evidência automática</summary><pre>${esc(item.output||'Sem saída textual.')}</pre></details></section>`).join('');
  }catch(error){
    status.setAttribute('role','alert');
    status.textContent=`Não foi possível concluir a varredura: ${error.message}`;
  }finally{
    button.disabled=false;
    status.focus();
  }
});
</script>
</body>
</html>
