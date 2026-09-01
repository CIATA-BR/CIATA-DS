# Convenções de nomes e versões

## Objetivo

Manter os assets previsíveis, localizáveis e rastreáveis entre Design, código, documentação e auditoria.

## Estrutura recomendada

`<categoria>-<contexto>-<estado>-<variante>`

Exemplos:

- `empty-library-no-results`
- `feedback-success-upload-complete`
- `mascot-ciata-welcome-default`
- `mascot-ciata-error-guidance`

## Regras

- usar nomes sem ambiguidade e sem depender de número sequencial isolado;
- evitar nomes ligados a ferramenta de geração, pessoa ou arquivo temporário;
- registrar mudança semântica como nova versão;
- não reutilizar o mesmo identificador para significado diferente;
- manter variantes de tema e movimento associadas ao mesmo identificador-base;
- marcar assets depreciados sem removê-los antes da migração dos consumidores.

## Versionamento

- correção visual sem mudança de significado: revisão menor;
- mudança de composição que preserva significado: revisão compatível, com reteste visual;
- mudança de significado, função ou tratamento acessível: nova versão semântica e reteste obrigatório;
- remoção: só após inventário de consumidores e plano de migração.
