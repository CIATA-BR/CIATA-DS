# Matriz de validação multiplataforma — CMP-0016 Breadcrumb

## Objetivo
Definir evidência mínima para validar Breadcrumb sem confundi-lo com navegação principal ou indicador de etapas.

## Evidência por execução
Registrar plataforma, versão, tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| BRC-01 | Região | A trilha possui contexto/nome compreensível quando aplicável. |
| BRC-02 | Hierarquia | A ordem de itens corresponde à hierarquia real e à ordem de leitura. |
| BRC-03 | Links | Níveis anteriores usam controles de navegação nativos. |
| BRC-04 | Atual | O item atual é identificável e não recebe foco se não for interativo. |
| BRC-05 | Separadores | Separadores visuais não são anunciados como conteúdo útil. |
| BRC-06 | Teclado | Links seguem ordem natural de Tab sem navegação especial por setas. |
| BRC-07 | Ativação | Ativar nível anterior executa uma única navegação/ação prevista. |
| BRC-08 | Alvo | Itens interativos respeitam alvo mínimo da plataforma. |
| BRC-09 | Truncamento | Nome acessível completo permanece disponível quando houver truncamento visual. |
| BRC-10 | Reflow | Zoom/text scaling não sobrepõe nem remove níveis essenciais. |
| BRC-11 | Tema | Texto, links e foco permanecem perceptíveis em claro/escuro/sistema. |
| BRC-12 | Alto contraste | Links, foco e item atual permanecem distinguíveis em forced/high contrast. |
| BRC-13 | Uso correto | Breadcrumb não é usado como stepper ou substituto da navegação principal. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400% e forced colors. Verificar `nav` nomeado, lista ordenada, links reais, item atual, separadores gerados por CSS e foco visível.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar controles nativos para níveis navegáveis, item atual estático, ordem de foco e ausência de separador textual anunciado.

## Android / Jetpack Compose
Executar com TalkBack. Verificar controles nativos, item atual não interativo, ordem de exploração, reflow, escala de fonte/display e ativação previsível.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `Button` nos níveis navegáveis, item atual estático, ordem de leitura, Dynamic Type, foco e alvo mínimo de 44 × 44 pt.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `TextButton`, item atual estático, `Wrap`/reflow, text scaling, ordem e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/hierarquia/foco/ativação/item atual e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
