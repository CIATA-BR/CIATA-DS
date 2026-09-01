# Mapas e conteúdo espacial

## Objetivo
Garantir acesso a localização, rota, proximidade e relações espaciais sem depender exclusivamente de exploração visual do mapa.

## Regras
- mapa não deve ser a única forma de encontrar ou selecionar um local;
- fornecer lista textual equivalente de locais, resultados ou etapas de rota;
- cada marcador relevante deve possuir nome e informação contextual;
- zoom, arraste e pinça precisam de alternativas por controles simples;
- instruções de rota devem usar referências compreensíveis sem depender apenas de “à esquerda no mapa”;
- estado de localização, permissão, carregamento e erro deve ser anunciado;
- foco não pode saltar de forma imprevisível quando o mapa é atualizado.

## Exemplo conforme
Um mapa de unidades da CIATA é acompanhado por uma lista ordenada por distância, com nome, endereço, distância e botão “Ver detalhes”. Controles de zoom possuem rótulos acessíveis.

## Comportamento esperado
A pessoa consegue localizar, comparar e selecionar unidades sem precisar explorar a superfície gráfica.

## Exemplo não conforme
A interface mostra apenas pinos em um mapa e exige arrastar e dar zoom para descobrir os endereços.

## Por que falha
A tarefa depende de visão e manipulação espacial precisa, sem alternativa equivalente.

## Critérios mínimos de teste
- concluir a tarefa usando apenas a alternativa textual;
- testar controles sem gestos complexos;
- verificar anúncio de localização, erro e atualização;
- confirmar foco estável ao selecionar um resultado.
