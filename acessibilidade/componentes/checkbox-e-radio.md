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

## Exemplos práticos

### Conforme — checkbox

```html
<input id="comunicacoes" type="checkbox" name="comunicacoes">
<label for="comunicacoes">Quero receber comunicações da CIATA</label>
```

**Comportamento esperado:** anúncio equivalente a `Quero receber comunicações da CIATA, caixa de seleção, desmarcada`. Ao alterar, o novo estado é comunicado automaticamente.

### Conforme — grupo de radio

```html
<fieldset>
  <legend>Forma de contato preferida</legend>
  <input id="email" type="radio" name="contato" value="email">
  <label for="email">E-mail</label>
  <input id="telefone" type="radio" name="contato" value="telefone">
  <label for="telefone">Telefone</label>
</fieldset>
```

**Comportamento esperado:** a pessoa recebe o contexto `Forma de contato preferida`, identifica cada opção como radio e percebe qual está selecionada.

### Não conforme

```html
<div class="checkbox-visual"></div>
<span>Quero receber comunicações da CIATA</span>
```

**Por que falha:** aparência de checkbox não cria semântica. O elemento pode não receber foco, não comunicar estado e não ser operável por teclado ou tecnologia assistiva.

Em radio, outro erro é apresentar opções visuais sem agrupamento ou permitir que duas opções mutuamente exclusivas permaneçam selecionadas ao mesmo tempo.

**Por que falha:** a pessoa perde o contexto da pergunta e a relação lógica entre as escolhas.

## Critérios de teste

- leitor de tela anuncia nome, função e estado;
- alteração de seleção é anunciada;
- radio mantém exclusividade dentro do grupo;
- grupo possui contexto suficiente;
- teclado ou gesto equivalente altera a seleção;
- estado permanece perceptível sem depender apenas de cor.
