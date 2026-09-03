# Matriz de validação multiplataforma — CMP-0012 Toast

## Objetivo
Definir evidência mínima para validar Toast sem confundir feedback transitório com alertas críticos ou conteúdo persistente.

## Evidência por execução
Registrar plataforma, versão, tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| TST-01 | Mensagem | O texto comunica resultado específico e compreensível. |
| TST-02 | Anúncio | Feedback comum é anunciado uma vez, sem duplicação ou interrupção indevida. |
| TST-03 | Urgência | Conteúdo urgente usa mecanismo apropriado e não é rebaixado a toast transitório. |
| TST-04 | Foco | Exibição e remoção não roubam foco. |
| TST-05 | Temporização | Conteúdo essencial não desaparece antes de poder ser percebido. |
| TST-06 | Persistência | Mensagem que exige consulta posterior possui alternativa persistente. |
| TST-07 | Ação | Ação opcional é real, nomeada e acessível por teclado/touch. |
| TST-08 | Foco na ação | Toast não desaparece enquanto ação está focada sem recuperação previsível. |
| TST-09 | Fila | Múltiplos toasts não se atropelam nem geram fala contínua. |
| TST-10 | Fechamento | Fechar não desloca foco arbitrariamente. |
| TST-11 | Tema | Mensagem, borda e controles permanecem perceptíveis em claro/escuro/sistema. |
| TST-12 | Alto contraste | Conteúdo e foco permanecem distinguíveis em forced/high contrast. |
| TST-13 | Movimento | Reduced motion não remove informação nem mantém animação desnecessária. |
| TST-14 | Escala | Text scaling/zoom não corta mensagem nem ações. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400%, forced colors e reduced motion. Verificar região `status`/`aria-live="polite"`, `aria-atomic`, ausência de foco programático e ausência de regiões live duplicadas.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar mensagem visível, ações nativas opcionais, continuidade de foco e estratégia real do aplicativo para anúncio sem simular evidência não testada.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `Snackbar`, mensagem, ação opcional, duração/host real, foco preservado, escala de fonte/display e comportamento quando ação está em foco.

## iOS / SwiftUI
Executar com VoiceOver. Verificar mensagem, ação opcional, ordem de leitura, foco preservado, Dynamic Type e estratégia real de anúncio usada pelo aplicativo.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar live region, mensagem, ação opcional, ausência de duplicação semântica, text scaling e comportamento real de exibição/remoção.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de anúncio/foco/temporização/ação, e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
