# ADR-0001 — Identificadores permanentes

## Status

Aceito.

## Contexto

Nomes de arquivos, pastas e formatos podem mudar ao longo do tempo. Referências baseadas apenas nesses nomes quebram histórico, documentação e relacionamentos.

## Decisão

Todo artefato oficial recebe um identificador permanente, único e nunca reutilizado.

Formato:

```text
CIATA-{CATEGORIA}-{NUMERO}
```

## Consequências

### Positivas

- preserva rastreabilidade entre versões;
- permite relacionar dependências e substituições;
- facilita automação e geração de catálogo;
- reduz ambiguidade em comunicação oral, escrita e assistiva.

### Custos

- exige manutenção do registro mestre;
- requer prevenção de duplicidades;
- adiciona uma etapa ao cadastro do artefato.

## Alternativas rejeitadas

- usar apenas o nome do arquivo;
- reutilizar códigos de itens arquivados;
- gerar identificadores diferentes para cada formato do mesmo artefato.