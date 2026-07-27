# Implementação da marca CIATA em produtos digitais

## Cabeçalho preferencial

Quando o fundo e o espaço forem adequados, use a composição horizontal colorida.

```html
<a href="/" aria-label="Página inicial do CIATA">
  <img
    src="/assets/ciata/ciata-logo-horizontal.svg"
    alt=""
    width="580"
    height="230"
    decoding="async"
  >
</a>
```

A aplicação pode reduzir visualmente a imagem por CSS, mas deve preservar a proporção. Os atributos `width` e `height` registram a proporção intrínseca e evitam mudança de layout.

## Uso informativo isolado

```html
<img
  src="/assets/ciata/ciata-logo-horizontal.svg"
  alt="CIATA - Centro de Inclusão Através da Tecnologia Assistiva"
  width="580"
  height="230"
  loading="lazy"
  decoding="async"
>
```

## Escolha da composição

- Cabeçalhos claros e espaço horizontal suficiente: versão horizontal colorida.
- Espaço vertical: versão vertical colorida.
- Fundo escuro: composição monocromática oficial para fundo escuro.
- Fundo claro que exija monocromia: composição monocromática oficial para fundo claro.

Não recolorir SVG, não aplicar filtros CSS e não produzir variante própria para tema escuro.

## Tokens

Importe os tokens em vez de espalhar cores literais:

```css
@import url("./tokens/cores.css");
@import url("./tokens/tipografia.css");
```

Use os tokens de marca somente para identidade. Em interfaces, prefira tokens semânticos para superfícies, texto, links, ações, bordas, foco e estados.

## Contraste

Toda combinação deve ser verificada no contexto real. O amarelo institucional não deve receber texto branco. Para foco sobre superfícies claras, use contorno amarelo acompanhado de contraste externo escuro quando necessário.

## Desempenho

- Priorizar SVG para a marca.
- Não carregar fonte externa quando Segoe UI ou os fallbacks do sistema estiverem disponíveis.
- Definir dimensões intrínsecas.
- Não carregar variantes da marca que não serão exibidas.
- Evitar JavaScript para seleção puramente responsiva; use HTML e CSS.

## Checklist de aceite

- composição oficial sem alteração visual;
- proporção e área de proteção preservadas;
- nome acessível correto para o contexto;
- ausência de anúncio duplicado;
- dimensões intrínsecas definidas;
- contraste WCAG 2.2 AA para a interface ao redor;
- foco visível e operação por teclado;
- teste em 200% de zoom e 320 CSS pixels;
- validação conceitual e manual com tecnologias assistivas aplicáveis.
