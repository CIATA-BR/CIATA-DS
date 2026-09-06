# Matriz de validação multiplataforma — CMP-0015 Menu

## Objetivo
Definir evidência mínima para validar Menu sem confundir menus de aplicação com listas comuns de navegação.

## Evidência por execução
Registrar plataforma, versão, recurso de tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| MEN-01 | Acionador | Controle possui nome claro, papel nativo e estado de abertura quando aplicável. |
| MEN-02 | Semântica | Menu de aplicação usa semântica correspondente; navegação comum não recebe `menu/menuitem` artificial. |
| MEN-03 | Foco inicial | Ao abrir, o foco chega ao item apropriado sem perda de contexto. |
| MEN-04 | Setas | Navegação interna por setas segue o padrão da plataforma. |
| MEN-05 | Home/End | Primeiro/último item são alcançáveis quando o padrão suportar. |
| MEN-06 | Escape | Fecha o menu e restaura foco de forma previsível. |
| MEN-07 | Seleção | Ativar item executa uma única ação e fecha quando previsto. |
| MEN-08 | Disabled | Item indisponível não é ativável e expõe estado coerente. |
| MEN-09 | Checked | Estado marcado, quando existir, é programático e não apenas visual. |
| MEN-10 | Submenu | Submenu não depende de hover e possui caminho equivalente por teclado/touch. |
| MEN-11 | Fora do menu | Interação externa fecha sem perda arbitrária de foco. |
| MEN-12 | Alvo | Acionador e itens respeitam alvo mínimo da plataforma. |
| MEN-13 | Tema | Conteúdo, estados e foco permanecem perceptíveis em claro/escuro/sistema. |
| MEN-14 | Alto contraste | Bordas, foco e estados permanecem distinguíveis em forced/high contrast. |
| MEN-15 | Escala | Zoom/text scaling não corta itens nem torna o menu inalcançável. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400% e forced colors. Verificar acionador real, `aria-haspopup`, `aria-expanded`, `role="menu"`/`menuitem` somente no padrão de aplicação, foco inicial, setas, Home/End, Escape, fechamento e retorno de foco.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.Menu`, nomes, itens disabled, navegação nativa, Escape/fechamento e restauração de contexto.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `DropdownMenu`, abertura/fechamento, ordem de itens, gesto de ativação, escala de fonte/display e retorno de contexto.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `Menu`/`Button`, nomes, ordem, ativação, fechamento, Dynamic Type e comportamento nativo de foco.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `PopupMenuButton`/`PopupMenuItem`, nome do acionador, foco, ordem, text scaling e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/papel/foco/ativação/fechamento e validação manual com recurso de tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
