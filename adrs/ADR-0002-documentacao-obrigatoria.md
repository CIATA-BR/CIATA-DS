# ADR-0002 — Documentação obrigatória para ativos

## Status

Aceito.

## Contexto

Um arquivo isolado não informa com segurança sua finalidade, autoria, validade, restrições, acessibilidade, dependências ou histórico. Esse conhecimento tende a se perder quando permanece em conversas ou com uma única pessoa.

## Decisão

Todo artefato oficial deve possuir documentação associada por meio de passaporte `.asset.md` e entrada no registro mestre.

## Consequências

### Positivas

- preserva conhecimento institucional;
- permite reutilização sem depender do autor;
- facilita auditoria, manutenção e substituição;
- oferece dados legíveis por pessoas e máquinas.

### Custos

- aumenta o trabalho inicial de publicação;
- exige atualização conjunta entre ativo e documentação;
- demanda validações automatizadas futuras.

## Alternativas rejeitadas

- documentar apenas ativos considerados importantes;
- manter um catálogo sem documentação individual;
- registrar informações somente em plataformas externas.