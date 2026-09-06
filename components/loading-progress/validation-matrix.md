# Matriz de validação multiplataforma — CMP-0009 Loading / Progress

## Objetivo
Definir evidência mínima para validar implementações experimentais de Loading/Progress sem presumir equivalência entre plataformas.

## Evidência por execução
Registrar plataforma, versão, recurso de tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| PRG-01 | Nome | A tarefa em andamento possui rótulo compreensível quando necessário. |
| PRG-02 | Indeterminado | O sistema comunica andamento sem inventar percentual. |
| PRG-03 | Determinado | Valor atual e faixa representam progresso real. |
| PRG-04 | Foco | O indicador não recebe nem rouba foco sem ser interativo. |
| PRG-05 | Frequência | Atualizações não produzem fala contínua ou duplicada. |
| PRG-06 | Conclusão | Término da operação é perceptível e pode ser comunicado por Status. |
| PRG-07 | Falha | Erro interrompe o loading eterno e oferece recuperação/contexto. |
| PRG-08 | Cancelamento | Controle existe somente quando a operação pode ser cancelada com segurança. |
| PRG-09 | Movimento | Preferência de redução de movimento é respeitada. |
| PRG-10 | Tema | Indicador permanece perceptível em claro, escuro e sistema. |
| PRG-11 | Alto contraste | Estrutura e valor permanecem distinguíveis. |
| PRG-12 | Escala | Texto/valor não cortam ou sobrepõem conteúdo em ampliação. |

## Web e Laravel/PHP
Executar com JAWS e NVDA em navegadores suportados, teclado, zoom 200%/400%, forced colors e `prefers-reduced-motion`. Verificar `role="progressbar"`, nome, `aria-valuemin/max/now` apenas quando determinado e ausência de `aria-live` por percentual.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.Gauge`, rótulo, modo `Pulse()` indeterminado, valor determinado e ausência de mudança de foco. Registrar se o leitor anuncia alterações automaticamente e ajustar estratégia do aplicativo para evitar excesso.

## Android / Jetpack Compose
Executar com TalkBack. Verificar indicadores Material 3, `ProgressBarRangeInfo.Indeterminate` e faixa determinada, rótulo, escala de fonte/display e ausência de foco forçado.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `ProgressView` determinado e indeterminado, rótulo, valor atual, Dynamic Type, redução de movimento do sistema e continuidade de foco.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `LinearProgressIndicator`, semântica de rótulo/valor, modos determinado/indeterminado, text scaling e frequência real dos anúncios de cada plataforma.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/valor/foco, e validação manual com recurso de tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
