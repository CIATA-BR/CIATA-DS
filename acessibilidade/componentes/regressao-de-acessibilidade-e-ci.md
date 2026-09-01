# Regressão de acessibilidade e CI

## Contrato

Acessibilidade deve fazer parte da proteção contra regressão. Mudanças em componentes, estilos, conteúdo, navegação ou comportamento dinâmico devem acionar verificações proporcionais ao risco, sem criar confiança falsa em uma única etapa automatizada.

## Regras

- executar verificações automáticas em componentes e jornadas estáveis quando tecnicamente viável;
- bloquear regressões objetivas de alto risco previamente cobertas por testes confiáveis;
- não transformar ausência de alerta em aprovação automática de acessibilidade;
- exigir reteste manual quando a mudança afeta foco, semântica, leitura, gesto, conteúdo dinâmico ou jornada crítica;
- associar falhas de regressão ao componente ou contrato correspondente do Design System;
- revisar testes quebrados por mudança legítima de contrato em vez de apenas atualizar snapshot sem análise;
- manter histórico de regressões relevantes para orientar cobertura futura;
- incluir acessibilidade na definição de pronto da entrega.

## Estratégia recomendada

- testes unitários para estados e propriedades determinísticas;
- testes de componente para nome, função, estado, foco e relações semânticas;
- testes de integração para abertura, fechamento, retorno de foco e feedback dinâmico;
- testes de jornada para fluxos críticos;
- validação manual direcionada para comportamentos que a automação não mede adequadamente.

## Exemplo conforme

Uma alteração no componente de modal dispara testes de foco e semântica na CI. Como o gerenciamento de foco foi alterado, a PR também exige reteste manual com teclado e leitor de tela antes de ser considerada pronta.

## Exemplo não conforme

Um snapshot mudou após refatoração. A equipe aceita o novo snapshot automaticamente sem verificar que o foco deixou de retornar ao botão que abriu o modal.

## Por que falha

Snapshots e verificações estruturais podem continuar verdes enquanto a experiência real sofre regressão funcional.

## Critérios de teste

- regressões conhecidas possuem cobertura quando automatizáveis;
- mudanças de foco e interação recebem reteste manual apropriado;
- falhas de CI apontam para contrato acessível compreensível;
- snapshots alterados passam por revisão semântica;
- a cobertura evolui a partir de bugs reais;
- acessibilidade participa da decisão de release.
