# Link

## Contrato

Link representa navegação para outro destino, documento, rota ou recurso. Não deve ser usado como substituto de botão para executar ação local sem mudança de destino.

## Regras

- o texto do link deve identificar seu propósito de forma compreensível no contexto;
- evitar textos genéricos como `clique aqui`, `saiba mais` ou `leia mais` quando houver ambiguidade;
- links com mesmo texto e destinos diferentes precisam de contexto suficiente para distinção;
- estado visual não pode depender apenas de cor;
- links que abrem nova janela, aplicativo externo, download ou mudança relevante de contexto devem ser previsíveis quando isso puder surpreender a pessoa usuária;
- não incluir a palavra "link" no nome acessível quando a plataforma já anuncia a função.

## Web

Usar `<a href="...">` para navegação real. Evitar âncoras sem `href` usadas apenas como controles de ação. O link deve permanecer alcançável e ativável por teclado.

## Android

Quando o elemento representa navegação, exponha semântica coerente de link quando o toolkit oferecer esse papel. Em listas ou cards, evite duplicar vários elementos focáveis que executam exatamente a mesma navegação sem necessidade.

## iOS

Expor trait de link quando o comportamento for navegação. Se um elemento visualmente parecido executar uma ação local, utilizar semântica de botão em vez de link.

## Exemplos práticos

### Conforme

```html
<a href="/acessibilidade/processo-de-auditoria">
  Processo de auditoria de acessibilidade
</a>
```

**Comportamento esperado:** anúncio equivalente a `Processo de auditoria de acessibilidade, link`. O destino é coerente com o nome e o link recebe foco normalmente.

### Não conforme

```html
<a href="/acessibilidade/processo-de-auditoria">Clique aqui</a>
```

**Por que falha:** fora do contexto, `Clique aqui` não informa o destino ou a finalidade. Em uma lista de links, vários itens iguais tornam a navegação ambígua.

Outro erro recorrente é apresentar visual e semanticamente um link para executar uma ação local como `Salvar`, sem navegação real.

**Por que falha:** a tecnologia assistiva anuncia função de link, mas o comportamento esperado é de botão. A semântica e a expectativa de interação não correspondem à ação executada.

## Critérios de teste

- propósito é compreensível com leitor de tela;
- foco é visível;
- ativação por teclado ou gesto equivalente funciona;
- destino corresponde ao rótulo anunciado;
- múltiplos links semelhantes continuam distinguíveis;
- mudança inesperada de contexto não ocorre sem indicação adequada.
