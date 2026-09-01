# Tamanho de texto, zoom e densidade

## Contrato

A interface deve permanecer compreensível e operável quando a pessoa aumenta texto, zoom ou espaçamento e quando reduz a densidade de informação.

## Regras

- suportar aumento de texto sem truncar conteúdo essencial;
- evitar dimensões fixas que impeçam expansão;
- permitir reflow sempre que o contexto não exigir duas dimensões;
- não esconder controles apenas porque o texto cresceu;
- preservar ordem de leitura e foco após reflow;
- não exigir rolagem horizontal e vertical simultânea sem necessidade real;
- densidade compacta nunca pode reduzir alvo de toque ou legibilidade abaixo do aceitável.

## Web

Validar zoom, tamanho de fonte e espaçamento de texto conforme os critérios WCAG aplicáveis. Componentes devem crescer ou reorganizar sem perda de conteúdo.

## Android

Testar com escalas de fonte e display ampliadas. Evitar layouts que dependam de altura fixa ou texto em uma única linha.

## iOS

Suportar Dynamic Type quando aplicável e validar tamanhos de acessibilidade. Componentes devem adaptar altura, quebra de linha e ordem de conteúdo.

## Exemplo conforme

Um card cresce verticalmente quando o texto é ampliado; o botão continua visível, com alvo adequado e depois do conteúdo na ordem de foco.

## Exemplo não conforme

Um card de altura fixa corta metade do rótulo e sobrepõe o botão quando a fonte aumenta.

## Por que falha

A pessoa perde informação e pode não conseguir identificar ou ativar a ação necessária.

## Critérios de teste

- conteúdo não é truncado de forma crítica;
- foco segue ordem lógica após reflow;
- controles continuam alcançáveis;
- alvos mantêm tamanho adequado;
- zoom e fonte ampliada não provocam sobreposição;
- densidade alternativa preserva semântica e operação.
