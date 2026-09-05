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
| FUP-04 | Único/múltiplo | O comportamento simples/múltiplo corresponde ao contrato exposto; um modo não substitui silenciosamente o outro. |
| FUP-05 | Lista | Nome, tamanho/estado relevante e ordem dos arquivos permanecem perceptíveis. |
| FUP-06 | Remover/substituir | Cada arquivo pode ser removido/substituído por ação nomeada e previsível. |
| FUP-07 | Drag equivalente | Drop zone possui alternativa por teclado/toque/leitor de tela. |
| FUP-08 | Teclado | Seleção e ações não dependem de ponteiro. |
| FUP-09 | Foco | Selecionar, remover, cancelar ou falhar não provoca perda arbitrária de foco. |
| FUP-10 | Tipo/tamanho/quantidade | Restrições inválidas são rejeitadas com motivo específico. |
| FUP-11 | Progresso | Upload determinável expõe progresso sem excesso de anúncios. |
| FUP-12 | Erro | Falha identifica arquivo e causa, não depende apenas de cor. |
| FUP-13 | Sucesso | Conclusão é perceptível visual e programaticamente. |
| FUP-14 | Cancelamento | Cancelar seletor não é tratado como erro; upload cancelável possui ação explícita quando aplicável. |
| FUP-15 | Alvo | Ações interativas respeitam alvo mínimo da plataforma. |
| FUP-16 | Tema | Seleção, foco e estados permanecem perceptíveis em claro/escuro/sistema. |
| FUP-17 | Alto contraste | Controles, foco, erro e sucesso permanecem distinguíveis. |
| FUP-18 | Escala | Zoom/text scaling não corta restrições, nomes ou ações essenciais. |
| FUP-19 | Validação servidor | Servidor revalida tipo, tamanho e quantidade independentemente do cliente. |
| FUP-20 | Limites de runtime | Limites do runtime/proxy/webserver não contradizem silenciosamente os limites anunciados. |
| FUP-21 | Nome de arquivo hostil | Nomes longos, Unicode, RTL, espaços e caracteres especiais não quebram UI, foco ou armazenamento. |
| FUP-22 | Tipo real | Extensão/MIME declarado pelo cliente não é a única fonte de confiança. |
| FUP-23 | Repetição/duplicidade | Selecionar o mesmo arquivo novamente produz comportamento previsível e documentado. |
| FUP-24 | Erro de picker | Falha do seletor chega ao host e pode receber feedback acessível; cancelamento continua distinto. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400% e forced colors. Verificar `label`, `input type="file"`, `accept`, `multiple`, required/disabled, descrição/erro e foco visível. Confirmar formulário `multipart/form-data`, validação server-side, limites de PHP/webserver e tratamento seguro do nome/armazenamento. Se houver lista/progresso no produto consumidor, validar também remoção, foco e anúncios.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.FileDialog`, nome programático do botão, título do diálogo, seleção simples/múltipla, cancelamento e retorno ao contexto. Validar lista/progresso na integração que os implementar.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `OpenMultipleDocuments`, rótulo e MIME types normalizados, retorno de contexto e seleção no document picker. Antes de promover para estável, validar explicitamente o contrato de seleção simples versus múltipla, lista, remoção e progresso no host.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `fileImporter`, tipos permitidos, seleção simples/múltipla, cancelamento, retorno de contexto e propagação de falhas via integração. Quando URLs forem usadas após o callback, validar o tratamento de acesso security-scoped/cópia conforme o fluxo do host.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar nome/estado do botão, validação de rótulo em build de release e a integração concreta do host com o seletor de documentos nativo. A implementação do DS não deve ser considerada completa sem evidência dessa integração.

## Promoção de status
Uma implementação só pode passar de `experimental` para `estável` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/seleção/foco/restrições/feedback/segurança e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
