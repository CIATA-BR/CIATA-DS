# Revisão de backlog e débito de acessibilidade

## Objetivo

Evitar que achados conhecidos se tornem permanentes por falta de revisão, dono ou contexto atualizado.

## Princípios

- todo débito possui origem, impacto, responsável e próximo passo;
- backlog de acessibilidade deve ser revisado em cadência definida;
- itens antigos precisam ser reavaliados quando produto, plataforma ou tecnologia assistiva mudam;
- recorrência do mesmo problema deve gerar ação sistêmica no Design System, documentação, lint, teste ou processo;
- débito não pode ser usado como destino indefinido para barreira alta.

## Revisão recorrente

A revisão deve observar pelo menos:

1. severidade e jornada afetada;
2. idade do achado;
3. frequência e alcance;
4. existência de workaround real e acessível;
5. dependências técnicas;
6. status da correção e do reteste;
7. repetição do mesmo padrão em outros produtos;
8. necessidade de prevenir recorrência no Design System.

## Estados recomendados

- novo;
- triado;
- planejado;
- em correção;
- disponível para reteste;
- reteste aprovado;
- reteste reprovado;
- exceção temporária;
- encerrado com evidência.

Evitar estados genéricos como `feito` quando ainda não houve reteste.

## Exemplo conforme

Na revisão mensal, o time percebe cinco bugs médios causados pelo mesmo componente de seleção. Em vez de corrigir apenas tela por tela, cria correção no componente canônico, atualiza documentação, adiciona teste de regressão e planeja substituição nas ocorrências existentes.

## Exemplo não conforme

Achados são movidos para uma coluna `acessibilidade` sem dono, prazo ou revisão, onde permanecem indefinidamente.

## Por que falha

O backlog deixa de representar trabalho gerenciável e passa a esconder risco conhecido.
