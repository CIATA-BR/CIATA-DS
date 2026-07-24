# Catálogo de artefatos do CIATA

Este diretório funciona como índice humano e acessível dos recursos do CIATA Design System.

Cada categoria deve possuir um arquivo `README.md` com:

- descrição objetiva do conteúdo;
- caminho recomendado;
- lista dos artefatos disponíveis;
- finalidade de cada arquivo;
- variante visual;
- dimensões;
- formato;
- status de aprovação;
- observações de acessibilidade;
- origem do arquivo editável, quando houver.

## Estrutura sugerida

```text
catalogo/
├── marca.md
├── redes-sociais.md
├── documentos.md
├── apresentacoes.md
├── icones.md
└── imagens.md
```

## Modelo de registro

```markdown
### Logo horizontal colorido para fundo claro

- Caminho: `marca/logotipos/horizontal/ciata-logo-horizontal-colorido-fundo-claro.svg`
- Formato: SVG
- Variante: horizontal, colorida
- Fundo recomendado: claro
- Finalidade: sites, documentos e apresentações
- Status: oficial
- Fonte editável: arquivo vetorial mestre
- Acessibilidade: não usar o logotipo como substituto de título textual; fornecer nome acessível quando for conteúdo significativo
```

## Estados permitidos

```text
rascunho
em-revisao
aprovado
oficial
obsoleto
```

Arquivos marcados como `obsoleto` devem ser removidos das áreas de distribuição e preservados apenas quando houver justificativa histórica ou técnica.

## Regra de ouro

O catálogo não substitui nomes claros. Ele é uma segunda porta de entrada, não uma bengala para arquivos mal identificados.
