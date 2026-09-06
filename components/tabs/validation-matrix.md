# Matriz de validação multiplataforma — CMP-0013 Tabs

## Objetivo
Definir evidência mínima para validar Tabs sem presumir equivalência entre plataformas.

## Evidência por execução
Registrar plataforma, versão, recurso de tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| TAB-01 | Estrutura | Conjunto, aba e painel possuem papéis/semântica coerentes com a plataforma. |
| TAB-02 | Nome | Abas possuem nomes claros e não repetem palavras de papel. |
| TAB-03 | Seleção | A aba ativa é identificada semanticamente e visualmente. |
| TAB-04 | Relação | Aba e painel correspondente mantêm associação programática quando aplicável. |
| TAB-05 | Roving focus | Apenas o ponto apropriado do conjunto participa do Tab quando o padrão exigir. |
| TAB-06 | Setas | Setas percorrem abas na orientação prevista sem escapar do conjunto. |
| TAB-07 | Home/End | Primeira/última aba são alcançáveis quando o padrão suportar. |
| TAB-08 | Ativação | Automática só ocorre sem atraso perceptível; manual respeita Enter/Espaço. |
| TAB-09 | Painel oculto | Painéis inativos não permanecem anunciados como conteúdo duplicado. |
| TAB-10 | Foco | Troca de aba não envia foco arbitrariamente ao painel. |
| TAB-11 | Overflow | Todas as abas continuam alcançáveis com teclado/touch e a ativa permanece perceptível. |
| TAB-12 | Tema | Seleção e foco permanecem perceptíveis em claro/escuro/sistema. |
| TAB-13 | Alto contraste | Foco e seleção continuam distinguíveis em forced/high contrast. |
| TAB-14 | Escala | Zoom/text scaling não corta rótulos, painel ou controles essenciais. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400% e forced colors. Verificar `tablist`, `tab`, `tabpanel`, `aria-selected`, `aria-controls`, `aria-labelledby`, roving tabindex, setas/Home/End, painéis `hidden` e foco visível.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.Notebook`, nomes das páginas, seleção, navegação nativa, ordem de foco e anúncio do painel ativo.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `TabRow`/`Tab`, estado selecionado, gesto de ativação, ordem de foco, escala de fonte/display e conteúdo do painel ativo.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `Picker` segmentado, seleção, ordem de leitura, Dynamic Type, alvo mínimo de 44 × 44 pt e conteúdo do painel ativo.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `TabBar`, seleção controlada, atualização externa de índice, text scaling, foco e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de papel/nome/seleção/foco/ativação, e validação manual com recurso de tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
