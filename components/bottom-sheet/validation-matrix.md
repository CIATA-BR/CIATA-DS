# Matriz de validação multiplataforma — CMP-0018 Bottom Sheet

## Objetivo
Definir evidência mínima para validar Bottom Sheet sem presumir equivalência de foco, gestos e modalização entre plataformas.

## Evidência por execução
Registrar plataforma, versão, tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| BTS-01 | Abertura | Sheet abre por controle claro e acionável sem gesto complexo obrigatório. |
| BTS-02 | Modalidade | Modal e não modal possuem comportamento coerente de foco e interação de fundo. |
| BTS-03 | Nome | Título/nome programático identifica a superfície quando aplicável. |
| BTS-04 | Foco inicial | Foco entra em ponto lógico, nunca arbitrariamente em ação destrutiva. |
| BTS-05 | Fundo | Conteúdo atrás de sheet modal não permanece interativo/focável. |
| BTS-06 | Escape/Back | Escape/Back fecha antes de abandonar o contexto quando o padrão permitir. |
| BTS-07 | Fechar | Existe ação explícita equivalente ao gesto de dispensa. |
| BTS-08 | Retorno de foco | Fechar devolve foco ao acionador ou ponto lógico equivalente. |
| BTS-09 | Drag | Nenhuma ação essencial depende exclusivamente de arrastar. |
| BTS-10 | Snap points | Mudança de altura não remove foco nem perde conteúdo. |
| BTS-11 | Rolagem | Todo conteúdo interno continua alcançável em escala alta. |
| BTS-12 | Teclado | Controles são alcançáveis sem armadilha de foco. |
| BTS-13 | Alvo | Ações respeitam alvo mínimo da plataforma. |
| BTS-14 | Tema | Conteúdo, estados e foco permanecem perceptíveis em claro/escuro/sistema. |
| BTS-15 | Alto contraste | Bordas, foco e ações permanecem distinguíveis em forced/high contrast. |
| BTS-16 | Escala | Zoom/text scaling não corta conteúdo nem ações essenciais. |
| BTS-17 | Safe area | Conteúdo não colide com áreas reservadas do dispositivo. |
| BTS-18 | Movimento | Reduced motion não remove informação nem exige animação para compreender estado. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400%, forced colors e reduced motion. Verificar `dialog` modal, título, foco inicial, fundo bloqueado, Escape, botão Fechar, retorno de foco e rolagem.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar mapeamento para `wx.Dialog` modal, nome, navegação, fechamento explícito e restauração de contexto. Não exigir geometria literal de bottom sheet no desktop.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `ModalBottomSheet`, Back, gesto de dispensa com alternativa explícita, título, foco/leitura, escala de fonte/display, rolagem e alvo nativo.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `sheet`, ordem de leitura, título, ação Fechar, dispensa nativa, retorno de contexto, Dynamic Type, safe areas e alvo mínimo de 44 × 44 pt.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `showModalBottomSheet`, `SafeArea`, título semântico, rolagem, fechamento explícito, text scaling, foco e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/modalidade/foco/fechamento/retorno de foco/acesso ao conteúdo e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
