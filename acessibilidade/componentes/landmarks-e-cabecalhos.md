# Landmarks e cabeçalhos

## Contrato

Landmarks e cabeçalhos estruturam a página e permitem navegação rápida por regiões e níveis de conteúdo. A hierarquia deve representar a organização real da informação, sem depender apenas do tamanho visual do texto.

## Regras

- usar regiões semânticas como `header`, `nav`, `main`, `aside` e `footer` quando representam essas funções;
- manter apenas uma região `main` ativa por página ou contexto equivalente;
- nomear regiões repetidas quando necessário para diferenciá-las;
- usar cabeçalhos em ordem lógica, evitando saltos usados apenas por aparência;
- não transformar texto em heading apenas para obter estilo visual;
- não usar `aria-label` em elementos genéricos sem função quando uma estrutura semântica adequada resolve o caso;
- preservar uma estrutura compreensível quando conteúdo é inserido dinamicamente.

## Web

Preferir elementos semânticos nativos e `h1` a `h6` conforme a hierarquia real. Landmarks ARIA devem complementar, não duplicar desnecessariamente, a semântica nativa.

## Android

Expor títulos e regiões relevantes usando a semântica do toolkit. Cabeçalhos devem ser identificáveis pela navegação do leitor de tela quando o framework oferece essa capacidade.

## iOS

Expor títulos importantes com heading trait quando apropriado e preservar agrupamento lógico entre regiões e conteúdo relacionado.

## Exemplo conforme

```html
<header>...</header>
<nav aria-label="Navegação principal">...</nav>
<main>
  <h1>Minha conta</h1>
  <section>
    <h2>Dados pessoais</h2>
    ...
  </section>
</main>
<footer>...</footer>
```

## Comportamento esperado

A pessoa usuária consegue chegar rapidamente à navegação principal, ao conteúdo principal e aos títulos da página. Um leitor de tela deve reconhecer `Minha conta` como título principal e `Dados pessoais` como subseção.

## Exemplo não conforme

```html
<div class="titulo-grande">Minha conta</div>
<div aria-label="Navegação principal">...</div>
<div class="subtitulo">Dados pessoais</div>
```

## Por que falha

A aparência visual sugere estrutura, mas a árvore de acessibilidade não recebe cabeçalhos ou regiões equivalentes. A navegação por heading ou landmark pode não encontrar esses pontos.

## Critérios de teste

- headings são encontrados em ordem lógica;
- landmarks principais são identificáveis e não se duplicam sem necessidade;
- regiões repetidas possuem nomes distinguíveis quando necessário;
- navegação por heading/rotor/atalho equivalente alcança os pontos esperados;
- zoom e reflow não alteram a ordem lógica da estrutura.