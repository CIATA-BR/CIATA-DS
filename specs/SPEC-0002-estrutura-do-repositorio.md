# SPEC-0002 — Estrutura do repositório

## Status

Proposta inicial.

## Objetivo

Organizar o CIATA-DS para crescimento gradual, navegação acessível e futura separação em módulos sem fragmentação precoce.

## Estrutura canônica

```text
.github/
adrs/
assets/
catalogo/
checklists/
docs/
rfcs/
scripts/
site/
specs/
templates/
```

## Responsabilidades

- `.github/`: automações, modelos e governança do GitHub;
- `adrs/`: decisões arquiteturais aceitas;
- `assets/`: ativos oficiais e seus passaportes;
- `catalogo/`: índices e registro mestre;
- `checklists/`: verificações reproduzíveis;
- `docs/`: guias e documentação explicativa;
- `rfcs/`: propostas abertas à discussão;
- `scripts/`: validações e geração automatizada;
- `site/`: fonte do catálogo público;
- `specs/`: regras normativas;
- `templates/`: modelos reutilizáveis.

## Regras

- cada pasta relevante deve possuir README quando sua finalidade não for evidente;
- nenhum diretório deve existir apenas para antecipar uma possibilidade remota;
- ativos não devem ser duplicados entre pastas;
- histórico deve ser preservado sem confundir versões vigentes e obsoletas;
- reorganizações relevantes exigem RFC ou ADR.

## Princípio

O projeto cresce como ecossistema, mas entrega um módulo de cada vez.