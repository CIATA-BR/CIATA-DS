# Comentários, reações e colaboração

## Objetivo

Comentários, reações e alterações colaborativas devem manter autoria, contexto, estado e relação com o conteúdo correspondente de forma compreensível por tecnologia assistiva.

## Regras

- comentários devem identificar autor, data ou horário quando relevante e relação com o trecho ou objeto comentado;
- respostas devem preservar estrutura de thread sem depender apenas de indentação visual;
- reações devem expor tipo, quantidade e estado da pessoa, por exemplo `Curtir, 3 reações, você reagiu`;
- ações como responder, resolver, reabrir, editar e excluir devem possuir nomes acessíveis específicos;
- comentários resolvidos ou pendentes devem possuir estado programaticamente perceptível;
- seleção de trecho para comentar deve possuir alternativa operável por teclado ou mecanismo equivalente;
- alterações de outros colaboradores não devem mover o foco da pessoa que está editando;
- conflitos de edição devem ser apresentados em linguagem compreensível e com opções explícitas;
- cursores ou seleções remotas puramente visuais não podem ser a única forma de indicar colaboração ativa.

## Exemplo conforme

Um comentário é anunciado como `Ana Souza, comentário em “Prazo de entrega”, 14:40: Podemos alterar para sexta-feira? Não resolvido.` As ações seguintes são `Responder ao comentário de Ana` e `Resolver comentário de Ana`.

## Comportamento esperado

A pessoa entende quem comentou, sobre qual conteúdo, qual é o estado da discussão e quais ações estão disponíveis sem depender da posição visual do balão.

## Exemplo não conforme

O comentário aparece como um ícone lateral sem nome; ao abrir, autor e trecho relacionado só são distinguíveis pela posição e por cores diferentes.

## Por que falha

A pessoa perde a relação entre comentário e conteúdo, dificultando revisão, resposta e resolução colaborativa.

## Critérios mínimos de teste

- criar comentário sem mouse quando aplicável;
- navegar por threads e respostas;
- identificar autor, contexto e estado resolvido ou pendente;
- adicionar e remover reação;
- receber alteração de outro colaborador sem perda de foco;
- validar conflitos de edição e opções de resolução com leitor de tela.
