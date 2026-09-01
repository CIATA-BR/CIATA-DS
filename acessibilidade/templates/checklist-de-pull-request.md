# Template — Checklist de pull request

Use este checklist quando a mudança puder alterar comportamento, conteúdo, semântica, foco, estado, navegação, apresentação ou operação acessível.

## Antes de abrir a PR

- [ ] Identifiquei os componentes, jornadas e estados afetados.
- [ ] Consultei os padrões e receitas relacionados.
- [ ] Verifiquei se houve alteração de nome acessível, função, estado, valor ou ordem de foco.
- [ ] Verifiquei conteúdo dinâmico, mensagens, erros e confirmações quando aplicável.
- [ ] Considerei zoom, aumento de texto, contraste e preferências de movimento quando aplicável.
- [ ] Não introduzi dependência exclusiva de cor, posição, gesto preciso, arraste ou percepção visual.

## Validação

- [ ] Testes automatizados relevantes passaram.
- [ ] Realizei teste manual proporcional ao risco.
- [ ] Usei a tecnologia assistiva principal da plataforma quando a mudança afeta interação ou semântica.
- [ ] Registrei evidência suficiente para revisão quando necessário.

## Regressão

- [ ] Retestei jornadas adjacentes quando a mudança pode afetar comportamento compartilhado.
- [ ] Confirmei que correções anteriores de acessibilidade permanecem válidas.

## Release

- [ ] Não há barreira alta conhecida em jornada essencial sem tratamento formal.
- [ ] Exceções temporárias, se existirem, possuem responsável, prazo e plano de correção.