# Paginação

## Contrato

Paginação permite navegar entre conjuntos ou páginas de resultados mantendo contexto, posição lógica e identificação clara da página atual.

## Regras

- o conjunto de paginação deve possuir nome acessível, como `Paginação de resultados`;
- página atual deve ser identificada semanticamente, não apenas por cor ou peso visual;
- controles `Anterior` e `Próxima` devem ter nomes claros e estado indisponível quando não aplicáveis;
- números de página devem ter propósito compreensível fora do contexto visual quando necessário;
- mudança de página deve atualizar conteúdo sem perder contexto de forma inesperada;
- após atualização dinâmica, foco e anúncio devem seguir estratégia definida e consistente;
- preservar filtros, ordenação e demais estados da listagem;
- evitar paginação infinita sem alternativa quando ela prejudicar navegação, retorno e orientação.

## Web

Usar região de navegação nomeada e links ou botões conforme o comportamento real. A página atual deve ser exposta semanticamente. Em atualização sem recarga completa, anunciar o novo conjunto de resultados de forma proporcional sem mover foco arbitrariamente.

## Android

Controles de página devem possuir nome, função, estado e alvo adequados. Ao carregar novos itens, preservar a posição lógica do usuário e evitar retorno inesperado ao topo, salvo quando esse for o comportamento previsto e comunicado.

## iOS

VoiceOver deve identificar os controles de navegação e o estado atual. Mudanças de página ou carregamentos adicionais não devem deslocar o foco para um elemento aleatório.

## Exemplo conforme

```html
<nav aria-label="Paginação de resultados">
  <a href="?page=1">Anterior</a>
  <a href="?page=1">Página 1</a>
  <a href="?page=2" aria-current="page">Página 2</a>
  <a href="?page=3">Página 3</a>
  <a href="?page=3">Próxima</a>
</nav>
```

## Comportamento esperado

A pessoa identifica a região de paginação, sabe que está na página 2 e consegue navegar para páginas adjacentes sem depender de aparência visual.

## Exemplo não conforme

```html
<div class="pages">
  <span>1</span>
  <span class="active">2</span>
  <span>3</span>
</div>
```

Os números dependem de clique e a página atual é indicada apenas por estilo visual.

## Por que falha

O leitor de tela pode anunciar apenas texto estático, sem função de navegação ou estado atual. Usuários de teclado podem não conseguir mudar de página.

## Critérios de teste

- região possui nome acessível;
- página atual é anunciada semanticamente;
- Anterior/Próxima comunicam indisponibilidade quando aplicável;
- filtros e estado da listagem são preservados;
- foco permanece previsível após mudança;
- atualização dinâmica é anunciada sem excesso.