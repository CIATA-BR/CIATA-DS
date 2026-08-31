# Tooltip

## Contrato

Tooltip fornece informação complementar curta sobre um controle ou termo. Não deve conter conteúdo essencial que exista apenas no hover e não deve substituir rótulo, instrução obrigatória ou ajuda persistente.

## Regras

- tooltip deve ser acionável tanto por hover quanto por foco de teclado quando essas modalidades existirem;
- o conteúdo deve permanecer visível enquanto o ponteiro estiver sobre o acionador ou sobre a própria tooltip;
- o conteúdo não pode desaparecer antes de ser lido ou explorado;
- quando a tooltip puder cobrir conteúdo ou permanecer aberta, deve existir forma previsível de dispensá-la, normalmente por `Escape`;
- não mover foco para tooltip meramente informativa;
- conteúdo essencial deve existir de forma persistente fora da tooltip;
- não usar tooltip como único nome acessível de controle;
- evitar texto excessivamente longo ou ações complexas dentro de tooltip simples;
- conteúdo interativo que exige navegação própria deve ser tratado como popover, dialog ou outro componente apropriado, e não como tooltip.

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

A implementação controla a exibição por foco/hover, permite que o ponteiro entre na própria tooltip sem fechá-la e mantém o texto associado ao botão.

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
- conteúdo permanece disponível em hover e foco enquanto necessário;
- conteúdo pode ser dispensado sem mover foco quando aplicável;
- informação essencial existe fora da tooltip quando necessário;
- conteúdo interativo complexo não foi indevidamente modelado como tooltip.

## Veja também

- [Ajuda contextual e documentação](ajuda-contextual-e-documentacao.md)
- [Foco e contexto](../receitas/foco-e-contexto.md)
