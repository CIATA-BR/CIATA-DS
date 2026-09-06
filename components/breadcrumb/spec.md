# CMP-0016 — Breadcrumb

## Status
Rascunho.

## Propósito
Representar a localização hierárquica atual dentro de uma estrutura de páginas ou seções, permitindo retorno a níveis anteriores sem substituir a navegação principal.

## Princípios
- Usar Breadcrumb apenas para hierarquia/localização, não para sequência de etapas de formulário.
- Preferir links nativos para níveis anteriores e texto não interativo para o item atual.
- O item atual deve ser identificado semanticamente quando a plataforma suportar.
- Separadores são decorativos e não devem ser anunciados como conteúdo útil.
- Não depender apenas de cor, posição ou ícone para indicar a página atual.
- Ordem visual, DOM e leitura devem coincidir com a hierarquia.

## Propriedades conceituais
- `items` — coleção ordenada de rótulo e destino;
- `currentIndex` — item atual, normalmente o último;
- `label` — nome da região de navegação quando necessário;
- `separator` — separador visual decorativo;
- `maxItems` — estratégia de condensação quando houver muitos níveis, sem ocultar contexto essencial.

## Semântica
Na Web, usar `nav` com nome acessível como `Breadcrumb` ou equivalente contextual, uma lista ordenada e links nativos para níveis navegáveis. O item atual deve expor `aria-current="page"` quando for um link ou elemento semanticamente adequado. Não aplicar `role="navigation"` redundante em `nav` sem necessidade.

## Teclado e foco
- Links seguem a ordem natural de Tab.
- Nenhuma navegação especial por setas é necessária.
- O item atual não deve receber foco se não for interativo.
- Ativar um nível anterior navega por comportamento nativo do link/controle da plataforma.

## Separadores e truncamento
Separadores devem ser ignorados por recursos de tecnologia assistiva. Em interfaces estreitas, truncamento visual não pode remover o nome acessível completo. Estratégias com reticências devem preservar acesso aos níveis ocultos sem criar um menu inacessível.

## Tamanho alvo
Links interativos seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt.

## Tema e reflow
Respeitar claro, escuro, sistema, forced/high contrast, zoom e text scaling. Breadcrumb deve quebrar linha ou adaptar-se sem sobrepor conteúdo ou perder itens essenciais.

## Exemplos conformes
- `Início > Produtos > Cadeiras`, com os dois primeiros itens como links e `Cadeiras` marcado como atual;
- separadores visuais não anunciados pelo leitor de tela;
- item atual não focável quando não há ação;
- nomes completos preservados para o recurso de tecnologia assistiva mesmo com truncamento visual.

## Exemplos não conformes
- usar Breadcrumb como indicador de etapa `1 de 4`;
- separadores `/` lidos entre todos os itens;
- item atual apresentado como link para a própria página sem necessidade;
- todos os níveis implementados como `div` clicável;
- ordem visual diferente da ordem de foco/leitura;
- estado atual indicado somente por cor.

## Matriz mínima
Verificar região, nome, lista/hierarquia, links nativos, item atual, separadores, ordem, teclado, alvo, truncamento, tema, alto contraste, zoom/text scaling e recursos de tecnologia assistiva.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com recurso de tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
