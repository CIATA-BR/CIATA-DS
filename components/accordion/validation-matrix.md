# Matriz de validação multiplataforma — CMP-0014 Accordion

## Objetivo
Definir evidência mínima para validar Accordion sem presumir equivalência entre plataformas.

## Evidência por execução
Registrar plataforma, versão, tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| ACC-01 | Nome | Cada acionador possui nome claro e não repete palavras de papel. |
| ACC-02 | Controle | Cabeçalho usa botão/controle nativo apropriado. |
| ACC-03 | Estado | Expandido/recolhido é exposto programaticamente e não só visualmente. |
| ACC-04 | Relação | Acionador e painel correspondente mantêm associação coerente quando aplicável. |
| ACC-05 | Teclado | Tab/Shift+Tab e ativação nativa funcionam sem gesto complexo obrigatório. |
| ACC-06 | Foco | Expandir/recolher não move foco arbitrariamente. |
| ACC-07 | Conteúdo oculto | Conteúdo recolhido não permanece focável ou anunciado como conteúdo visível. |
| ACC-08 | Foco interno | Recolher item com foco interno exige recuperação previsível antes de ocultar. |
| ACC-09 | Múltiplos itens | Política de um/vários itens abertos é previsível e consistente. |
| ACC-10 | Disabled | Item indisponível usa semântica nativa e não aparência isolada. |
| ACC-11 | Alvo | Cabeçalho possui área de toque adequada à plataforma. |
| ACC-12 | Tema | Estado e foco permanecem perceptíveis em claro/escuro/sistema. |
| ACC-13 | Alto contraste | Cabeçalho, foco e estado permanecem distinguíveis em forced/high contrast. |
| ACC-14 | Escala | Zoom/text scaling não corta rótulos, painéis ou controles essenciais. |
| ACC-15 | Movimento | Reduced motion não remove informação nem mantém animação necessária à compreensão. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400%, forced colors e reduced motion. Verificar botão real, `aria-expanded`, `aria-controls`, painel `hidden`, foco visível e ausência de controles focáveis no conteúdo recolhido.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.CollapsiblePane`, nome, estado anunciado pela plataforma, navegação nativa, conteúdo recolhido e continuidade de foco.

## Android / Jetpack Compose
Executar com TalkBack. Verificar botão nativo, `stateDescription`, gesto de ativação, conteúdo condicional, escala de fonte/display, alvo nativo e continuidade de foco.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `DisclosureGroup`, expansão/recolhimento, ordem de leitura, foco preservado, Dynamic Type e alvo mínimo de 44 × 44 pt.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `ExpansionTile`, estado, conteúdo expandido/recolhido, text scaling, foco e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/estado/foco/ativação/conteúdo oculto, e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
