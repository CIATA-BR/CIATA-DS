# Matriz de validação multiplataforma — CMP-0011 Pagination

## Objetivo
Definir evidência mínima para validar paginação sem presumir equivalência entre plataformas.

## Evidência por execução
Registrar plataforma, versão, tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| PAG-01 | Região/nome | O conjunto de paginação possui contexto e nome compreensíveis quando aplicável. |
| PAG-02 | Página atual | A página atual é identificada semanticamente e não apenas por aparência. |
| PAG-03 | Anterior/próxima | Ações sequenciais funcionam e ficam indisponíveis nos limites. |
| PAG-04 | Papel nativo | Navegação real usa links; paginação local usa botões/controles nativos adequados. |
| PAG-05 | Foco | A troca de página não causa salto arbitrário de foco. |
| PAG-06 | Atualização | Mudança parcial de conteúdo é perceptível sem anúncios excessivos. |
| PAG-07 | Compactação | Reticências não recebem foco quando não executam ação. |
| PAG-08 | Ordem | Ordem de leitura/foco acompanha a sequência lógica de páginas. |
| PAG-09 | Teclado | Todos os controles funcionam por teclado com foco visível. |
| PAG-10 | Touch | Controles possuem alvo suficiente e ativação previsível. |
| PAG-11 | Tema | Página atual, foco e indisponibilidade permanecem perceptíveis em claro/escuro/sistema. |
| PAG-12 | Alto contraste | Estrutura e foco permanecem distinguíveis em forced/high contrast. |
| PAG-13 | Escala | Zoom/text scaling não corta nem sobrepõe controles essenciais. |
| PAG-14 | Mudança de total | Se filtros reduzirem o total, a página atual é corrigida e comunicada. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400% e forced colors. Verificar região de navegação nomeada, links reais, `aria-current="page"`, ausência de `href="#"` para disabled, foco visível e comportamento após navegação/atualização parcial.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar botões nativos, identificação da página atual, anterior/próxima indisponíveis nos limites, ordem de foco e integração do callback sem mudança indevida de foco.

## Android / Jetpack Compose
Executar com TalkBack. Verificar página atual, estado selected, botões habilitados/desabilitados, gesto de ativação, alvo nativo, escala de fonte/display e continuidade do foco.

## iOS / SwiftUI
Executar com VoiceOver. Verificar página atual anunciada, disabled nos limites, ordem de navegação, Dynamic Type e alvo mínimo de 44 × 44 pt.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `Semantics(selected: true)`, disabled, Wrap/reflow, text scaling, alvo e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de papel/nome/página atual/foco/ativação, e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
