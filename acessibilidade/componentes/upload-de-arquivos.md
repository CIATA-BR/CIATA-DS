# Upload de arquivos

## Contrato

Upload deve permitir selecionar, revisar, remover e reenviar arquivos com informação acessível sobre formatos, limites, progresso, sucesso e erro.

## Regras

- botão de seleção possui nome claro;
- formatos, quantidade e tamanho máximo são informados antes da seleção;
- nome e estado de cada arquivo selecionado permanecem disponíveis;
- progresso é comunicado sem anúncios excessivos;
- erro identifica arquivo, motivo e ação de correção;
- remover ou substituir arquivo deve ser operável sem arrastar;
- seleção por câmera, galeria ou arquivos deve preservar equivalência quando oferecida.

## Exemplo conforme

“Selecionar comprovante, botão. Formatos PDF ou JPG, até 10 MB.” Após a escolha, o arquivo aparece como “comprovante.pdf, 2,4 MB, enviado” com ação “Remover comprovante.pdf”.

### Comportamento esperado

A pessoa sabe o que pode enviar, qual arquivo foi selecionado, o progresso da operação e como corrigir ou remover o item.

## Exemplo não conforme

Uma área visual diz apenas “Arraste seu arquivo aqui”, sem botão equivalente, sem requisitos e sem feedback acessível após o envio.

### Por que falha

A jornada depende de gesto específico e de feedback visual; teclado, leitor de tela e pessoas com dificuldade motora podem não concluir a tarefa.

## Critérios de teste

- seleção funciona por teclado e tecnologia assistiva;
- requisitos são conhecidos antes do envio;
- nome, tamanho e estado do arquivo são perceptíveis;
- progresso e erros são comunicados;
- remover/substituir não exige arrastar;
- foco permanece previsível após sucesso ou falha.
