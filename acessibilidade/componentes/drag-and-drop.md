# Drag and drop

## Contrato

Toda ação de arrastar e soltar deve possuir alternativa simples, operável e equivalente que não dependa de trajetória, precisão motora ou acompanhamento visual contínuo.

## Regras

- arrastar não pode ser a única forma de mover, ordenar ou associar itens;
- oferecer ações equivalentes como mover para cima/baixo, escolher destino ou abrir menu de reposicionamento;
- item selecionado, posição atual e resultado da movimentação devem ser perceptíveis;
- foco deve permanecer no item movido ou em contexto logicamente equivalente;
- mudanças de ordem devem ser comunicadas de forma concisa;
- operação por teclado e tecnologia assistiva deve produzir o mesmo resultado funcional.

## Exemplo conforme

Uma lista reordenável permite arrastar visualmente e também oferece “Mover item para cima” e “Mover item para baixo”. Após a ação, informa “Relatório movido para a posição 2 de 5”.

### Comportamento esperado

A pessoa consegue reorganizar itens sem gesto de arrastar e recebe confirmação suficiente para entender a nova posição.

## Exemplo não conforme

Cards só podem ser reorganizados segurando e arrastando visualmente para outra coluna.

### Por que falha

A ação exige gesto preciso e percepção espacial contínua, podendo impedir completamente usuários de teclado, leitor de tela ou mobilidade reduzida.

## Critérios de teste

- existe alternativa completa ao arraste;
- posição atual e destino são compreensíveis;
- foco permanece previsível após mover;
- resultado é anunciado sem excesso;
- teclado, toque e tecnologia assistiva produzem resultado equivalente.
