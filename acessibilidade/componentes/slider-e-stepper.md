# Slider e stepper

## Contrato

Controles de ajuste contínuo ou incremental devem expor nome, valor atual, limites e unidade, permitindo alteração precisa sem depender de arraste.

## Regras

- valor atual e faixa permitida são comunicados;
- unidade acompanha o valor quando necessária;
- incremento e decremento possuem alternativa por teclado, botões ou ações acessíveis;
- arraste não pode ser a única forma de alteração;
- mudanças de valor são anunciadas sem repetição excessiva;
- limites mínimo e máximo impedem alterações inválidas sem perder contexto.

## Exemplo conforme

“Volume, controle deslizante, 60%, mínimo 0%, máximo 100%” pode ser ajustado por setas ou ações de aumentar/diminuir.

### Comportamento esperado

A pessoa identifica propósito, valor e limites e consegue alterar o controle em passos previsíveis sem localizar visualmente o indicador.

## Exemplo não conforme

Uma linha com marcador arrastável controla o valor, mas não expõe função nem valor e não possui alternativa de teclado ou ações acessíveis.

### Por que falha

A pessoa não sabe o valor atual e pode não conseguir alterar o controle sem gesto de precisão.

## Critérios de teste

- nome, função, valor, unidade e limites são perceptíveis;
- incremento e decremento funcionam sem arraste;
- valor é atualizado corretamente;
- anúncios não se acumulam durante mudanças rápidas;
- limites são respeitados.
