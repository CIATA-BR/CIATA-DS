# Matriz de validação multiplataforma — CMP-0020 File Upload

## Objetivo
Definir evidência mínima para validar seleção e envio de arquivos sem depender de arrastar e soltar, ícones, cor ou feedback visual isolado.

## Evidência por execução
Registrar plataforma, versão, tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| FUP-01 | Nome | O seletor possui nome claro e persistente. |
| FUP-02 | Restrições | Tipos, tamanho e quantidade permitidos ficam compreensíveis antes da seleção quando aplicáveis. |
| FUP-03 | Seleção | Existe seletor nativo/document picker acionável sem gesto complexo. |
| FUP-04 | Múltiplos | Seleção múltipla expõe cada arquivo individualmente quando suportada. |
| FUP-05 | Lista | Nome, tamanho/estado relevante e ordem dos arquivos permanecem perceptíveis. |
| FUP-06 | Remover/substituir | Cada arquivo pode ser removido/substituído por ação nomeada e previsível. |
| FUP-07 | Drag equivalente | Drop zone possui alternativa por teclado/toque/leitor de tela. |
| FUP-08 | Teclado | Seleção e ações não dependem de ponteiro. |
| FUP-09 | Foco | Selecionar, remover, cancelar ou falhar não provoca perda arbitrária de foco. |
| FUP-10 | Tipo/tamanho/quantidade | Restrições inválidas são rejeitadas com motivo específico. |
| FUP-11 | Progresso | Upload determinável expõe progresso sem excesso de anúncios. |
| FUP-12 | Erro | Falha identifica arquivo e causa, não depende apenas de cor. |
| FUP-13 | Sucesso | Conclusão é perceptível visual e programaticamente. |
| FUP-14 | Cancelamento | Upload cancelável possui ação explícita e estado coerente. |
| FUP-15 | Alvo | Ações interativas respeitam alvo mínimo da plataforma. |
| FUP-16 | Tema | Seleção, foco e estados permanecem perceptíveis em claro/escuro/sistema. |
| FUP-17 | Alto contraste | Controles, foco, erro e sucesso permanecem distinguíveis. |
| FUP-18 | Escala | Zoom/text scaling não corta restrições, nomes ou ações essenciais. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400% e forced colors. Verificar `label`, `input type="file"`, `accept`, `multiple`, required/disabled, descrição/erro e foco visível. Se houver lista/progresso no produto consumidor, validar também remoção, foco e anúncios.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.FileDialog`, nome do botão, seleção simples/múltipla, cancelamento e retorno ao contexto. Validar lista/progresso na integração que os implementar.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `OpenMultipleDocuments`, rótulo, MIME types, retorno de contexto e seleção no document picker. Validar lista, remoção e progresso no host antes de promover para estável.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `fileImporter`, tipos permitidos, seleção simples/múltipla, cancelamento e retorno de contexto. Validar acesso aos nomes de arquivos e tratamento de erros na integração.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar nome/estado do botão e a integração concreta do host com o seletor de documentos nativo. A implementação do DS não deve ser considerada completa sem evidência dessa integração.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/seleção/foco/restrições/feedback e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
