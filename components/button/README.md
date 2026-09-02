# Button / Botão — implementações iniciais

Status: experimental.

A fonte canônica de comportamento é `components/button/spec.md`. Os arquivos desta pasta são implementações de referência e não substituem a especificação.

## Web

Arquivos:

- `web/button.css` — estilos e estados visuais;
- `web/button.js` — prevenção de acionamento repetido em `loading` e atualização de estado acessível.

Exemplo mínimo:

```html
<button class="ciata-button" type="button">
  <span data-ciata-button-label>Salvar alterações</span>
  <span class="ciata-visually-hidden" data-ciata-button-status aria-live="polite" aria-atomic="true"></span>
</button>
```

Para habilitar o comportamento de loading:

```js
import { enhanceCiataButton, setCiataButtonLoading } from './button.js';

const button = document.querySelector('.ciata-button');
enhanceCiataButton(button);

setCiataButtonLoading(button, true, { loadingLabel: 'Salvando alterações' });
// ... após a operação
setCiataButtonLoading(button, false);
```

`loading` não é convertido em `disabled` nativo. O botão permanece no fluxo de foco, recebe `aria-busy="true"` e `aria-disabled="true"`, e a implementação bloqueia acionamentos repetidos enquanto a operação está em andamento.

`disabled` real continua disponível para situações em que a ação realmente não pode ser executada.

## Laravel / Blade

O arquivo `laravel/button.blade.php` é uma implementação de referência para projetos Laravel.

Exemplo:

```blade
<x-ciata-button type="submit" variant="primary">
    Salvar alterações
</x-ciata-button>
```

Loading:

```blade
<x-ciata-button
    type="submit"
    variant="primary"
    :loading="$saving"
    loading-label="Salvando alterações"
>
    Salvar alterações
</x-ciata-button>
```

A aplicação consumidora deve carregar `web/button.css`. Para alternar loading dinamicamente no cliente, deve também carregar `web/button.js` e usar `setCiataButtonLoading`.

## Variantes

- `primary`;
- `secondary`;
- `danger`;
- `ghost`.

A variante `danger` não substitui confirmação, desfazer ou outro mecanismo de prevenção de erro quando necessário.

## Acessibilidade

A implementação:

- usa `<button>` nativo;
- preserva nome e papel nativos;
- mantém foco visível;
- suporta teclado pelo comportamento nativo do navegador;
- estabelece alvo mínimo de 44 × 44 CSS px na implementação de referência;
- diferencia `loading` de `disabled`;
- fornece região de status interna para feedback de loading;
- possui tratamento para `forced-colors`;
- não depende exclusivamente de cor para foco ou estado.

Ícones acompanhados de texto devem ser decorativos para tecnologias assistivas quando não acrescentarem informação. Botões somente com ícone exigem nome acessível inequívoco.

## Tokens

As cores consomem aliases semânticos já existentes do CIATA-DS.

Os valores de espaçamento, raio e dimensão usados nesta primeira implementação correspondem aos valores aprovados na RFC-0002. Assim que esses valores forem publicados como tokens consumíveis, esta implementação deverá trocar os valores literais pelos tokens canônicos sem alterar o contrato do componente.

## Validação necessária antes de estabilidade

Antes da promoção para estável, registrar evidência pelo menos para:

- Chrome + JAWS;
- Chrome/Firefox + NVDA;
- Safari + VoiceOver;
- teclado sem leitor de tela;
- zoom e reflow;
- forced colors/alto contraste quando disponível;
- variantes, disabled e loading;
- tema claro e escuro quando a implementação de tema da RFC-0002 estiver disponível.
