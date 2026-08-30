# Gestos complexos e movimento do dispositivo

## Contrato

Ações não devem depender exclusivamente de gestos complexos, trajetórias específicas ou movimentos físicos do dispositivo quando puderem ser realizadas por uma alternativa simples e equivalente.

## Regras

- oferecer alternativa por toque simples, botão ou controle equivalente para arrastar, pinçar, desenhar trajetórias ou sacudir o dispositivo;
- não exigir precisão motora desnecessária;
- preservar a mesma consequência e autonomia na alternativa acessível;
- não esconder a alternativa apenas de pessoas que usam tecnologia assistiva;
- gestos essenciais devem ser documentados e testados com leitores de tela e mecanismos alternativos de entrada;
- evitar conflitos com gestos reservados por tecnologias assistivas.

## Exemplo conforme

Item de lista pode ser reordenado por arrastar e soltar, mas também possui ações acessíveis `Mover para cima` e `Mover para baixo`.

### Comportamento esperado

A pessoa consegue realizar a mesma tarefa sem executar a trajetória de arrastar e recebe confirmação da nova posição.

## Exemplo não conforme

Arquivo só pode ser movido segurando e arrastando até uma área específica da tela, sem ação alternativa.

### Por que falha

Pessoas com limitações motoras, teclado, leitor de tela ou outros mecanismos de entrada podem ficar impedidas de concluir a tarefa.

## Critérios de teste

- toda ação por gesto complexo possui alternativa equivalente quando aplicável;
- alternativa é alcançável e nomeada;
- resultado da ação é comunicado;
- foco permanece previsível após a operação;
- não há conflito com gestos do leitor de tela;
- movimento do dispositivo nunca é a única forma de concluir uma ação não essencialmente física.
