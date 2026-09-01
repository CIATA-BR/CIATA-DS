# Falsos positivos, falsos negativos e triagem

## Contrato

Achados de ferramentas automatizadas devem passar por triagem técnica antes de serem classificados como barreira real ou descartados. A ausência de alerta não prova ausência de problema, e um alerta não prova, por si só, impacto funcional.

## Regras

- confirmar o comportamento observado no contexto real da interface;
- distinguir falha técnica detectável de impacto efetivo na jornada;
- registrar falsos positivos conhecidos com justificativa e escopo;
- revisar periodicamente supressões e exceções;
- investigar falsos negativos quando teste manual encontra barreira não apontada pela ferramenta;
- transformar falsos negativos recorrentes em novos testes quando tecnicamente viável;
- não reduzir severidade com base apenas no tipo de regra automatizada;
- preservar evidência suficiente para auditoria e reteste.

## Exemplo conforme

Uma regra automática acusa ausência de nome em um elemento visual. A triagem confirma que o elemento é decorativo e corretamente removido da árvore de acessibilidade. O achado é registrado como falso positivo contextual, sem criar bug desnecessário.

## Exemplo não conforme

Uma ferramenta não aponta problema em um botão chamado apenas `Continuar`. A equipe conclui que está acessível mesmo quando há vários botões `Continuar` sem contexto na mesma jornada.

## Por que falha

Automação não compreende toda a intenção da interface. Sem triagem, a equipe pode desperdiçar esforço em alertas irrelevantes e, ao mesmo tempo, ignorar barreiras reais que não geram alerta.

## Critérios de teste

- todo bloqueio automatizado relevante possui caminho de triagem;
- supressões são documentadas e revisáveis;
- falsos negativos encontrados manualmente são registrados;
- regras recorrentes geram aprendizado para a suíte;
- severidade segue impacto funcional, não apenas a regra da ferramenta;
- evidências permitem reproduzir a decisão de triagem.
