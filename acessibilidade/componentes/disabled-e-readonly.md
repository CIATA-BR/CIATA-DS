# Disabled e read-only

## Contrato

`Disabled` e `read-only` representam estados diferentes e não devem ser tratados como sinônimos. Um controle desabilitado não está disponível para interação; um campo somente leitura continua sendo conteúdo disponível para consulta, seleção e cópia quando a plataforma permitir.

## Regras

- usar `disabled` apenas quando a ação realmente não estiver disponível;
- usar `read-only` quando o valor deve permanecer acessível, mas não editável;
- não comunicar indisponibilidade apenas por cor, opacidade ou aparência;
- explicar o motivo da indisponibilidade quando ele não for óbvio e isso ajudar a pessoa a concluir a tarefa;
- não remover informação necessária da ordem de leitura apenas porque ela não pode ser editada;
- evitar controles permanentemente desabilitados sem contexto sobre o que os habilita;
- estados devem ser consistentes entre aparência visual e semântica acessível;
- não depender exclusivamente de `aria-describedby` em controles nativamente desabilitados para explicar o motivo, porque eles podem deixar de receber foco por teclado;
- quando a razão da indisponibilidade for importante, apresentá-la também de forma persistente e perceptível no contexto da interface.

## Web

Usar atributos nativos `disabled` e `readonly` quando correspondem ao comportamento real. Não simular desabilitação apenas com CSS ou bloqueio de evento. Campos somente leitura devem continuar associados ao rótulo.

## Android

Expor corretamente se o componente está habilitado e, no caso de conteúdo somente leitura, manter nome e valor disponíveis à árvore de acessibilidade. Não transformar dados consultáveis em texto inacessível apenas para impedir edição.

## iOS

Preservar o valor e a função do conteúdo consultável mesmo quando a edição estiver indisponível. O estado desabilitado deve ser comunicado pela API de acessibilidade e não apenas por aparência.

## Exemplo conforme

```html
<label for="cpf">CPF</label>
<input id="cpf" value="123.456.789-00" readonly>

<p id="motivo-salvar">Revise os campos obrigatórios para habilitar o envio.</p>
<button type="submit" disabled>Salvar</button>
```

## Comportamento esperado

O campo CPF continua identificável e consultável, mas não editável. O botão `Salvar` é percebido como indisponível e o motivo para habilitá-lo existe de forma persistente no contexto, sem depender de foco no próprio botão.

## Exemplo não conforme

```html
<input value="123.456.789-00" disabled>
<div class="botao-desabilitado">Salvar</div>
```

## Por que falha

O CPF perde rótulo e pode se tornar menos acessível para consulta. O falso botão depende apenas de aparência e não expõe função nem estado. A pessoa não sabe por que não consegue prosseguir.

## Critérios de teste

- read-only continua anunciando nome e valor;
- disabled é anunciado como indisponível;
- estado visual e semântico coincidem;
- a razão da indisponibilidade é compreensível sem depender do foco em um controle desabilitado;
- conteúdo somente leitura pode ser revisado sem depender da visão;
- foco não entra em falsos controles sem função.

## Veja também

- [Campo de texto](campo-de-texto.md)
- [Formulários e erros](../receitas/formularios-e-erros.md)
