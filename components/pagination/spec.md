# CMP-0011 — Pagination

## Status
Rascunho.

## Propósito
Permitir navegação previsível entre conjuntos paginados sem depender apenas de posição visual, números soltos ou gestos de ponteiro.

## Princípios
- Preferir padrões nativos de navegação da plataforma.
- Expor claramente página atual, páginas disponíveis e ações anterior/próxima quando existirem.
- Não usar somente cor para indicar página atual ou indisponibilidade.
- Preservar URLs reais em paginação de navegação Web quando possível.
- Não mover foco arbitrariamente para o topo da página após mudança; definir destino de foco conforme contexto e atualização real.
- Evitar listas de dezenas de páginas sem estratégia de compactação compreensível.

## Propriedades conceituais
- `currentPage` — página atual, iniciando em 1;
- `totalPages` — total conhecido de páginas;
- `previousLabel` e `nextLabel` — nomes claros para navegação sequencial;
- `pageLabel` — nome por página, como `Página 3`;
- `onPageChange` — ação para paginação controlada em aplicações;
- `hrefForPage` — destino real quando a navegação usar links;
- `disabled` — somente para ações indisponíveis, preservando semântica adequada.

## Semântica
Na Web, envolver o conjunto em uma região de navegação com nome, como `aria-label="Paginação"`, e usar links para navegação real. A página atual deve expor `aria-current="page"`. Não acrescentar a palavra “link” ou “botão” ao nome acessível quando o recurso de tecnologia assistiva já anuncia o papel.

## Foco e atualização
- O controle acionado mantém comportamento nativo de foco até a navegação ocorrer.
- Em atualização parcial de conteúdo, o aplicativo deve informar a mudança e posicionar foco somente quando isso for necessário para continuidade da tarefa.
- Não focar automaticamente a paginação após toda mudança.
- Quando uma página deixa de existir após filtragem, levar o usuário a uma página válida e comunicar a alteração.

## Anterior e próxima
Ações indisponíveis na primeira/última página devem ser removidas da navegação acionável ou expostas como indisponíveis com semântica nativa apropriada. Não usar link com `href` falso ou vazio para simular disabled.

## Compactação
Reticências são separadores visuais, não controles. Não devem receber foco nem nome de “mais páginas” se não executarem ação. Estratégias como primeira/última página + janela ao redor da atual devem manter ordem lógica e previsível.

## Tamanho alvo
Controles interativos seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt.

## Tema e reflow
Respeitar claro, escuro, sistema, forced colors, zoom e text scaling. O componente deve refluír ou rolar sem esconder página atual, anterior/próxima ou gerar sobreposição de texto.

## Exemplos conformes
- região `Paginação` com links `Página 1`, `Página 2`, `Página 3` e `aria-current="page"` na atual;
- botão Próxima desabilitado nativamente em paginação local sem URL;
- reticências não focáveis entre grupos de páginas;
- após filtro reduzir o total, página atual é corrigida e a mudança é comunicada.

## Exemplos não conformes
- números clicáveis em `span` com JavaScript e sem papel nativo;
- página atual indicada apenas por cor;
- link `href="#"` usado como ação desabilitada;
- reticências focáveis sem ação;
- foco enviado para a paginação após toda atualização sem necessidade;
- nomes como `Página 2, link` quando o leitor já anuncia o papel.

## Matriz mínima
Verificar região/nome, página atual, anterior/próxima, links ou botões nativos, disabled, foco, atualização de conteúdo, compactação, reticências, teclado/touch, alvo, tema, forced colors, zoom/text scaling e recursos de tecnologia assistiva.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com recurso de tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
