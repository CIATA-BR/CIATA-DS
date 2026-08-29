# Tooltip

## Contrato

Tooltip fornece informação complementar curta sobre um controle ou termo. Não deve conter conteúdo essencial que exista apenas no hover e não deve substituir rótulo, instrução obrigatória ou ajuda persistente.

## Regras

- tooltip deve ser acionável por teclado e ponteiro quando existir interação equivalente;
- conteúdo não pode desaparecer antes de ser lido ou explorado;
- Escape deve permitir fechar quando a tooltip for persistente/interativa;
- não mover foco para tooltip meramente informativa;
- conteúdo essencial deve existir de forma persistente fora da tooltip;
- não usar tooltip como único nome acessível de controle;
- evitar texto excessivamente longo ou ações complexas dentro de tooltip simples.

## Web

Preferir texto auxiliar persistente quando a informação for necessária. Quando tooltip for adequada, associar conteúdo ao acionador e garantir comportamento coerente em foco e hover. Não depender apenas de `title`.

## Android

Tratar tooltip como complemento, não como substituto de `contentDescription`, label ou hint necessário. Garantir que a informação seja alcançável também sem exploração visual por toque.

## iOS

Informação essencial deve estar disponível por label, hint ou conteúdo persistente. Não assumir que um padrão visual de tooltip será descoberto ou anunciado automaticamente pelo VoiceOver.

## Exemplo conforme

```html
<button aria-describedby="ajuda-senha">Regras da senha</button>
<div id="ajuda-senha" role="tooltip">Use pelo menos 12 caracteres.</div>
```

A implementação controla a exibição por foco/hover, mantendo o texto associado ao botão.

## Comportamento esperado

Ao focar `Regras da senha`, a pessoa consegue acessar a informação complementar sem perder o foco do botão. Se a tooltip for fechável, há forma de dispensá-la sem alterar a tarefa.

## Exemplo não conforme

```html
<button title="Use pelo menos 12 caracteres">?</button>
```

O botão não tem nome significativo e toda a instrução depende do comportamento de `title`/hover.

## Por que falha

A descoberta é inconsistente entre teclado, toque, leitores de tela e mobile. A pessoa pode ouvir apenas “botão” ou “?” e nunca receber a instrução necessária.

## Critérios de teste

- acionador possui nome próprio;
- informação é acessível por teclado e leitor de tela;
- tooltip não rouba foco;
- conteúdo não desaparece prematuramente;
- informação essencial existe fora da tooltip quando necessário;
- fechamento por Escape funciona quando aplicável.