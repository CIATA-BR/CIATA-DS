(async()=>{
  try{
    const response=await fetch('/api/session.php',{headers:{Accept:'application/json'},credentials:'same-origin'});
    if(response.status===401){
      const next=location.pathname+location.search;
      location.replace(`/login.php?next=${encodeURIComponent(next)}`);
      return;
    }
    if(!response.ok)return;
    const data=await response.json();
    const analyst=document.querySelector('#analyst');
    if(analyst&&data.user){
      analyst.value=data.user.display_name||data.user.username||'';
      analyst.readOnly=true;
    }
  }catch{}
})();
