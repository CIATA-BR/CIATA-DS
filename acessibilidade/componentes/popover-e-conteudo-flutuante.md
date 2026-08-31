# Popover e conteúdo flutuante

## Contrato

Popover apresenta conteúdo contextual adicional acionado por um controle e pode conter informação ou interação. Deve ser distinguido de tooltip, menu e dialog conforme a função real do conteúdo.

## Regras

- o acionador possui nome claro e expõe estado aberto/fechado quando aplicável;
- a relação entre acionador e conteúdo é programaticamente identificável quando necessário;
- o foco inicial depende do tipo de conteúdo: conteúdo apenas informativo pode manter foco no acionador; conteúdo interativo deve oferecer percurso previsível;
- Escape fecha o popover quando esse comportamento é esperado na plataforma;
- ao fechar, o foco retorna ao acionador ou contexto lógico equivalente;
- conteúdo essencial não depende apenas de hover;
- não usar tooltip para conteúdo interativo;
- não usar dialog quando não há necessidade de modalização ou mudança de contexto;
- clicar/tocar fora pode fechar o popover, mas não deve ser o único mecanismo disponível para teclado e tecnologia assistiva.

## Exemplo conforme

Botão `Filtros adicionais`, com estado expandido. Ao abrir, exibe controles adicionais relacionados à busca; o foco permanece previsível e retorna ao botão ao fechar.

## Comportamento esperado

A pessoa entende que o controle abre conteúdo adicional, consegue navegar por ele sem perder o contexto da página e consegue fechar sem procurar visualmente uma área externa.

## Exemplo não conforme

Ícone sem nome que abre conteúdo interativo apenas no hover; o painel desaparece ao tentar mover o ponteiro e não pode ser fechado por teclado.

## Por que falha

A função do acionador é desconhecida, o conteúdo pode ser inacessível para toque/leitor de tela e a pessoa pode ficar presa ou perder o contexto.

## Critérios de teste

- acionador possui nome e estado coerentes;
- abertura e fechamento são percebidos;
- foco permanece previsível;
- Escape/fechamento equivalente funciona quando aplicável;
- foco retorna corretamente ao contexto anterior;
- conteúdo interativo não é implementado como tooltip;
- conteúdo essencial não depende apenas de hover.

Veja também [Tooltip](tooltip.md), [Menu](menu.md), [Modal e dialog](modal-e-dialog.md) e [Foco e contexto](../receitas/foco-e-contexto.md).