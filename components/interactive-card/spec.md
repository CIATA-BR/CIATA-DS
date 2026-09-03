# CMP-0010 — Card interativo

## Status
Rascunho.

## Propósito
Agrupar conteúdo relacionado e, quando necessário, oferecer uma ação principal clara sem transformar toda a superfície em um controle ambíguo.

## Princípios
- Card puramente informativo não deve receber semântica interativa.
- Quando o card inteiro aciona uma única ação, usar a primitiva nativa equivalente a botão ou link conforme a intenção real.
- Não aninhar controles interativos dentro de outro controle interativo.
- Se houver múltiplas ações internas, o contêiner não deve ser acionável por inteiro.
- Nome acessível deve refletir o destino ou ação principal sem repetir conteúdo irrelevante.
- Estado, seleção, indisponibilidade e foco não podem depender apenas de cor, sombra ou animação.

## Propriedades conceituais
- `title` — título do conteúdo;
- `description` — resumo opcional;
- `leadingMedia` — imagem/ícone opcional;
- `actionType` — none, link ou button;
- `destination` — destino quando for navegação;
- `onActivate` — ação quando for botão;
- `selected` — somente quando o padrão realmente representar seleção;
- `disabled` — somente para cards acionáveis e quando houver semântica nativa equivalente;
- `actions` — ações internas quando o card não for uma única superfície acionável.

## Estrutura e semântica
Card informativo deve ser um agrupamento estrutural, não um botão falso. Card de navegação deve expor papel de link; card de ação deve expor papel de botão. Não adicionar as palavras “link” ou “botão” ao nome acessível quando a plataforma já anuncia o papel.

## Foco e ativação
- Cards não interativos não entram na ordem de foco.
- Card acionável recebe um único ponto de foco correspondente à ação principal.
- Link usa a ativação nativa de link; botão usa a ativação nativa de botão.
- Enter/Espaço devem seguir o comportamento nativo da plataforma, sem scripts que criem divergência.
- Foco visível deve envolver de forma perceptível a superfície acionável.

## Ações internas
Quando houver favoritar, menu, excluir ou outras ações independentes dentro do card, usar controles separados e remover a ação global do contêiner. Evitar card clicável contendo links ou botões descendentes.

## Imagens e conteúdo
Imagem decorativa deve ser ignorada pela tecnologia assistiva. Imagem informativa precisa de alternativa adequada, sem repetir título já disponível. O mascote Nexo nunca pode ser a única indicação de ação, estado ou resultado.

## Área alvo
Para card acionável, a área de ativação pode abranger a superfície inteira quando houver uma única ação. Controles internos seguem 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt.

## Estados
Hover, pressed, selected, disabled e focus devem ter diferenças perceptíveis e semânticas quando aplicáveis. Não usar `selected` apenas como decoração visual.

## Tema e reflow
Consumir tokens canônicos já publicados para superfície, texto, borda e foco. Respeitar claro, escuro, sistema, forced colors, zoom, text scaling e conteúdo refluindo sem truncar informações essenciais.

## Exemplos conformes
- card de notícia com um único link cobrindo a superfície, sem botões internos;
- card com título, descrição e botões separados “Editar” e “Excluir”, sem clique global;
- card informativo sem tabindex;
- imagem decorativa sem anúncio redundante.

## Exemplos não conformes
- `div` com `onclick` e `tabindex=0` imitando botão;
- card inteiro como link contendo outro botão;
- card informativo focável sem ação;
- estado selecionado indicado apenas por borda colorida;
- nome acessível concatenando todo o conteúdo irrelevante do card.

## Matriz mínima
Verificar papel, nome, foco, ativação, ausência de controles aninhados, ações internas, alvo, estados, imagens, teclado/touch, tema, forced colors, zoom/text scaling e tecnologias assistivas.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
