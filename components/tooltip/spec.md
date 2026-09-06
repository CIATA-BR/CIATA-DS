# CMP-0017 — Tooltip

## Status
Rascunho.

## Propósito
Oferecer informação complementar curta associada a um controle ou conteúdo sem substituir rótulos, instruções essenciais, mensagens de erro ou ajuda persistente.

## Princípios
- Tooltip é complementar; conteúdo necessário para concluir uma tarefa deve permanecer disponível fora dele.
- Não usar tooltip para fornecer o nome acessível principal de um controle que já deveria ter rótulo próprio.
- Deve aparecer por hover e também por foco de teclado quando a plataforma suportar tooltip visual.
- Deve permanecer disponível tempo suficiente para leitura e desaparecer sem provocar perda de foco.
- Não depender de tooltip para conteúdo crítico em touch, pois hover pode não existir.
- Não criar armadilhas de foco nem exigir gesto complexo para descobrir o conteúdo.

## Propriedades conceituais
- `text` — conteúdo curto e objetivo;
- `trigger` — elemento associado;
- `placement` — preferência visual;
- `open` — estado controlado quando aplicável;
- `delay` — atraso visual moderado quando aplicável;
- `persistent` — somente para casos excepcionais; conteúdo essencial deve migrar para ajuda persistente.

## Semântica
Na Web, um tooltip visual pode usar `role="tooltip"` e ser associado ao acionador por `aria-describedby`. O elemento que recebe hover/foco mantém seu nome acessível próprio. Não adicionar `aria-label` apenas para replicar o texto do tooltip quando isso substituir ou duplicar indevidamente o nome do controle.

## Teclado, foco e fechamento
- Foco permanece no elemento acionador; tooltip não recebe foco em uso comum.
- Tooltip abre quando o acionador recebe foco e fecha quando ele perde foco, sem mover o foco.
- Escape deve permitir dispensar tooltip visível quando o padrão da plataforma suportar.
- Hover no tooltip não deve fazer o conteúdo desaparecer imediatamente se o ponteiro sair do acionador em direção ao próprio tooltip.

## Touch e mobile
Não presumir hover. Em plataformas móveis, preferir mecanismos nativos de ajuda, hint/accessibility hint ou conteúdo persistente quando a descoberta por toque não for garantida. Tooltips acionados por long press precisam preservar alternativas equivalentes para leitores de tela.

## Conteúdo
- Ser curto, específico e não redundante.
- Não repetir palavra de papel como `botão`, `link` ou `campo` se o recurso de tecnologia assistiva já anuncia o papel.
- Não conter ações interativas; se houver links/botões, usar popover/dialog ou outro componente adequado.

## Tema, contraste e reflow
Respeitar claro, escuro, sistema, forced/high contrast, zoom, text scaling e reduced motion. O tooltip deve reposicionar-se para permanecer na viewport sem alterar associação ou ordem lógica.

## Exemplos conformes
- botão com nome acessível `Compartilhar` exibe tooltip visual `Compartilhar` ao hover/foco sem depender dele para o nome;
- ícone já possui nome programático e tooltip apenas reforça a mesma ação visualmente;
- tooltip fecha com Escape e foco permanece no acionador;
- em mobile, a mesma informação útil também está disponível por hint nativo ou texto persistente quando necessário.

## Exemplos não conformes
- botão sem nome acessível cuja única identificação é o tooltip visual;
- tooltip que abre apenas com hover;
- conteúdo crítico de validação escondido em tooltip;
- tooltip com botão ou link interno;
- tooltip desaparece assim que o usuário move o ponteiro para lê-lo;
- foco é enviado para o tooltip ao abrir;
- texto `Excluir, botão` usado como nome quando o papel já é anunciado.

## Matriz mínima
Verificar nome próprio do acionador, associação descritiva, hover, foco, Escape, persistência durante leitura, touch/mobile, conteúdo não interativo, tema, alto contraste, zoom/text scaling, reduced motion e recursos de tecnologia assistiva.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com recurso de tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
