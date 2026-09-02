# Matriz de validação multiplataforma — CMP-0008 Modal / Dialog

## Objetivo
Definir evidência mínima para validar implementações experimentais de Modal/Dialog sem presumir equivalência entre plataformas.

## Evidência por execução
Registrar plataforma, versão, tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| DLG-01 | Nome/título | O diálogo possui nome claro e título associado. |
| DLG-02 | Descrição | Contexto adicional é perceptível sem duplicação excessiva. |
| DLG-03 | Foco inicial | Ao abrir, foco chega a destino lógico. |
| DLG-04 | Contenção | Em modal, Tab/Shift+Tab não escapam para conteúdo atrás. |
| DLG-05 | Conteúdo externo | Conteúdo fora do modal não permanece acionável enquanto bloqueado. |
| DLG-06 | Escape/voltar | Cancelamento funciona quando seguro e não causa perda inesperada. |
| DLG-07 | Retorno de foco | Ao fechar, foco volta ao acionador ou destino lógico. |
| DLG-08 | Ordem | Ordem de foco e leitura permanece previsível. |
| DLG-09 | Ações | Ações possuem nomes claros e consequência compreensível. |
| DLG-10 | Destrutivo | Ação destrutiva não depende apenas de cor. |
| DLG-11 | Reflow | Zoom/text scaling e viewport reduzida não escondem conteúdo essencial. |
| DLG-12 | Alto contraste | Bordas, foco e ações permanecem perceptíveis. |
| DLG-13 | Fechamento | Controle de fechar, quando existir, possui nome acessível. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, somente teclado, zoom 200%/400% e forced colors. Verificar `<dialog>` nativo, uso modal com `showModal()` no consumidor, foco inicial real, Escape, retorno de foco, conteúdo externo inerte e ausência de `aria-modal` artificial quando a primitiva nativa já cobre o caso.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.Dialog`, título anunciado, navegação interna, fechamento com Escape/Cancel, redimensionamento e retorno de foco ao parent/acionador conforme a integração real.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `AlertDialog`, anúncio de título/conteúdo, foco inicial nativo, navegação por ações, Back/dismiss conforme contrato, retorno ao acionador e escalas de fonte/display.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `alert` nativo, leitura de título/mensagem, ordem de ações, gesto de cancelamento quando permitido, retorno ao contexto anterior e Dynamic Type.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `AlertDialog`, título, mensagem, ações, barreira modal, Back/dismiss conforme plataforma, retorno de foco e text scaling.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de foco/nome/fechamento, e a validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
