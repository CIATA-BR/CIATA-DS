const params=new URLSearchParams(location.search);
const component=params.get('component')||'button';
const repoComponent=component==='card-interativo'?'interactive-card':component;
const matrixUrl=`/components/${repoComponent}/validation-matrix.md`;
const statusEl=document.querySelector('#load-status');
const form=document.querySelector('#validation-form');
const criteriaEl=document.querySelector('#criteria');
const titleEl=document.querySelector('#page-title');
const originEl=document.querySelector('#matrix-origin');
const resultPanel=document.querySelector('#result-panel');
const resultEl=document.querySelector('#result');
const persistStatusEl=document.querySelector('#persist-status');
const componentStatusPanel=document.querySelector('#component-status-panel');
const componentStatusEl=document.querySelector('#component-status');
const submitButton=document.querySelector('#submit-validation');
const storageKey=`ciata-ds-validation-draft:${component}`;

const esc=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
const stripMd=s=>String(s??'').replace(/`([^`]+)`/g,'$1').replace(/\*\*([^*]+)\*\*/g,'$1').replace(/\[([^\]]+)\]\([^\)]+\)/g,'$1').trim();
const normalizeTerminology=s=>String(s??'').replace(/(?<!recursos de )tecnologia assistiva/gi,'recursos de tecnologia assistiva');

function parseMatrix(md){
  const lines=normalizeTerminology(md).split(/\r?\n/);
  const title=stripMd((lines.find(l=>l.startsWith('# '))||'# Matriz de validação').slice(2));
  const criteria=[];
  let section='Geral';
  let subsection='';
  let generated=1;

  for(let i=0;i<lines.length;i++){
    const line=lines[i].trim();
    if(line.startsWith('## ')){section=stripMd(line.slice(3));subsection='';continue;}
    if(line.startsWith('### ')){subsection=stripMd(line.slice(4));continue;}

    if(/^\|\s*ID\s*\|/i.test(line)){
      i+=2;
      for(;i<lines.length;i++){
        const row=lines[i].trim();
        if(!row.startsWith('|')){i--;break;}
        const cells=row.split('|').slice(1,-1).map(c=>stripMd(c.trim()));
        if(cells.length>=3&&cells[0]) criteria.push({id:cells[0],name:cells[1],acceptance:cells[2],group:section,source:'table'});
      }
      continue;
    }

    const check=line.match(/^- \[[ xX]\]\s+(.+?);?$/);
    if(check){
      const name=stripMd(check[1]);
      criteria.push({id:`AUTO-${String(generated++).padStart(3,'0')}`,name,acceptance:name,group:subsection?`${section} — ${subsection}`:section,source:'checklist'});
    }
  }
  return {title,criteria};
}

function renderCriteria(model){
  if(!model.criteria.length){criteriaEl.innerHTML='<p>Nenhum cenário estruturável foi encontrado na matriz.</p>';return;}
  const groups=new Map();
  model.criteria.forEach(c=>{if(!groups.has(c.group))groups.set(c.group,[]);groups.get(c.group).push(c)});
  criteriaEl.innerHTML=[...groups.entries()].map(([group,items])=>`<section class="platform-group"><h3>${esc(group)}</h3>${items.map((c,index)=>criterionHtml(c,index)).join('')}</section>`).join('');
}

function criterionHtml(c,index){
  const key=`criterion-${index}`;
  const context=`${c.id} — ${c.name}`;
  return `<fieldset class="criterion" data-criterion-id="${esc(c.id)}" data-criterion-name="${esc(c.name)}" data-criterion-acceptance="${esc(c.acceptance)}" data-group="${esc(c.group)}"><legend><strong>${esc(context)}</strong></legend><p class="acceptance"><strong>Critério de aceitação:</strong> ${esc(c.acceptance)}</p><div class="criterion-grid"><label for="${key}-status">Situação</label><select id="${key}-status" data-field="status" required aria-label="${esc(context)} — situação"><option value="">Selecione</option><option value="pass">Passou</option><option value="fail">Falhou</option><option value="blocked">Bloqueado</option><option value="not-applicable">Não aplicável</option></select><label for="${key}-observed">O que foi observado</label><textarea id="${key}-observed" data-field="observed" rows="3" required aria-label="${esc(context)} — o que foi observado"></textarea></div><details><summary>Detalhes adicionais deste critério</summary><div class="criterion-grid"><label for="${key}-severity">Severidade, se houver falha</label><select id="${key}-severity" data-field="severity"><option value="">Não se aplica</option><option value="low">Baixa</option><option value="medium">Média</option><option value="high">Alta</option><option value="critical">Crítica</option></select><label for="${key}-issue">Issue ou PR relacionada</label><input id="${key}-issue" data-field="issue" type="url"><label for="${key}-notes">Observações ou evidências adicionais</label><textarea id="${key}-notes" data-field="notes" rows="3"></textarea></div></details></fieldset>`;
}

function serialize(){
  const fd=new FormData(form);
  return {
    schema_version:'1.0',
    component_slug:component,
    matrix_path:`components/${repoComponent}/validation-matrix.md`,
    analyst:fd.get('analyst'),platform:fd.get('platform'),platform_version:fd.get('platform_version'),framework_runtime:fd.get('framework_runtime'),assistive_resource:fd.get('assistive_resource'),assistive_resource_version:fd.get('assistive_resource_version'),browser_app:fd.get('browser_app'),device_environment:fd.get('device_environment'),commit_sha:fd.get('commit_sha'),product_harness:fd.get('product_harness'),run_notes:fd.get('run_notes'),
    tested_at:new Date().toISOString(),
    results:[...document.querySelectorAll('.criterion')].map(fs=>({criterion_id:fs.dataset.criterionId,criterion_name:fs.dataset.criterionName,criterion_group:fs.dataset.group,acceptance_criteria:fs.dataset.criterionAcceptance,status:fs.querySelector('[data-field=status]').value,expected:fs.dataset.criterionAcceptance,observed:fs.querySelector('[data-field=observed]').value,severity:fs.querySelector('[data-field=severity]').value||null,issue_url:fs.querySelector('[data-field=issue]').value||null,notes:fs.querySelector('[data-field=notes]').value||null}))
  };
}

function saveDraft(){localStorage.setItem(storageKey,JSON.stringify(serialize()));statusEl.hidden=false;statusEl.textContent='Rascunho salvo neste navegador.';}
function restoreDraft(){
  const raw=localStorage.getItem(storageKey);if(!raw)return;
  try{const d=JSON.parse(raw);['analyst','platform','platform_version','framework_runtime','assistive_resource','assistive_resource_version','browser_app','device_environment','commit_sha','product_harness','run_notes'].forEach(k=>{const el=form.elements[k];if(el)el.value=d[k]||''});const byId=new Map((d.results||[]).map(r=>[r.criterion_id,r]));document.querySelectorAll('.criterion').forEach(fs=>{const r=byId.get(fs.dataset.criterionId);if(!r)return;for(const [field,val] of Object.entries({status:r.status,observed:r.observed,severity:r.severity,issue:r.issue_url,notes:r.notes})){const el=fs.querySelector(`[data-field=${field}]`);if(el)el.value=val||'';}});statusEl.hidden=false;statusEl.textContent='Rascunho restaurado.';}catch{}
}

function statusLabel(value){return ({not_started:'Não iniciado',in_validation:'Em validação',has_failures:'Com falhas',blocked:'Bloqueado',validated:'Validado',stable:'Estável'})[value]||'Não iniciado';}

async function loadComponentStatus(){
  try{
    const response=await fetch(`/api/status.php?component=${encodeURIComponent(component)}`,{headers:{Accept:'application/json'}});
    if(!response.ok)return;
    const data=await response.json();
    componentStatusEl.innerHTML=`<ul>${data.platforms.map(item=>`<li><strong>${esc(item.platform_name)}</strong>: ${esc(statusLabel(item.status))}; passou ${Number(item.total_pass||0)}, falhou ${Number(item.total_fail||0)}, bloqueado ${Number(item.total_blocked||0)}, não aplicável ${Number(item.total_not_applicable||0)}.</li>`).join('')}</ul>`;
    componentStatusPanel.hidden=false;
  }catch{}
}

async function persistValidation(payload){
  submitButton.disabled=true;
  persistStatusEl.textContent='Registrando validação…';
  try{
    const response=await fetch('/api/validation-runs.php',{
      method:'POST',
      headers:{'Content-Type':'application/json','Accept':'application/json'},
      credentials:'same-origin',
      body:JSON.stringify(payload)
    });
    let data={};
    try{data=await response.json();}catch{}
    if(response.status===401)throw new Error('Entre novamente no Validador para registrar a validação.');
    if(response.ok===false)throw new Error(data.mensagem||`Falha HTTP ${response.status}.`);
    localStorage.removeItem(storageKey);
    persistStatusEl.textContent=`Validação registrada com sucesso. Execução ${data.validation_run_id}. Status da plataforma: ${statusLabel(data.platform_status)}.`;
    await loadComponentStatus();
  }catch(error){
    persistStatusEl.textContent=`Não foi possível registrar: ${error.message}`;
    persistStatusEl.setAttribute('role','alert');
  }finally{
    submitButton.disabled=false;
  }
}

form.addEventListener('submit',async e=>{
  e.preventDefault();
  if(!form.reportValidity())return;
  const payload=serialize();
  const invalid=payload.results.find(r=>!r.status||!r.observed);
  if(invalid){document.querySelector(`[data-criterion-id="${CSS.escape(invalid.criterion_id)}"] [data-field=status]`)?.focus();return;}
  resultEl.textContent=JSON.stringify(payload,null,2);
  resultPanel.hidden=false;
  persistStatusEl.removeAttribute('role');
  await persistValidation(payload);
  resultPanel.scrollIntoView({block:'start'});
  persistStatusEl.focus?.();
});

document.querySelector('#save-draft').addEventListener('click',saveDraft);
document.querySelector('#clear-draft').addEventListener('click',()=>{localStorage.removeItem(storageKey);form.reset();statusEl.hidden=false;statusEl.textContent='Rascunho removido.';});

fetch(matrixUrl).then(r=>{if(!r.ok)throw new Error(`HTTP ${r.status}`);return r.text();}).then(md=>{const model=parseMatrix(md);titleEl.textContent=`${model.title} — formulário`;originEl.innerHTML=`Fonte canônica: <a href="${matrixUrl}">${esc(matrixUrl)}</a>`;renderCriteria(model);form.hidden=false;statusEl.hidden=true;restoreDraft();loadComponentStatus();}).catch(err=>{statusEl.textContent=`Não foi possível carregar a matriz: ${err.message}`;statusEl.setAttribute('role','alert');});
