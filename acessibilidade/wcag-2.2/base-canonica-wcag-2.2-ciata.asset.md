---
id: CIATA-DOC-0001
nome: Base canônica WCAG 2.2 CIATA
categoria: Documento
versao: 0.1.0
status: Em revisão
responsavel: Equipe CIATA
criado_em: 2026-08-29
ultima_revisao: 2026-08-29
formatos: [JSON, XLSX, Markdown]
licenca: Conforme LICENSE do repositório
substitui: null
substituido_por: null
dependencias: [WCAG 2.2, WCAG2ICT]
relacionados: [RFC-0001, SPEC-0005, CHECK-0001, PB-0005]
---

# Base canônica WCAG 2.2 CIATA

## Finalidade

Fornecer uma fonte única para documentação, implementação, auditoria e testes de acessibilidade nos produtos do CIATA, com tradução prática dos critérios A e AA da WCAG 2.2.

## Arquivos oficiais

| Formato | Caminho | Finalidade |
|---|---|---|
| JSON | `acessibilidade/wcag-2.2/criterios.json` | Fonte canônica e interoperável |
| XLSX | `acessibilidade/wcag-2.2/base-canonica-wcag-2.2-ciata.xlsx` | Consulta e execução manual acessível |
| Markdown | `acessibilidade/wcag-2.2/README.md` | Orientação de uso e manutenção |

## Regras de uso

- Não tratar o resumo CIATA como substituto do texto normativo.
- Não editar somente o XLSX.
- Preservar código, versão de origem, nível e estado de cada critério.
- Registrar plataforma, tecnologia assistiva, jornada e evidência em avaliações.
- Manter o 4.1.1 como histórico enquanto houver contratos ou relatórios baseados em WCAG 2.0 ou 2.1.

## Conteúdo textual

O conteúdo completo está disponível em JSON e XLSX. Não há informação dependente exclusivamente de imagens.

## Descrição acessível

Base tabular com 55 critérios ativos A e AA da WCAG 2.2, um registro histórico, regras práticas, tecnologias assistivas afetadas, interfaces prioritárias, testes manuais, falhas e fontes oficiais.

## Validações

| Área | Status | Responsável | Data | Evidência ou observação |
|---|---|---|---|---|
| Técnica | Concluída | Equipe CIATA | 2026-08-29 | JSON validado; códigos, níveis, estados e fontes verificados |
| Visual | Concluída | Equipe CIATA | 2026-08-29 | Todas as abas do XLSX inspecionadas |
| Acessibilidade | Em revisão | Equipe CIATA | 2026-08-29 | Estrutura sem mesclagens, cabeçalhos, filtros e abas descritivas |
| Funcional | Concluída | Equipe CIATA | 2026-08-29 | 55 ativos, 31 A, 24 AA, 6 novos e 1 histórico |
| Linguagem | Em revisão | Equipe CIATA | 2026-08-29 | Resumos técnicos revisados; revisão editorial contínua prevista |
| Comunicação | Não aplicável | — | 2026-08-29 | Artefato técnico interno e público |

## Histórico

### 0.1.0

- Migração da referência WCAG 2.1 para a WCAG 2.2.
- Separação entre requisito, teste, falha, orientação e fonte.
- Inclusão das interfaces CIATA e tecnologias assistivas prioritárias.

## Observações

A inclusão do arquivo na branch não concede automaticamente o estado `Publicado`. A promoção depende da revisão e decisão registradas na RFC-0001.
