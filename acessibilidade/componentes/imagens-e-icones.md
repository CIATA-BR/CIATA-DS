# Imagens e ícones

## Contrato

Imagens e ícones devem comunicar informação equivalente independentemente da visão. Conteúdo decorativo deve ser removido da experiência assistiva; conteúdo informativo deve possuir alternativa textual adequada ao contexto e à finalidade.

## Regras

- definir primeiro se o elemento é decorativo, informativo, funcional ou complexo;
- imagem decorativa não deve gerar foco ou anúncio sem valor;
- imagem informativa deve possuir alternativa textual que comunique a informação necessária, não uma descrição puramente visual;
- ícone funcional precisa herdar ou receber nome acessível pela ação do controle;
- não repetir no texto alternativo informações já fornecidas pelo texto adjacente;
- gráficos, diagramas e mapas precisam de alternativa equivalente proporcional à complexidade;
- texto essencial não deve existir apenas dentro de uma imagem;
- estados visuais não podem depender apenas de cor, formato ou ícone.

## Web

Usar `alt` adequado em imagens. Imagens decorativas devem usar alternativa vazia quando apropriado. SVG funcional deve fazer parte de um controle com nome acessível; não transformar o próprio SVG em controle sem necessidade.

## Android

Expor descrição apenas quando a imagem carrega informação útil. Imagens puramente decorativas devem ser removidas da árvore de acessibilidade. Ícones dentro de botões não devem gerar foco separado do controle.

## iOS

Usar label acessível quando a imagem comunica informação relevante e remover elementos decorativos da navegação do VoiceOver. Ícones funcionais devem pertencer semanticamente ao controle que executa a ação.

## Exemplo conforme

Um botão de pesquisa exibe apenas o ícone de uma lupa, mas o controle possui nome acessível `Pesquisar`.

### Comportamento esperado

O leitor de tela anuncia algo equivalente a `Pesquisar, botão`. O ícone não recebe foco separado.

## Exemplo não conforme

Um ícone de lixeira é exposto isoladamente como imagem clicável, sem nome acessível e sem função de botão.

### Por que falha

A pessoa pode ouvir apenas `imagem`, ou nem encontrar o elemento pela navegação de controles. A ação destrutiva não fica identificável nem previsível.

## Critérios de teste

- imagens decorativas não adicionam ruído à navegação;
- imagens informativas possuem alternativa equivalente ao contexto;
- ícones funcionais têm nome e função corretos;
- gráficos e diagramas possuem alternativa suficiente para a tarefa;
- nenhuma informação essencial depende apenas de cor, forma ou imagem;
- ampliação e aumento de texto não ocultam conteúdo essencial.