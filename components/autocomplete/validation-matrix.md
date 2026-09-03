# Matriz de validação multiplataforma — CMP-0022 Autocomplete

## Objetivo
Definir evidência mínima para validar sugestões de entrada sem depender de pistas visuais, movimento arbitrário de foco ou anúncios excessivos.

## Evidência por execução
Registrar plataforma, versão, tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| AUT-01 | Nome | Campo possui nome claro e persistente. |
| AUT-02 | Estado expandido | Abertura/fechamento das sugestões é exposta quando aplicável. |
| AUT-03 | Relação campo-lista | Campo e sugestões possuem relação programática coerente. |
| AUT-04 | Item ativo | Opção ativa é identificável sem mover foco arbitrariamente. |
| AUT-05 | Teclado | Setas/Enter/Escape seguem padrão da plataforma sem reinventar Tab. |
| AUT-06 | Foco | Digitação, atualização e fechamento preservam foco lógico. |
| AUT-07 | Seleção | Valor escolhido corresponde à opção anunciada/ativa. |
| AUT-08 | Texto livre | Regra de texto livre ou seleção obrigatória é previsível e validável. |
| AUT-09 | Loading | Carregamento é perceptível sem bloquear edição desnecessariamente. |
| AUT-10 | Erro | Falha é específica, persistente e não depende apenas de cor. |
| AUT-11 | Estado vazio | Ausência de sugestões é informada sem criar armadilha de foco. |
| AUT-12 | Assíncrono | Debounce/cancelamento evita respostas obsoletas e anúncios excessivos. |
| AUT-13 | Disabled/readonly | Estados permanecem semanticamente distintos. |
| AUT-14 | Alvo | Controles interativos respeitam alvo mínimo da plataforma. |
| AUT-15 | Tema | Campo, lista, item ativo e foco permanecem perceptíveis. |
| AUT-16 | Alto contraste | Seleção e foco permanecem distinguíveis em high/forced contrast. |
| AUT-17 | Escala | Zoom/text scaling não corta campo, opções ou mensagens essenciais. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400% e forced colors. Verificar combobox/listbox, `aria-expanded`, `aria-controls`, `aria-activedescendant`, setas, Enter, Escape, seleção por ponteiro e foco estável.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.ComboBox` editável, nome, sugestões, seleção, Enter, navegação nativa e retorno de foco.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `OutlinedTextField`, `DropdownMenu`, ordem de leitura, abertura/dispensa, seleção, escala de fonte/display e foco durante atualização.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `TextField`, sugestões por controles nativos, ordem de leitura, seleção, fechamento e Dynamic Type.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `Autocomplete<String>`, nome do campo, navegação das opções, seleção, text scaling e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/foco/seleção/estado e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
