# Contribuição e mudança de padrões

## Contrato

Mudanças no Design System devem ser rastreáveis, revisáveis e compatíveis com o contrato de acessibilidade existente. Alterações visuais ou técnicas não podem degradar semântica, foco, operação, conteúdo ou suporte a tecnologia assistiva sem avaliação explícita.

## Regras

- toda proposta deve declarar problema, contexto, impacto esperado e padrões afetados;
- mudanças de comportamento exigem análise de acessibilidade antes do merge;
- quando um padrão substitui outro, a relação e a estratégia de migração devem ser documentadas;
- exemplos conformes e não conformes devem ser atualizados quando a mudança alterar comportamento esperado;
- alterações em nome, função, estado, foco, mensagens dinâmicas ou ordem de interação exigem reteste proporcional ao risco;
- decisões importantes devem permanecer registradas no repositório, não apenas em reuniões;
- contribuições externas ou de times consumidores seguem os mesmos critérios canônicos.

## Exemplo conforme

Uma alteração em tabs muda a navegação por teclado. A proposta explica a razão, atualiza o contrato, lista impacto em Web/Android/iOS e inclui evidência de reteste.

## Exemplo não conforme

Um componente muda interação porque a nova implementação ficou mais fácil tecnicamente, sem avaliar usuários de teclado ou leitor de tela.

## Critérios de teste

- a motivação e o impacto da mudança são rastreáveis;
- documentação e exemplos correspondem ao novo comportamento;
- regressões de acessibilidade foram avaliadas;
- consumidores recebem informação suficiente para migrar quando necessário.