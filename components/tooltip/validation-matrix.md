# Matriz de validação multiplataforma — CMP-0017 Tooltip

## Objetivo
Definir evidência mínima para validar Tooltip sem permitir que ajuda complementar substitua nome, instrução, erro ou conteúdo essencial.

## Evidência por execução
Registrar plataforma, versão, recurso de tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| TTP-01 | Nome do acionador | O controle possui nome acessível próprio sem depender do tooltip. |
| TTP-02 | Associação | A ajuda complementar é associada programaticamente quando a plataforma suportar. |
| TTP-03 | Hover | Tooltip visual aparece por ponteiro sem ser o único meio de acesso. |
| TTP-04 | Foco | Tooltip visual aparece por foco de teclado quando aplicável, sem mover foco. |
| TTP-05 | Escape | Tooltip dispensável fecha com Escape quando o padrão suportar. |
| TTP-06 | Persistência | O conteúdo não desaparece ao mover o ponteiro para a área do tooltip. |
| TTP-07 | Conteúdo | Não contém ações interativas nem informação crítica exclusiva. |
| TTP-08 | Touch/mobile | Existe mecanismo equivalente quando hover não estiver disponível. |
| TTP-09 | Leitor de tela | Ajuda não duplica papel/nome nem produz anúncio enganoso. |
| TTP-10 | Tema | Conteúdo permanece perceptível em claro/escuro/sistema. |
| TTP-11 | Alto contraste | Texto, fundo/borda e contexto permanecem distinguíveis. |
| TTP-12 | Escala/reflow | Zoom/text scaling não corta o conteúdo nem o remove da viewport. |
| TTP-13 | Movimento | Reduced motion elimina animação dispensável sem esconder informação. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, mouse, zoom 200%/400%, forced colors e reduced motion. Verificar nome próprio do controle, `aria-describedby`, `role="tooltip"`, hover, foco, Escape, persistência ao mover o ponteiro e ausência de foco no tooltip.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `SetToolTip`, preservação do nome do controle, comportamento nativo e ausência de dependência do tooltip para informação essencial.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `TooltipBox`/`PlainTooltip`, long press/descoberta, nome do acionador, escala de fonte/display e alternativa equivalente quando o tooltip visual não for anunciado.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `accessibilityHint`, ausência de simulação inadequada de hover, nome próprio do controle, Dynamic Type e adequação do hint como informação complementar.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `Tooltip`, nome do acionador, comportamento por foco/long press conforme plataforma, text scaling e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/foco/acesso equivalente/conteúdo essencial e validação manual com recurso de tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
