# Matriz de validação multiplataforma — CMP-0019 Date Picker

## Objetivo
Definir evidência mínima para validar seleção de data sem depender de interação visual ou formatos ambíguos.

## Evidência por execução
Registrar plataforma, versão, tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| DTP-01 | Nome | Campo/seletor possui nome claro e persistente. |
| DTP-02 | Valor | Data selecionada é exposta de forma compreensível e não ambígua. |
| DTP-03 | Locale | Formato exibido segue locale/plataforma sem alterar valor programático de forma ambígua. |
| DTP-04 | Entrada textual | Quando suportada, permite digitação equivalente com formato explicado. |
| DTP-05 | Abertura/fechamento | Seletor abre e fecha sem perda arbitrária de foco. |
| DTP-06 | Teclado | Operação aplicável é possível por teclado sem depender de ponteiro. |
| DTP-07 | Limites | Datas fora de min/max não podem ser selecionadas. |
| DTP-08 | Datas indisponíveis | Datas bloqueadas expõem estado e não ativam. |
| DTP-09 | Required | Obrigatoriedade é programática e possui erro compreensível quando violada. |
| DTP-10 | Disabled/readonly | Estados permanecem distintos e coerentes. |
| DTP-11 | Erro | Erro é associado ao campo e não depende apenas de cor. |
| DTP-12 | Foco | Fechar/confirmar retorna foco ao ponto lógico quando aplicável. |
| DTP-13 | Alvo | Controles interativos respeitam alvo mínimo da plataforma. |
| DTP-14 | Tema | Conteúdo e foco permanecem perceptíveis em claro/escuro/sistema. |
| DTP-15 | Alto contraste | Campo, seleção, foco e estados permanecem distinguíveis. |
| DTP-16 | Escala | Zoom/text scaling não corta datas, instruções ou ações essenciais. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400% e forced colors. Verificar `label`, `input type="date"`, valor ISO, min/max, required/disabled/readonly, descrição/erro e foco visível.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.adv.DatePickerCtrl`, nome do campo, valor, navegação nativa, locale e comportamento do seletor.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `DatePickerDialog`/`DatePicker`, confirmação/cancelamento, ordem de leitura, seleção, limites quando implementados, escala de fonte/display e retorno de contexto.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `DatePicker`, nome, valor, intervalo, ordem de leitura, Dynamic Type e comportamento nativo de seleção.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `showDatePicker`, help text, datas inicial/mínima/máxima, navegação, text scaling e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/valor/foco/teclado/validação e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
