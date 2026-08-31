# Chat e mensagens em tempo real

## Objetivo

Mensagens em tempo real devem permanecer compreensíveis e operáveis sem mover foco automaticamente, interromper fala do leitor de tela de forma excessiva ou exigir acompanhamento visual contínuo.

## Regras

- novas mensagens não devem roubar o foco do campo de composição ou da mensagem atual;
- atualizações devem ser anunciadas com prioridade proporcional à importância, evitando leitura automática de cada mensagem em conversas movimentadas;
- a pessoa deve conseguir identificar remetente, horário, estado de envio e relação de resposta quando aplicável;
- mensagens não lidas devem possuir estado programaticamente perceptível e não depender apenas de cor, negrito ou posição;
- ações por mensagem, como responder, reagir, editar, copiar ou excluir, devem ter nomes acessíveis específicos ao contexto;
- histórico virtualizado deve preservar posição e contexto ao carregar mensagens anteriores;
- envio, falha, reenvio e edição devem produzir feedback acessível sem perda de foco;
- digitação de terceiros e outros sinais efêmeros não devem gerar verborragia contínua.

## Exemplo conforme

A pessoa está digitando no campo `Mensagem`. Chega uma nova mensagem de Ana. O foco permanece no campo. A interface atualiza o contador para `1 nova mensagem` em uma região de status discreta. Ao navegar até a conversa, a mensagem é apresentada como `Ana, 14:32. Vamos revisar amanhã.`

## Comportamento esperado

O leitor de tela informa que existe conteúdo novo sem interromper continuamente a tarefa atual. A pessoa decide quando navegar para a nova mensagem.

## Exemplo não conforme

Cada nova mensagem recebe foco automaticamente e é lida integralmente, deslocando a pessoa do campo de composição enquanto ela digita.

## Por que falha

A atualização dinâmica interfere na tarefa em andamento, causa perda de contexto e pode tornar conversas movimentadas praticamente inutilizáveis com tecnologia assistiva.

## Critérios mínimos de teste

- receber mensagens enquanto o foco está no compositor;
- receber várias mensagens em sequência;
- navegar entre lidas e não lidas;
- responder, editar, excluir e reenviar mensagem;
- carregar histórico anterior sem perder posição;
- validar estados enviado, enviando e falha com leitor de tela.
