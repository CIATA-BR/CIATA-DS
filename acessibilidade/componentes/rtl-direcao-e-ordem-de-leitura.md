# RTL, direção e ordem de leitura

## Objetivo

Garantir que interfaces em idiomas da direita para a esquerda preservem estrutura, leitura, foco e significado sem depender de espelhamento visual improvisado.

## Regras

- usar mecanismos nativos de direção de texto e layout;
- preservar ordem semântica e de foco coerente com a leitura do idioma;
- não reorganizar DOM ou árvore de acessibilidade apenas para reproduzir aparência visual;
- testar componentes com conteúdo bidirecional, números, códigos, URLs e campos mistos;
- ícones direcionais devem acompanhar o significado, não apenas ser espelhados automaticamente;
- navegação por teclado e tecnologia assistiva deve seguir ordem lógica previsível.

## Exemplo conforme

```html
<section dir="rtl" lang="ar">
  <h2>العنوان</h2>
  <p>محتوى المثال</p>
</section>
```

## Comportamento esperado

Leitura visual, ordem programática e navegação por foco continuam coerentes para o idioma e para tecnologia assistiva.

## Exemplo não conforme

```html
<section class="rtl-visual">
  <div style="display:flex;flex-direction:row-reverse">
    <!-- ordem semântica não foi revisada -->
  </div>
</section>
```

## Por que falha

Espelhar apenas o layout pode gerar sequência visual diferente da sequência de leitura e foco, criando confusão e erros de operação.

## Testes mínimos

- leitura RTL completa;
- conteúdo bidirecional;
- ordem de foco;
- ícones direcionais;
- números, datas, URLs e códigos misturados ao texto.
