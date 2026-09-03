# CMP-0013 — Tabs

## Status
Rascunho.

## Propósito
Organizar conteúdos relacionados em painéis alternáveis sem transformar abas em navegação de página nem exigir exploração visual para compreender qual painel está ativo.

## Princípios
- Usar tabs apenas para alternar painéis dentro do mesmo contexto; para mudança de página/URL preferir navegação por links.
- Uma aba ativa deve ser identificável semanticamente e visualmente.
- Tablist, tab e tabpanel devem manter relação programática clara quando a plataforma exigir.
- Não usar somente cor para indicar seleção.
- Preferir padrões nativos da plataforma e evitar recriar roving focus quando houver primitiva adequada.

## Propriedades conceituais
- `items` — conjunto ordenado de abas e painéis;
- `selectedIndex` — índice ativo;
- `onSelectionChange` — alteração controlada;
- `activationMode` — automatic ou manual quando a plataforma/padrão suportar;
- `orientation` — horizontal ou vertical quando aplicável;
- `disabled` — somente para aba realmente indisponível.

## Semântica
Na Web, usar `role="tablist"`, `role="tab"` e `role="tabpanel"` apenas quando não houver primitiva nativa suficiente. Cada aba referencia seu painel e cada painel referencia a aba correspondente. A aba ativa expõe `aria-selected="true"`; somente a aba focalizável do conjunto recebe `tabindex="0"` no padrão roving.

## Teclado e foco
- Tab entra no conjunto de abas e depois segue para o painel/conteúdo seguinte conforme o padrão adotado.
- Setas navegam entre abas na orientação correspondente; Home/End podem ir à primeira/última quando suportado.
- Em ativação automática, foco e seleção mudam juntos somente quando o painel pode ser exibido sem atraso perceptível.
- Em ativação manual, setas movem foco e Enter/Espaço confirmam seleção.
- Trocar de aba não deve enviar foco arbitrariamente ao início do painel.

## Painel e persistência
Conteúdo do painel ativo deve permanecer compreensível e disponível às tecnologias assistivas. Painéis inativos não podem continuar expostos como conteúdo duplicado quando estiverem visualmente ocultos.

## Overflow
Quando muitas abas excederem o espaço, permitir reflow, rolagem horizontal acessível ou outra estratégia equivalente sem ocultar a aba ativa nem tornar as últimas abas inalcançáveis por teclado/touch.

## Tamanho alvo
Abas interativas seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt.

## Tema e reflow
Respeitar claro, escuro, sistema, forced/high contrast, zoom e text scaling. Foco e seleção devem permanecer perceptíveis sem depender de sublinhado fino ou cor isolada.

## Exemplos conformes
- tablist com três abas, uma selecionada e painel correspondente identificado programaticamente;
- navegação por setas dentro das abas e Tab seguindo para o conteúdo do painel;
- painel inativo removido da árvore de acessibilidade quando oculto;
- aba ativa indicada por texto/estrutura e não apenas cor.

## Exemplos não conformes
- links de páginas diferentes marcados como tabs apenas por aparência;
- todas as abas com `tabindex="0"` quando o padrão usa roving focus;
- painel oculto visualmente mas ainda anunciado integralmente pelo leitor de tela;
- seleção indicada apenas por cor;
- troca automática lenta acionada a cada seta, causando perda de contexto;
- foco movido para o início do painel a cada seleção sem necessidade.

## Matriz mínima
Verificar tablist/tab/tabpanel, nome, seleção, relação aba-painel, roving focus, setas, Home/End, ativação automática/manual, painéis ocultos, overflow, teclado/touch, alvo, tema, contraste, zoom/text scaling e tecnologias assistivas.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
