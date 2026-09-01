# Texto em imagem, contraste e adaptação

## Contrato

Texto essencial deve permanecer texto real sempre que possível. Quando um asset contiver texto por necessidade de marca ou composição, a informação deve continuar disponível de forma equivalente e legível nos contextos previstos.

## Regras

- evitar incorporar instruções, valores, datas, erros ou conteúdo variável em bitmap;
- logotipos e marcas podem conter texto, mas não devem carregar sozinhos informação funcional;
- garantir contraste suficiente entre texto, ícones relevantes e fundo;
- não usar transparência, gradiente ou textura que reduza a legibilidade do conteúdo essencial;
- prever versões para fundos claros, escuros e situações em que a paleta original não mantenha contraste;
- evitar distorção ou redução excessiva de texto em thumbnails e cards;
- fornecer conteúdo textual equivalente fora da imagem quando a informação não puder ser evitada dentro do asset;
- não depender apenas de cor para diferenciar estados, categorias ou séries visuais.

## Exemplo conforme

Um banner contém uma ilustração e o nome da campanha como elemento gráfico, mas o título da campanha e a chamada para ação também existem como texto real na interface.

## Exemplo não conforme

Toda a instrução de cadastro, incluindo prazo e contato, está embutida em uma imagem sem texto equivalente na página.

## Por que falha

A informação pode não acompanhar zoom, personalização de fonte, alto contraste, tradução ou tecnologia assistiva.

## Critérios de teste

- conteúdo essencial não depende de texto rasterizado;
- contraste é adequado nos fundos suportados;
- informação permanece disponível com imagens desativadas ou não percebidas;
- aumento de texto e zoom não exigem ampliar a imagem para descobrir instruções;
- estados não dependem apenas de cor.
