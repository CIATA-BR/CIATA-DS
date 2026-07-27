# Acessibilidade da marca CIATA

A marca deve ser aplicada sem criar anúncios duplicados, perda de contexto ou dependência visual.

## Logo dentro do link da página inicial

```html
<a href="/" aria-label="Página inicial do CIATA">
  <img
    src="/assets/ciata/logo-horizontal.svg"
    alt=""
    width="580"
    height="230"
  >
</a>
```

O nome acessível pertence ao link. O atributo `alt` vazio impede que leitores de tela anunciem o nome duas vezes.

## Logo como imagem informativa isolada

```html
<img
  src="/assets/ciata/logo-horizontal.svg"
  alt="CIATA - Centro de Inclusão Através da Tecnologia Assistiva"
  width="580"
  height="230"
>
```

## Requisitos

- Não usar a marca como fundo CSS quando ela precisar ser anunciada.
- Não incluir expressões como “imagem de” ou “logotipo de” no texto alternativo.
- Definir largura e altura intrínsecas para evitar mudança de layout.
- Preservar proporção, área de proteção e tamanho mínimo definidos no manual.
- Escolher apenas uma das composições oficiais conforme o fundo e o espaço disponível.
- Nunca recolorir a marca para resolver contraste.
- A marca não substitui o título textual da página.

## Validação

Validar o contexto real com teclado, NVDA, JAWS, VoiceOver, TalkBack, Jieshuo e linha Braille quando disponível. A inspeção do código, isoladamente, não comprova compatibilidade.
