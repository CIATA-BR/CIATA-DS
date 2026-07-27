# Marca CIATA

Fonte oficial: **Manual de Marca CIATA 2025**, produzido pela Agência PUC de Comunicação.

## Estrutura

- `manual/`: manual oficial e orientações institucionais.
- `logotipos/`: composições horizontal, vertical e monocromáticas aprovadas.
- `paleta-de-cores/`: referências cromáticas institucionais.
- `tipografia/`: especificações tipográficas.
- `icones/`: ícones institucionais e símbolos complementares quando aprovados.

## Composições oficiais

- `logotipos/ciata-logo-horizontal.svg`: versão preferencial para cabeçalhos e interfaces digitais quando o fundo e o espaço forem adequados.
- `logotipos/ciata-logo-vertical.svg`: versão para áreas em que o espaço favoreça uma composição vertical.
- `logotipos/ciata-logo-monocromatico-fundo-escuro.svg`: composição oficial para fundos escuros.
- `logotipos/ciata-logo-monocromatico-fundo-claro.svg`: composição oficial para fundos claros.

Arquivos PNG podem ser mantidos como alternativas rasterizadas. Para web, priorize SVG.

## Regras invioláveis

- Não redesenhar, traçar, simplificar ou reinterpretar.
- Não girar, distorcer, recortar, recolorir ou aplicar efeitos.
- Não criar símbolo isolado ou nova variante.
- Não alterar a relação entre símbolo, nome e assinatura.
- Preservar proporção, área de proteção e tamanho mínimo.
- Não inventar versão escura ou clara fora das composições aprovadas.

## Cores oficiais

- Amarelo: `#FFD000`
- Cinza: `#B3B3B3`
- Azul: `#005C99`
- Azul escuro: `#16365E`

As cores da marca não devem ser usadas cegamente em interfaces. Para componentes e páginas, use os tokens semânticos publicados em `tokens/` e valide contraste WCAG 2.2 AA.

## Tipografia

A família institucional é **Segoe UI**. Produtos digitais devem utilizar fallbacks de sistema e não carregar arquivos externos da fonte quando isso não for necessário.

## Acessibilidade

Consulte [`acessibilidade/marca.md`](../acessibilidade/marca.md). Em resumo:

- no link da página inicial, use nome acessível como `Página inicial do CIATA` e `alt=""` na imagem;
- como imagem informativa isolada, use `CIATA - Centro de Inclusão Através da Tecnologia Assistiva`;
- não use fundo CSS quando a marca precisar ser anunciada;
- defina dimensões intrínsecas e preserve a proporção.
