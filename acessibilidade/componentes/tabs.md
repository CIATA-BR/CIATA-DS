# Tabs

## Contrato

Tabs organiza painéis relacionados em um conjunto de abas. Deve expor relação entre aba e painel, seleção atual e navegação previsível.

## Regras

- o conjunto deve possuir contexto quando necessário;
- cada aba deve expor nome e estado selecionado;
- apenas o painel correspondente à aba ativa deve ser tratado como ativo;
- foco e seleção não devem ser confundidos;
- setas devem navegar entre abas quando o padrão da plataforma exigir;
- Tab deve mover para fora do conjunto conforme a convenção adotada;
- troca de aba não deve reposicionar foco para conteúdo arbitrário sem necessidade.

## Web

Em implementação customizada, aplicar papéis e relações ARIA apropriados entre `tablist`, `tab` e `tabpanel`, com gerenciamento correto de `aria-selected`, foco e associação entre aba e painel.

## Android e iOS

Preferir padrões nativos ou equivalentes. O leitor de tela deve anunciar o nome da aba, sua posição quando disponível e se está selecionada. A mudança de aba precisa atualizar o conteúdo sem perda de contexto.

## Exemplo conforme

Um conjunto com abas `Resumo`, `Movimentações` e `Documentos`, em que `Resumo` é anunciado como selecionado e seu painel associado é o conteúdo ativo.

### Comportamento esperado

A pessoa consegue perceber qual aba está selecionada, navegar para as demais e entender que o conteúdo abaixo mudou em função da seleção.

## Exemplo não conforme

Três textos clicáveis visualmente estilizados como abas, mas todos expostos como texto comum e sem estado selecionado.

### Por que falha

A tecnologia assistiva não identifica o padrão de tabs nem informa qual seção está ativa. A pessoa pode não perceber que o conteúdo foi trocado ou como navegar entre seções equivalentes.

## Critérios de teste

- conjunto, abas e painel possuem relações corretas;
- aba ativa é anunciada como selecionada;
- teclado/gestos seguem convenção previsível;
- foco não salta para local inesperado ao trocar de aba;
- conteúdo do painel permanece navegável;
- seleção visual não depende apenas de cor.
