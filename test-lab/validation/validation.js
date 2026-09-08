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
const storageKey=`ciata-ds-validation-draft:${component}`;

const esc=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
const stripMd=s=>String(s??'').replace(/`([^`]+)`/g,'$1').replace(/\*\*([^*]+)\*\*/g,'$1').replace(/\[([^\]]+)\]\([^\)]+\)/g,'$1').trim();
const slug=s=>stripMd(s).toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,'').replace(/[^a-z0-9]+/g,'-').replace(/^-|-$/g,'');

function parseMatrix(md){
  const lines=md.split(/\r?\n/);
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
      continue;
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
  return `<fieldset class="criterion" data-criterion-id="${esc(c.id)}" data-criterion-name="${esc(c.name)}" data-criterion-acceptance="${esc(c.acceptance)}" data-group="${esc(c.group)}"><legend><strong>${esc(c.id)} — ${esc(c.name)}</strong></legend><p class="acceptance">${esc(c.acceptance)}</p><div class="criterion-grid"><label for="${key}-status">Resultado</label><select id="${key}-status" data-field="status" required><option value="">Selecione</option><option value="pass">Passou</option><option value="fail">Falhou</option><option value="blocked">Bloqueado</option><option value="not-applicable">Não aplicável</option></select><label for="${key}-expected">Resultado esperado</label><textarea id="${key}-expected" data-field="expected" rows="2">${esc(c.acceptance)}</textarea><label for="${key}-observed">Resultado observado</label><textarea id="${key}-observed" data-field="observed" rows="3" required></textarea><label for="${key}-severity">Severidade da falha</label><select id="${key}-severity" data-field="severity"><option value="">Não se aplica</option><option value="low">Baixa</option><option value="medium">Média</option><option value="high">Alta</option><option value="critical">Crítica</option></select><label for="${key}-issue">Issue/PR relacionada</label><input id="${key}-issue" data-field="issue" type="url"><label for="${key}-notes">Observações/evidências</label><textarea id="${key}-notes" data-field="notes" rows="3"></textarea></div></fieldset>`;
}

function serialize(){
  const fd=new FormData(form);
  return {
    schema_version:'1.0',
    component_slug:component,
    matrix_path:`components/${repoComponent}/validation-matrix.md`,
    analyst:fd.get('analyst'),platform:fd.get('platform'),platform_version:fd.get('platform_version'),framework_runtime:fd.get('framework_runtime'),assistive_resource:fd.get('assistive_resource'),assistive_resource_version:fd.get('assistive_resource_version'),browser_app:fd.get('browser_app'),device_environment:fd.get('device_environment'),commit_sha:fd.get('commit_sha'),product_harness:fd.get('product_harness'),run_notes:fd.get('run_notes'),
    tested_at:new Date().toISOString(),
    results:[...document.querySelectorAll('.criterion')].map(fs=>({criterion_id:fs.dataset.criterionId,criterion_name:fs.dataset.criterionName,criterion_group:fs.dataset.group,acceptance_criteria:fs.dataset.criterionAcceptance,status:fs.querySelector('[data-field=status]').value,expected:fs.querySelector('[data-field=expected]').value,observed:fs.querySelector('[data-field=observed]').value,severity:fs.querySelector('[data-field=severity]').value||null,issue_url:fs.querySelector('[data-field=issue]').value||null,notes:fs.querySelector('[data-field=notes]').value||null}))
  };
}

function saveDraft(){localStorage.setItem(storageKey,JSON.stringify(serialize()));statusEl.hidden=false;statusEl.textContent='Rascunho salvo neste navegador.';}
function restoreDraft(){
  const raw=localStorage.getItem(storageKey);if(!raw)return;
  try{const d=JSON.parse(raw);['analyst','platform','platform_version','framework_runtime','assistive_resource','assistive_resource_version','browser_app','device_environment','commit_sha','product_harness','run_notes'].forEach(k=>{const el=form.elements[k];if(el)el.value=d[k]||''});const byId=new Map((d.results||[]).map(r=>[r.criterion_id,r]));document.querySelectorAll('.criterion').forEach(fs=>{const r=byId.get(fs.dataset.criterionId);if(!r)return;for(const [field,val] of Object.entries({status:r.status,expected:r.expected,observed:r.observed,severity:r.severity,issue:r.issue_url,notes:r.notes})){const el=fs.querySelector(`[data-field=${field}]`);if(el)el.value=val||'';}});statusEl.hidden=false;statusEl.textContent='Rascunho restaurado.';}catch{}
}

form.addEventListener('submit',e=>{e.preventDefault();if(!form.reportValidity())return;const payload=serialize();const invalid=payload.results.find(r=>!r.status||!r.observed);if(invalid){document.querySelector(`[data-criterion-id="${CSS.escape(invalid.criterion_id)}"] [data-field=status]`)?.focus();return;}resultEl.textContent=JSON.stringify(payload,null,2);resultPanel.hidden=false;resultPanel.scrollIntoView({block:'start'});resultEl.focus();});
document.querySelector('#save-draft').addEventListener('click',saveDraft);
document.querySelector('#clear-draft').addEventListener('click',()=>{localStorage.removeItem(storageKey);form.reset();statusEl.hidden=false;statusEl.textContent='Rascunho removido.';});

fetch(matrixUrl).then(r=>{if(!r.ok)throw new Error(`HTTP ${r.status}`);return r.text();}).then(md=>{const model=parseMatrix(md);titleEl.textContent=`${model.title} — formulário`;originEl.innerHTML=`Fonte canônica: <a href="${matrixUrl}">${esc(matrixUrl)}</a>`;renderCriteria(model);form.hidden=false;statusEl.hidden=true;restoreDraft();}).catch(err=>{statusEl.textContent=`Não foi possível carregar a matriz: ${err.message}`;statusEl.setAttribute('role','alert');});
