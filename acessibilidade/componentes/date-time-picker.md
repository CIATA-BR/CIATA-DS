# Date e time picker

## Contrato

Seletores de data e hora devem permitir entrada e escolha com contexto suficiente, sem obrigar exploração visual de calendário ou relógio.

## Regras

- campo possui rótulo e formato esperado;
- digitação direta permanece disponível quando apropriada;
- abertura do seletor é anunciável e não apaga o valor atual;
- calendário expõe mês, ano, dia, estado selecionado e indisponibilidade;
- navegação entre períodos é operável por teclado e tecnologia assistiva;
- datas bloqueadas ou limites são comunicados antes ou durante a escolha;
- horário expõe valor e incrementos de forma previsível;
- fechamento retorna foco ao campo ou acionador correspondente.

## Exemplo conforme

“Data de nascimento, campo de edição, formato DD/MM/AAAA” permite digitação direta ou abrir um calendário acessível, com dias nomeados e data selecionada identificável.

### Comportamento esperado

A pessoa consegue informar a data sem depender do componente visual e, ao usar o seletor, entende período, opções e valor escolhido.

## Exemplo não conforme

O campo é somente leitura e abre um calendário em grade sem nomes acessíveis para os dias e sem operação por teclado.

### Por que falha

A pessoa fica presa a uma interação visual e pode não conseguir identificar nem selecionar a data desejada.

## Critérios de teste

- formato é compreensível;
- entrada direta funciona quando aplicável;
- datas e horários são anunciados com contexto;
- seleção e indisponibilidade são perceptíveis;
- navegação por período funciona;
- foco retorna corretamente ao fechar.
