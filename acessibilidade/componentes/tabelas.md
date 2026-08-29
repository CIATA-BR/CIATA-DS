# Tabelas

## Contrato

Tabela organiza dados relacionais em linhas e colunas. Cabeçalhos, associações e contexto devem permitir que a pessoa compreenda cada célula sem depender da posição visual.

## Regras

- usar tabela apenas para dados tabulares, não para layout;
- fornecer legenda ou contexto quando necessário para identificar o conteúdo;
- cabeçalhos de coluna e linha devem ser programaticamente associados às células;
- estruturas complexas devem ser simplificadas sempre que possível;
- ordenação, filtros e ações embutidas devem ser operáveis e comunicar estado;
- não depender apenas de cor, alinhamento ou mesclagem visual para indicar relação;
- em telas pequenas, preservar relações sem transformar dados em sequência ambígua;
- tabelas grandes devem oferecer navegação e contexto suficientes sem exigir memorização excessiva.

## Web

Preferir elementos nativos `table`, `caption`, `thead`, `tbody`, `th` e `td`. Usar `scope` em cabeçalhos simples e associações explícitas quando a estrutura exigir. Controles de ordenação devem permanecer botões ou controles semanticamente corretos dentro dos cabeçalhos.

## Android

Quando a apresentação visual simular grade ou tabela, expor relações de linha, coluna, cabeçalhos e ações pelo toolkit de acessibilidade quando disponível. Em layouts responsivos, considerar transformar cada linha em bloco sem perder o nome de cada campo.

## iOS

Preservar contexto de linha e coluna para VoiceOver. Em tabelas adaptadas para cards, cada valor deve continuar associado ao respectivo rótulo, evitando sequências de números sem identificação.

## Exemplo conforme

```html
<table>
  <caption>Faturas de 2026</caption>
  <thead>
    <tr>
      <th scope="col">Mês</th>
      <th scope="col">Valor</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Agosto</th>
      <td>R$ 120,00</td>
      <td>Pago</td>
    </tr>
  </tbody>
</table>
```

## Comportamento esperado

Ao navegar pelas células, a pessoa consegue relacionar `Agosto`, `R$ 120,00` e `Pago` aos respectivos cabeçalhos, sem precisar inferir a posição visual.

## Exemplo não conforme

```html
<div class="grid">
  <div>Agosto</div><div>R$ 120,00</div><div>Pago</div>
</div>
```

A relação entre valores e colunas existe apenas no layout visual.

## Por que falha

O leitor de tela pode apresentar apenas uma sequência de textos sem informar qual valor corresponde a mês, valor ou status. Em listas maiores, o contexto se perde rapidamente.

## Critérios de teste

- tabela possui contexto ou legenda quando necessário;
- cabeçalhos são associados corretamente;
- navegação por leitor de tela preserva linha e coluna;
- ordenação e filtros comunicam função e estado;
- layout responsivo mantém rótulo de cada dado;
- nenhuma relação depende apenas de aparência visual.