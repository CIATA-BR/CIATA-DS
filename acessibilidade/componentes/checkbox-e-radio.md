# Checkbox e radio

## Contrato

Checkbox representa seleção independente. Radio representa escolha exclusiva dentro de um grupo. Ambos devem expor nome, função, estado e relação de grupo quando aplicável.

## Regras

- usar controles nativos sempre que possível;
- checkbox deve comunicar marcado, desmarcado e indeterminado quando esse estado existir;
- radio deve comunicar selecionado ou não selecionado e pertencer a um grupo nomeado;
- o rótulo deve ser clicável/tocável junto com o controle quando apropriado;
- não usar apenas cor, ícone ou posição para indicar seleção;
- grupos de opções devem possuir nome ou legenda compreensível;
- não duplicar o estado no nome acessível quando a plataforma já o anuncia.

## Web

Preferir `<input type="checkbox">` e `<input type="radio">` associados a `<label>`. Para grupos de radio, preferir `fieldset` e `legend` quando a estrutura exigir um nome de grupo.

## Android

Usar componentes nativos ou equivalentes do toolkit e garantir que seleção, nome e agrupamento sejam expostos semanticamente. Evitar cards clicáveis que escondam o controle real da árvore de acessibilidade sem necessidade.

## iOS

Usar controles e traits coerentes com seleção. Quando o padrão visual não tiver equivalente nativo direto, expor estado selecionado e relação entre opções de forma previsível ao VoiceOver.

## Critérios de teste

- leitor de tela anuncia nome, função e estado;
- alteração de seleção é anunciada;
- radio mantém exclusividade dentro do grupo;
- grupo possui contexto suficiente;
- teclado ou gesto equivalente altera a seleção;
- estado permanece perceptível sem depender apenas de cor.
