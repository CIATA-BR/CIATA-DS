# Button — iOS / SwiftUI

Implementação experimental do `CMP-0001 — Button / Botão` para iOS com SwiftUI.

## Princípios

- usa `Button` nativo do SwiftUI;
- preserva integração com VoiceOver, Switch Control, teclado externo e foco da plataforma;
- respeita Dynamic Type porque o rótulo usa `Text` sem tamanho de fonte fixo;
- adota 44 pt como altura mínima de interação;
- mantém `loading` semanticamente diferente de `disabled`;
- impede acionamentos repetidos em `loading` sem usar `.disabled(true)` apenas para processamento;
- mantém o rótulo original durante o processamento;
- o `ProgressView` é decorativo para VoiceOver e o estado é comunicado por valor/dica acessível;
- não implementa botão somente com ícone nesta primeira API.

## Variantes

- `primary` — `borderedProminent`;
- `secondary` — `bordered`;
- `danger` — `borderedProminent` com cor semântica do sistema para destruição nesta versão experimental;
- `ghost` — `plain`.

A aparência final deverá consumir os tokens CIATA quando a ponte de tokens SwiftUI estiver publicada. A API do componente não deve depender de cores literais específicas do tema.

## Loading

`isLoading` bloqueia novos acionamentos no closure, mas não torna o botão desabilitado. Isso preserva a diferença entre "indisponível" e "operação em andamento".

O app consumidor deve fornecer feedback de conclusão/erro no contexto adequado; não se deve disparar anúncios globais repetitivos a cada atualização de estado.

## Disabled

`isDisabled` usa `.disabled(true)` e deve representar indisponibilidade real da ação.

## Testes mínimos antes de estabilidade

- VoiceOver com navegação por toque e swipe;
- Dynamic Type, inclusive tamanhos de acessibilidade;
- modo claro e escuro;
- Increase Contrast/Reduce Transparency quando aplicável;
- Switch Control;
- teclado externo quando aplicável;
- loading sem perda arbitrária de foco;
- disabled exposto como estado nativo;
- variantes visuais e contraste;
- ação destrutiva com confirmação proporcional ao risco no fluxo consumidor.

## Status

Experimental. Não considerar estável antes de evidência manual em dispositivo iOS real.
