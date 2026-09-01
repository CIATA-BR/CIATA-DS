# Dashboards e KPIs

## Objetivo
Garantir que painéis com múltiplos indicadores, cartões, filtros e tendências sejam compreensíveis sem depender da composição visual do dashboard.

## Regras
- definir uma hierarquia lógica de títulos e regiões;
- cada KPI deve possuir nome, valor, unidade, período e variação quando aplicável;
- não comunicar aumento, queda ou criticidade apenas por cor, seta ou posição;
- filtros globais devem deixar claro quais indicadores serão afetados;
- atualização de dados deve preservar foco e anunciar mudanças relevantes sem excesso de fala;
- cartões clicáveis devem evitar foco duplicado e ações ambíguas;
- oferecer acesso aos dados detalhados que fundamentam o indicador quando necessário.

## Exemplo conforme
O KPI “Taxa de conclusão — 82% — aumento de 6 pontos no mês” é exposto como texto estruturado. Um link separado abre os dados detalhados, e filtros informam o período aplicado ao painel.

## Comportamento esperado
A pessoa compreende o estado do indicador, sua variação e o escopo dos filtros sem precisar inferir pela cor ou posição do cartão.

## Exemplo não conforme
Um cartão exibe apenas “82%” em verde com uma seta para cima, sem período, rótulo acessível ou significado textual da variação.

## Por que falha
O valor perde contexto e o significado depende de convenções visuais.

## Critérios mínimos de teste
- navegar por títulos, regiões e KPIs com leitor de tela;
- validar nome, valor, unidade, período e tendência;
- testar filtros e atualização sem perda de foco;
- confirmar que cor, seta e posição não são a única fonte de significado.
