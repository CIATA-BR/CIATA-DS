# CMP-0009 — Loading / Progress

## Status
Rascunho.

## Propósito
Comunicar atividade em andamento e, quando possível, o avanço de uma tarefa. Use loading indeterminado quando a duração ou percentual não forem conhecidos; use progress determinado quando houver valor real e mensurável.

## Princípios
- Preferir primitivas nativas da plataforma.
- Não mover foco para o indicador apenas porque uma operação começou.
- Não anunciar atualizações excessivamente frequentes.
- Quando houver progresso mensurável, expor valor atual, mínimo e máximo ou equivalente.
- Loading não deve bloquear toda a interface sem necessidade.
- Se uma ação ficar indisponível durante processamento, comunicar o estado sem depender apenas de aparência visual.
- Conclusão, falha ou cancelamento devem ser comunicados por Status/Alert quando apropriado.

## Propriedades conceituais
- `label` — identifica a tarefa em andamento quando necessário;
- `mode` — `indeterminate` ou `determinate`;
- `value` — valor atual quando determinado;
- `min` e `max` — limites do progresso;
- `state` — loading, paused, complete, error ou canceled quando aplicável;
- `showValue` — define se percentual/valor também fica visível;
- `onCancel` — cancelamento somente quando a operação realmente suportar.

## Semântica
- Em modo determinado, expor valor atual de forma programática.
- Em modo indeterminado, anunciar apenas que a operação está em andamento, sem inventar percentual.
- O nome acessível deve identificar o processo, não repetir palavras de papel que a tecnologia assistiva já anuncia.
- Não usar `aria-live` ou anúncios equivalentes a cada pequena mudança de valor.

## Foco e interação
- O indicador por si só não deve receber foco se não for interativo.
- Controles associados, como `Cancelar upload`, entram na ordem de foco normal.
- Se o controle acionador ficar temporariamente indisponível, preservar contexto e informar o motivo quando necessário.

## Frequência de atualização
Para progresso determinado, a interface visual pode atualizar com maior frequência, mas anúncios por tecnologia assistiva devem ser moderados. Preferir marcos significativos ou alterações suficientemente espaçadas em vez de anunciar cada ponto percentual.

## Conteúdo
Exemplos úteis:
- `Enviando relatório`;
- `Processando 3 de 10 arquivos`;
- `Carregando resultados`.

Evitar textos vagos como `Aguarde...` quando houver contexto mais específico.

## Temporização
Não mostrar spinner para operações praticamente instantâneas se isso gerar cintilação ou ruído. Para tarefas longas, manter feedback persistente e oferecer cancelamento apenas quando tecnicamente seguro.

## Tema e aparência
Cor e animação não podem ser a única forma de transmitir avanço. Respeitar tema claro/escuro/sistema, alto contraste e preferências de redução de movimento. Em `prefers-reduced-motion` ou equivalente, reduzir animação decorativa sem remover a informação de progresso.

## Exemplos conformes
- barra de progresso com nome da tarefa e valor real;
- spinner indeterminado acompanhado de texto `Carregando resultados`;
- atualização de leitor de tela apenas em marcos relevantes;
- botão `Cancelar upload` somente quando o cancelamento existir de fato.

## Exemplos não conformes
- spinner sem contexto textual em tarefa importante;
- percentual inventado para processo indeterminado;
- foco movido automaticamente para o spinner;
- anúncio a cada 1% causando fala contínua;
- cor/animação como única indicação de andamento;
- loading eterno sem estado de erro ou recuperação.

## Matriz mínima
Verificar nome, modo determinado/indeterminado, valor atual, ausência de foco indevido, frequência de anúncios, conclusão/falha, cancelamento quando aplicável, redução de movimento, zoom/text scaling, alto contraste e tecnologias assistivas.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
