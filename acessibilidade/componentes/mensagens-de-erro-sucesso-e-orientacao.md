# Mensagens de erro, sucesso e orientação

## Contrato

Mensagens de estado devem explicar o que aconteceu, o impacto para a tarefa e a próxima ação possível sem depender apenas de cor, ícone, posição visual ou conhecimento técnico.

## Regras

- erro deve identificar o problema em linguagem compreensível e, quando possível, indicar como corrigir;
- sucesso deve confirmar a ação realizada sem criar anúncios excessivos;
- mensagens devem ficar associadas ao campo, etapa ou ação correspondente quando houver relação direta;
- evitar códigos internos, stack traces ou mensagens genéricas como `Erro inesperado` quando existir orientação mais útil;
- não culpar a pessoa pelo erro nem usar linguagem punitiva;
- mensagens críticas devem ser perceptíveis por tecnologia assistiva sem mover foco desnecessariamente;
- a mensagem não deve desaparecer antes que possa ser revisada;
- quando a ação não puder ser concluída, preservar os dados já informados sempre que possível.

## Exemplo conforme

`Não foi possível enviar o formulário porque o campo CPF está incompleto. Revise o CPF e tente novamente.`

## Exemplo não conforme

`Erro 422.`

## Por que falha

Códigos e mensagens vagas não informam o que deve ser feito. Para quem não acompanha a mudança visual, o erro pode parecer ausência de resposta da interface.

## Critérios de teste

- a mensagem explica o problema sem exigir conhecimento técnico;
- existe orientação de correção quando aplicável;
- o relacionamento com o campo ou etapa é perceptível;
- mensagens dinâmicas não roubam foco;
- sucesso e erro não dependem exclusivamente de cor ou ícone;
- conteúdo permanece disponível tempo suficiente para revisão.