# CMP-0008 — Modal / Dialog

## Status
Rascunho.

## Propósito
Apresentar conteúdo ou decisão que exige atenção contextual. Use Dialog quando houver interação temporária; use Modal somente quando o restante da interface realmente precisar ficar indisponível até conclusão ou cancelamento.

## Princípios
- Preferir primitivas nativas da plataforma.
- Título programático obrigatório quando houver título visível.
- Ao abrir, mover foco para destino lógico dentro do diálogo.
- Enquanto modal, manter foco contido sem criar armadilha permanente.
- Escape/voltar fecha quando houver cancelamento seguro.
- Ao fechar, devolver foco ao acionador ou próximo destino lógico.
- Conteúdo fora do modal deve ficar inerte/inacessível conforme a plataforma.
- Não usar modal para mensagens triviais que poderiam permanecer inline.

## Propriedades conceituais
- `title` — título claro e identificador do diálogo;
- `description` — contexto opcional;
- `modal` — bloqueia interação externa quando necessário;
- `dismissible` — permite cancelamento seguro;
- `initialFocus` — destino inicial lógico;
- `returnFocus` — destino após fechamento;
- `onClose` — fechamento explícito;
- `actions` — ações primária/secundária com nomes claros.

## Foco e teclado
- foco inicial não deve cair arbitrariamente na primeira ação destrutiva;
- Tab/Shift+Tab percorrem controles do modal sem escapar quando modal;
- Escape fecha somente quando isso não causar perda irreversível;
- não remover foco visível;
- não exigir ponteiro ou gesto complexo.

## Conteúdo e ações
A ação principal deve refletir a consequência real. Ação destrutiva deve ser identificada textualmente e não apenas por cor. Fechar por ícone exige nome acessível, como `Fechar diálogo`.

## Tamanho e reflow
O diálogo deve suportar zoom/text scaling, conteúdo longo e viewport reduzida sem esconder ações essenciais. Quando necessário, rolagem deve ocorrer no conteúdo preservando título e controles alcançáveis.

## Tema e tokens
Consumir tokens canônicos de superfície, texto, borda, foco, sobreposição, espaçamento, elevação e ações quando existirem. Respeitar claro, escuro, sistema e alto contraste.

## Exemplos conformes
- confirmação de exclusão com título, consequência, Cancelar e Excluir;
- formulário curto em modal com foco inicial no primeiro campo lógico;
- fechamento retorna foco ao botão que abriu o modal;
- diálogo não modal usado quando interação externa continua necessária.

## Exemplos não conformes
- `div` visual sem semântica de diálogo;
- modal que abre sem mover foco;
- foco escapando para conteúdo atrás do modal;
- fechar sem devolver foco;
- botão X sem nome acessível;
- bloquear Escape em fluxo cancelável;
- usar modal para toda mensagem de sucesso.

## Matriz mínima
Verificar título/nome, descrição, foco inicial, contenção, Escape/voltar, retorno de foco, ordem de tabulação, ações, conteúdo externo inerte, zoom/text scaling, alto contraste e tecnologias assistivas.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
