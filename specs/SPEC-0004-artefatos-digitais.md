# SPEC-0004 — Artefatos digitais

## Status

Proposta inicial.

## Objetivo

Definir como ativos digitais oficiais são identificados, documentados, revisados, publicados, substituídos e arquivados.

## Identificador permanente

Todo artefato oficial recebe um código único no formato:

```text
CIATA-{CATEGORIA}-{NUMERO}
```

Exemplos:

```text
CIATA-LGO-0001
CIATA-BAN-0001
CIATA-TMP-0001
```

O código nunca é reutilizado, mesmo após arquivamento.

## Passaporte

Todo artefato deve possuir um arquivo `.asset.md` com, no mínimo:

- identificador;
- nome;
- categoria;
- versão;
- status;
- descrição;
- autoria e responsáveis;
- formatos disponíveis;
- requisitos de acessibilidade;
- dependências e relacionamentos;
- histórico de alterações;
- licença ou restrições de uso.

## Estados

```text
Rascunho
Em desenvolvimento
Em revisão
Aprovado
Publicado
Em manutenção
Obsoleto
Arquivado
```

## Registro mestre

O catálogo deve apontar para a fonte oficial, o passaporte e o substituto quando houver.

## Substituição

Um artefato obsoleto não é apagado quando possuir valor histórico, jurídico ou institucional. Ele deve ser claramente marcado para impedir uso acidental.