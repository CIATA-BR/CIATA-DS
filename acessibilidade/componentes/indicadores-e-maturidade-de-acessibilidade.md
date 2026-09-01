# Indicadores e maturidade de acessibilidade

## Objetivo

Acompanhar evolução da acessibilidade com indicadores que reflitam qualidade real, risco e capacidade de prevenção, evitando métricas de vaidade.

## Princípios

- quantidade bruta de bugs, isoladamente, não mede maturidade;
- aumento de achados pode significar auditoria melhor, não produto pior;
- tendência, reincidência, tempo de resolução e cobertura de jornadas críticas são mais úteis do que um número único;
- indicadores devem orientar decisão, não incentivar redução artificial de severidade ou fechamento sem reteste;
- dados quantitativos devem ser complementados por evidência qualitativa e testes com tecnologia assistiva.

## Indicadores recomendados

### Fluxo de correção

- tempo médio de triagem por severidade;
- tempo até correção disponível para reteste;
- tempo até fechamento após reteste;
- percentual de retestes reprovados;
- idade do backlog por severidade.

### Qualidade e prevenção

- reincidência do mesmo padrão de barreira;
- percentual de componentes canônicos com critérios e testes de acessibilidade;
- cobertura de jornadas críticas por teste manual e automatizado quando aplicável;
- regressões detectadas antes e depois do release;
- exceções temporárias abertas, vencidas e encerradas.

### Experiência

- barreiras reportadas por pessoas usuárias;
- jornadas interrompidas por acessibilidade;
- temas recorrentes em feedback e suporte;
- diferenças relevantes entre plataformas e tecnologias assistivas.

## Leitura responsável

Uma redução abrupta no número de bugs pode representar melhoria, mas também pode significar menos testes. Da mesma forma, um aumento pode refletir maior cobertura. Métricas devem ser interpretadas junto com contexto, volume de mudanças e qualidade da validação.

## Exemplo conforme

O time observa queda na reincidência de bugs de foco após corrigir o componente canônico e adicionar testes de regressão. O indicador é associado à mudança de processo e à validação manual.

## Exemplo não conforme

A meta trimestral é simplesmente `reduzir em 50% o número de bugs de acessibilidade`, incentivando fechamento prematuro ou reclassificação de severidade.

## Por que falha

A métrica passa a competir com a qualidade e pode mascarar o impacto real para pessoas usuárias.
