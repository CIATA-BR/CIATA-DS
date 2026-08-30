# Autocomplete e sugestões

## Contrato

Autocomplete deve permitir entrada livre e seleção de sugestões sem substituir o valor digitado inesperadamente, preservando nome, foco, valor e contexto da lista de opções.

## Regras

- campo mantém rótulo persistente;
- sugestões são relacionadas programaticamente ao campo;
- abertura e fechamento da lista são perceptíveis;
- foco visual e foco de acessibilidade permanecem previsíveis;
- digitação não pode ser interrompida por anúncios excessivos;
- seleção por teclado, toque e tecnologia assistiva deve produzir o mesmo resultado;
- quantidade de resultados pode ser anunciada de forma concisa quando útil;
- ausência de resultados deve ser comunicada sem mover o foco indevidamente.

## Exemplo conforme

Campo “Cidade” permite digitar “São”, informa que há sugestões e permite percorrê-las com teclado ou leitor de tela sem apagar o texto já digitado.

### Comportamento esperado

A pessoa identifica o campo, seu valor atual, percebe que há sugestões e consegue escolher uma opção ou continuar digitando.

## Exemplo não conforme

A cada caractere, a primeira sugestão substitui automaticamente o conteúdo do campo e o foco é movido para a lista.

### Por que falha

A pessoa perde controle sobre a entrada, pode não saber qual valor foi inserido e precisa recuperar o contexto a cada atualização.

## Critérios de teste

- digitação contínua permanece possível;
- lista é percebida quando abre e fecha;
- sugestões podem ser percorridas e selecionadas;
- ausência de resultados é comunicada;
- foco não salta inesperadamente;
- leitores de tela não recebem anúncios repetitivos a cada tecla.
