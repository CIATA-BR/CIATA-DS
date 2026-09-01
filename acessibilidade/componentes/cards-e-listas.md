# Cards e listas

## Contrato

Cards agrupam conteúdo relacionado. Listas comunicam conjuntos de itens. A estrutura deve permanecer compreensível sem depender da disposição visual e sem criar múltiplos focos redundantes para a mesma ação.

## Regras

- usar semântica de lista quando o conjunto representa uma coleção de itens equivalentes;
- evitar transformar o card inteiro em botão quando há várias ações independentes dentro dele;
- se todo o card leva ao mesmo destino, garantir um único destino principal claro e foco previsível;
- não duplicar o mesmo link várias vezes dentro do card sem necessidade;
- manter título, metadados, descrição e ações em ordem lógica;
- não tornar texto informativo focável apenas para imitar comportamento visual;
- preservar leitura compreensível quando CSS de grid/flex é removido ou alterado.

## Web

Preferir `ul`/`ol` e `li` para coleções quando aplicável. Um card pode usar `article` quando possui conteúdo autônomo. Evitar `div` com `onclick` envolvendo controles filhos.

## Android e iOS

Agrupar semanticamente quando isso melhora a navegação, mas sem ocultar ações internas necessárias. Evitar que o leitor de tela anuncie o card inteiro e depois repita todo o conteúdo novamente em controles filhos.

## Exemplo conforme

```html
<ul class="produtos">
  <li>
    <article>
      <h2><a href="/produto/123">Teclado acessível</a></h2>
      <p>Compatível com Windows e macOS.</p>
      <button type="button">Adicionar aos favoritos</button>
    </article>
  </li>
</ul>
```

## Comportamento esperado

O leitor de tela identifica uma lista, o título como link para o produto e o botão como ação independente. A pessoa entende onde termina um item e começa o próximo.

## Exemplo não conforme

```html
<div onclick="abrirProduto()" tabindex="0">
  <div class="titulo">Teclado acessível</div>
  <button>Adicionar aos favoritos</button>
</div>
```

## Por que falha

O card vira um controle genérico que contém outro controle interativo. Isso pode causar ativação duplicada, foco confuso e falta de semântica de lista, título ou destino principal.

## Critérios de teste

- coleção é percebida como lista quando aplicável;
- ordem de leitura independe do layout visual;
- ações internas permanecem distinguíveis;
- não há focos duplicados para a mesma ação;
- card inteiro não interfere na ativação dos controles filhos.