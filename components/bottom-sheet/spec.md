# CMP-0018 — Bottom Sheet

## Status
Rascunho.

## Propósito
Apresentar conteúdo complementar ou ações em uma superfície temporária ancorada à borda inferior da interface, sem perder contexto e sem comprometer foco, leitura ou navegação.

## Princípios
- Preferir padrões nativos da plataforma para sheets/modais inferiores.
- Diferenciar bottom sheet modal de superfície persistente; o comportamento de foco muda conforme o caso.
- Não usar bottom sheet para substituir páginas longas ou fluxos complexos sem necessidade.
- Abertura e fechamento devem ser previsíveis e nunca depender apenas de gesto de arrastar.
- Deve existir ação equivalente para fechar além de swipe/drag quando o sheet for dispensável.
- O conteúdo atrás de um sheet modal não pode permanecer interativo ou focável.

## Propriedades conceituais
- `open` — estado controlado de abertura;
- `onOpenChange` — abertura/fechamento;
- `modal` — modal ou não modal;
- `title` — nome/título quando necessário;
- `dismissible` — permite fechamento explícito;
- `initialFocus` — alvo inicial quando o padrão exigir;
- `snapPoints` — alturas intermediárias somente quando suportadas e compreensíveis;
- `dragHandle` — affordance visual, nunca único mecanismo de controle.

## Semântica e foco
- Em sheet modal, aplicar semântica equivalente a diálogo/modal quando a plataforma suportar.
- Ao abrir, mover foco para o título ou primeiro controle significativo conforme contexto; não usar foco arbitrário.
- Conter foco no sheet modal enquanto estiver aberto.
- Escape/Back/gesto de fechamento devem encerrar o sheet quando permitido.
- Ao fechar, devolver foco ao elemento que abriu o sheet ou ao ponto lógico equivalente.
- Sheets não modais não devem capturar foco de forma indevida.

## Teclado e gestos
- Nenhuma ação essencial pode depender só de arrastar.
- Teclado deve alcançar conteúdo e ação de fechar.
- Android deve respeitar Back; iOS deve preservar comportamento nativo de apresentação/dispensa; Web deve suportar Escape quando modal e dispensável.
- Se houver snap points, mudanças de altura não devem causar perda de foco ou leitura.

## Conteúdo e rolagem
- Conteúdo interno pode rolar sem prender o usuário entre rolagem e gesto de dispensa.
- Em escala alta, o sheet deve permitir acesso a todo conteúdo e controles.
- Não ocultar erros, ajuda ou ações essenciais atrás da alça de arraste ou fora da viewport.

## Tema, contraste e movimento
Respeitar claro, escuro, sistema, forced/high contrast, zoom, text scaling, safe areas e reduced motion. Animação de entrada/saída não pode ser necessária para compreender estado.

## Alvo mínimo
Ações seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt.

## Exemplos conformes
- botão `Filtros` abre sheet modal, foco entra no título, conteúdo atrás fica indisponível e fechar retorna foco ao botão;
- botão `Fechar` existe mesmo quando swipe para baixo também fecha;
- Android Back fecha o sheet antes de navegar para trás;
- formulário dentro do sheet preserva valores durante mudanças de altura;
- com 200%/400% de escala, conteúdo permanece rolável e alcançável.

## Exemplos não conformes
- sheet só pode ser fechado arrastando;
- conteúdo de fundo continua focável enquanto sheet modal está aberto;
- fechar envia foco para o início da página;
- foco vai automaticamente para controle destrutivo;
- mudança de snap point remove foco do campo em edição;
- sheet ocupa toda a tela e funciona como página complexa sem necessidade;
- título visual existe, mas não há nome programático equivalente quando exigido.

## Matriz mínima
Verificar abertura, modal/não modal, nome, foco inicial, contenção, Escape/Back, fechamento explícito, retorno de foco, fundo inerte, drag equivalente, snap points, rolagem, teclado, alvo, tema, contraste, escala, safe area, reduced motion e recursos de tecnologia assistiva.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com recurso de tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
