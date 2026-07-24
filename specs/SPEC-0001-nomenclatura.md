# SPEC-0001 — Nomenclatura

## Status

Proposta inicial.

## Objetivo

Definir nomes claros, previsíveis, localizáveis e sustentáveis para arquivos, diretórios, artefatos e documentos do CIATA-DS.

## Regras gerais

- arquivos universais mantêm nomes consolidados, como `README.md`, `LICENSE`, `CHANGELOG.md` e `CONTRIBUTING.md`;
- conteúdos institucionais usam português do Brasil;
- diretórios e arquivos usam letras minúsculas, sem acentos, sem espaços e com hífen entre palavras;
- nomes devem descrever conteúdo, variante, finalidade, dimensão e versão quando aplicável;
- siglas isoladas devem ser evitadas fora dos identificadores permanentes;
- o nome não pode depender de contexto visual para ser compreendido.

## Artefatos

Formato canônico:

```text
ciata-{categoria}-{tipo}-{variante}-{finalidade}-{dimensao}-{versao}.{ext}
```

Campos não aplicáveis podem ser omitidos sem quebrar a ordem dos demais.

## Exemplos

```text
ciata-logo-horizontal-colorido-fundo-claro-v1.0.0.svg
ciata-banner-github-organizacao-1280x640-v1.0.0.png
ciata-timbrado-oficio-a4-editavel-v1.0.0.docx
```

## Acessibilidade

O caminho e o nome devem permitir que uma pessoa, inclusive usando leitor de tela ou linha Braille, reconheça o conteúdo sem abrir o arquivo.

## Exceções

Exceções técnicas devem ser documentadas no README da pasta ou em ADR específico.