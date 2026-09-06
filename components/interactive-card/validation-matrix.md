# Matriz de validação multiplataforma — CMP-0010 Card interativo

## Objetivo
Definir evidência mínima para validar Cards informativos e acionáveis sem transformar agrupamentos em controles ambíguos.

## Evidência por execução
Registrar plataforma, versão, recurso de tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| CRD-01 | Informativo | Card sem ação não entra na ordem de foco nem anuncia papel interativo. |
| CRD-02 | Ação única | Card acionável expõe um único controle com papel e nome coerentes. |
| CRD-03 | Navegação | Quando a intenção é navegar, a implementação usa semântica de link quando a plataforma suportar o padrão. |
| CRD-04 | Controles internos | Card com múltiplas ações não possui clique global nem controles interativos aninhados. |
| CRD-05 | Nome | Nome acessível identifica ação/destino sem concatenar conteúdo irrelevante. |
| CRD-06 | Teclado | Ativação segue comportamento nativo de link/botão e foco visível permanece perceptível. |
| CRD-07 | Touch | Superfície acionável e controles internos possuem alvo suficiente. |
| CRD-08 | Estados | Focus, pressed, selected e disabled não dependem apenas de cor/aparência. |
| CRD-09 | Imagens | Imagem decorativa não gera anúncio redundante e imagem informativa possui alternativa útil. |
| CRD-10 | Ordem | Leitura e foco acompanham ordem lógica do conteúdo. |
| CRD-11 | Tema | Conteúdo permanece legível em claro, escuro e sistema. |
| CRD-12 | Alto contraste | Bordas, foco e estados essenciais permanecem perceptíveis. |
| CRD-13 | Escala | Zoom/text scaling não corta título, descrição ou ações. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, somente teclado, zoom 200%/400% e forced colors. Verificar `<a>` para navegação, `<button>` para ação, card informativo sem `tabindex`, ausência de controles interativos descendentes em card globalmente acionável e foco visível.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar agrupamento informativo sem foco indevido e, quando houver ação, uso do botão nativo separado, nome anunciado e retorno previsível após ativação.

## Android / Jetpack Compose
Executar com TalkBack. Verificar Card informativo sem ação, variante acionável como único alvo, nome/conteúdo anunciados, gesto de ativação, foco, target size e ausência de controles filhos conflitantes.

## iOS / SwiftUI
Executar com VoiceOver. Verificar card informativo e variante com `Button` nativo, ordem de leitura, ativação, Dynamic Type, foco e alvo mínimo de 44 × 44 pt.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar Card informativo, `InkWell` acionável, papel de botão, conteúdo textual preservado, ausência de semântica duplicada e text scaling.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de papel/nome/foco/ativação, e validação manual com recurso de tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
