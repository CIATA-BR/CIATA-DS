# Definição de pronto — QA

Antes de aprovar a entrega, QA deve confirmar que:

- critérios de acessibilidade aplicáveis foram derivados do componente, jornada e risco da mudança;
- testes automatizados foram executados quando úteis, sem substituir validação manual;
- teclado ou mecanismo equivalente cobre todas as ações relevantes;
- leitor de tela principal da plataforma percorre a jornada sem perda de contexto;
- foco visual e foco de acessibilidade permanecem previsíveis;
- nome, função, estado, valor e mensagens dinâmicas estão corretos;
- zoom, aumento de texto, orientação e layout adaptável foram exercitados quando aplicáveis;
- contraste e percepção não dependem apenas de cor;
- erros, validações, loading, sucesso e estados vazios foram testados;
- regressões em componentes compartilhados foram consideradas além da tela alterada;
- achados possuem ambiente, passos, comportamento observado, esperado e evidência suficiente;
- severidade é atribuída pelo impacto funcional, não pelo nível WCAG ou pela ferramenta que encontrou o problema;
- correção só é encerrada após reteste em build identificável;
- barreira alta em jornada essencial impede aprovação enquanto permanecer ativa, salvo decisão formal excepcional prevista na governança.

## Evidência mínima

Registrar plataforma, versão/build, tecnologia assistiva quando aplicável, passos reproduzíveis, resultado observado e status do reteste.

## Referências

- [Processo de auditoria](../processo-de-auditoria.md)
- [Evidências de auditoria](../evidencias-de-auditoria.md)
- [Severidade de bugs](../severidade-de-bugs.md)
- [Matriz mestra de rastreabilidade](../rastreabilidade/matriz-mestra.md)
- [Gate de acessibilidade para release](../componentes/gate-de-acessibilidade-para-release.md)
