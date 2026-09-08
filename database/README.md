# Base de validação do CIATA-DS

Esta pasta contém a modelagem inicial para transformar as matrizes de validação dos componentes em registros estruturados, auditáveis e reutilizáveis.

## Fonte canônica

Os arquivos `components/*/validation-matrix.md` continuam sendo a fonte canônica dos critérios e cenários de validação. O formulário do Test Lab lê essas matrizes e gera os campos de validação dinamicamente.

## Fluxo inicial

1. o analista abre `/validation/?component=<slug>`;
2. o navegador carrega `/components/<slug>/validation-matrix.md`;
3. tabelas com colunas `ID`, `Cenário` e `Critério de aceite` viram critérios estruturados;
4. checklists Markdown viram cenários com identificadores `AUTO-*`;
5. o analista registra ambiente, recursos de recursos de tecnologia assistiva, resultado observado e status;
6. o formulário gera um payload JSON compatível com a futura API;
7. a API persistirá a execução nas tabelas deste schema.

## Schema

`ciata_ds_schema.sql` cria:

- `components`: catálogo canônico de componentes;
- `component_versions`: commit/versão efetivamente validada;
- `platforms`: Web, Laravel, Python, Android, iOS e Flutter;
- `assistive_resources`: catálogo de recursos de recursos de tecnologia assistiva;
- `validation_criteria`: critérios extraídos das matrizes;
- `analysts`: analistas responsáveis pelas execuções;
- `validation_runs`: uma execução completa de validação;
- `validation_results`: resultado por critério;
- `validation_evidence`: evidências associadas à execução ou critério;
- `component_platform_status`: estado calculado por componente/plataforma;
- `validation_audit_log`: trilha de auditoria.

## Instalação inicial

Em MariaDB 10.11 ou superior:

```bash
mysql -u root -p < database/ciata_ds_schema.sql
```

O script cria a base `ciata_ds`, as tabelas, chaves estrangeiras, índices e catálogos iniciais de plataformas e recursos.

## Próxima etapa

A próxima evolução prevista é uma API autenticada que receba o payload gerado pelo formulário, sincronize `validation_criteria` a partir das matrizes Markdown e recalcule automaticamente `component_platform_status`.
