# Botão

## Contrato

Botão representa uma ação. Deve expor nome acessível, função de botão e estado quando houver variação como pressionado, expandido, desabilitado ou carregando.

## Regras

- usar elemento/controle nativo de botão sempre que possível;
- o nome deve indicar a ação resultante, por exemplo `Salvar`, `Enviar mensagem` ou `Continuar para pagamento`;
- não repetir a palavra "botão" dentro do nome acessível quando a plataforma já anuncia a função;
- botões apenas com ícone precisam de nome acessível equivalente à ação;
- estado desabilitado deve estar disponível à tecnologia assistiva e visualmente distinguível sem depender apenas de cor;
- estado de carregamento não deve remover silenciosamente o contexto do controle;
- botões de alternância devem expor estado pressionado/selecionado apropriado;
- a ativação não deve depender exclusivamente de gesto complexo.

## Web

Preferir `<button>`. Não substituir por `div` ou `span` clicável. Enter e Espaço devem funcionar conforme a convenção nativa. Para botões de alternância, usar o estado ARIA adequado apenas quando necessário.

## Android

Preferir componentes nativos ou equivalentes do toolkit utilizado, expondo conteúdo descritivo, papel e estado pelo sistema de semântica da plataforma. Não transformar texto estático em controle clicável sem semântica de botão.

## iOS

Preferir controles nativos e traits coerentes com botão. Estados como selecionado ou desabilitado devem ser expostos pelo mecanismo de acessibilidade da plataforma, sem concatenar manualmente informações que o VoiceOver já fornece.

## Exemplos práticos

### Conforme

Botão apenas com ícone, mas com nome e semântica corretos:

```html
<button type="button" aria-label="Enviar mensagem">
  <svg aria-hidden="true" focusable="false">...</svg>
</button>
```

**Comportamento esperado:** o leitor de tela anuncia algo equivalente a `Enviar mensagem, botão`. O controle recebe foco por teclado e é ativado por Enter ou Espaço. O ícone decorativo não gera uma parada adicional.

Quando houver texto visível suficiente, o nome deve vir do próprio conteúdo:

```html
<button type="button">Continuar para pagamento</button>
```

**Comportamento esperado:** anúncio equivalente a `Continuar para pagamento, botão`, sem duplicar a palavra `botão` no nome.

### Não conforme

Elemento visualmente clicável sem nome nem função:

```html
<div onclick="enviarMensagem()">
  <svg>...</svg>
</div>
```

**Por que falha:** pode não receber foco por teclado, não expõe função de botão, o ícone pode ser anunciado sem contexto ou o controle pode ficar completamente sem nome. A pessoa usuária pode não descobrir que existe uma ação ali.

Outro erro recorrente:

```html
<button aria-label="Botão enviar mensagem">...</button>
```

**Por que falha:** a semântica já informa que é um botão, portanto o anúncio tende a ficar redundante, como `Botão enviar mensagem, botão`.

## Critérios de teste

- o leitor de tela anuncia nome e função corretos;
- Enter/Espaço ou gesto equivalente ativam o controle;
- foco é visível e não se perde após ativação;
- estado desabilitado impede ação e é anunciado;
- botão de alternância comunica mudança de estado;
- ícone sem texto continua compreensível fora do contexto visual.
