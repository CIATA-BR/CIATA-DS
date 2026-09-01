# Menções, presença e status

## Objetivo

Menções, presença e estados de disponibilidade devem ser identificáveis sem depender apenas de cor, avatar, posição ou animação e sem produzir anúncios excessivos quando mudam com frequência.

## Regras

- menções devem ser distinguíveis programaticamente e compreensíveis no contexto da mensagem;
- estados como online, ausente, ocupado e offline devem possuir equivalente textual quando relevantes à tarefa;
- mudanças de presença não devem ser anunciadas continuamente por leitor de tela salvo quando forem essenciais;
- avatares decorativos não devem duplicar o nome da pessoa na árvore de acessibilidade;
- indicadores de status devem preservar nome, estado e relação com a pessoa ou canal correspondente;
- sugestões de menção devem funcionar por teclado, toque e tecnologia assistiva sem mover foco de modo inesperado;
- nomes iguais devem possuir contexto adicional quando necessário para desambiguação;
- indicadores efêmeros, como “digitando”, devem ser discretos e não bloquear conteúdo principal.

## Exemplo conforme

Ao digitar `@an`, surge uma lista de sugestões operável por teclado e leitor de tela. Cada opção informa nome e contexto suficiente, por exemplo `Ana Souza, Produto`. Depois da seleção, a menção é lida como parte da mensagem sem criar foco separado desnecessário.

## Comportamento esperado

A pessoa entende quem foi mencionado e o estado relevante sem depender de bolinhas coloridas, fotos ou posição visual.

## Exemplo não conforme

Usuários online aparecem somente com um círculo verde ao lado do avatar e a lista de menções só pode ser escolhida com mouse.

## Por que falha

O estado não é percebido por quem não enxerga a cor e a ação de mencionar fica indisponível para quem usa teclado ou tecnologia assistiva.

## Critérios mínimos de teste

- abrir sugestões de menção e selecionar uma opção sem mouse;
- validar nomes duplicados e contexto de desambiguação;
- verificar presença com e sem percepção de cor;
- observar mudanças frequentes de status com leitor de tela;
- confirmar que avatar decorativo não duplica anúncio.
