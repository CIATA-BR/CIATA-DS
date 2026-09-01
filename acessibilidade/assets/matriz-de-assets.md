# Matriz de assets visuais

## Objetivo

Registrar o contrato de cada asset antes da produção para evitar geração sem contexto, duplicação e inconsistência entre plataformas.

## Campos mínimos

| Campo | Uso |
| --- | --- |
| Identificador | Nome estável do asset |
| Finalidade | Decorativa, informativa, funcional ou complexa |
| Jornada/contexto | Onde o asset aparece |
| Estado | Padrão, vazio, sucesso, erro, aviso, carregamento etc. |
| Plataforma | Web, Android, iOS ou compartilhado |
| Formato | SVG, PNG, WebP, Lottie, vídeo ou outro |
| Proporção | 1:1, 4:3, 16:9 etc. |
| Tema | Claro, escuro, alto contraste quando aplicável |
| Movimento | Estático, animado, versão com redução de movimento |
| Texto embutido | Evitar; quando inevitável, registrar conteúdo e localização |
| Tratamento acessível | Decorativo, texto alternativo, rótulo, descrição longa ou equivalente estruturado |
| Dependências | Tokens, componentes, copy, ícones ou mascotes relacionados |
| Status | Planejado, em produção, revisado, aprovado, depreciado |
| Versão | Versão do asset e data da última revisão |

## Regras

- não gerar asset sem finalidade e contexto definidos;
- estados críticos nunca dependem apenas de mascote, cor ou expressão facial;
- variantes de tema preservam legibilidade e significado;
- animação essencial precisa de alternativa compatível com redução de movimento;
- texto essencial deve permanecer texto real sempre que possível;
- assets compartilhados entre plataformas preservam significado, mas podem adaptar composição e densidade;
- alteração semântica exige nova revisão de acessibilidade mesmo que o arquivo visual mude pouco.

## Exemplo

`empty-library-no-results`

- finalidade: informativa;
- contexto: estado vazio após busca sem resultados;
- plataformas: Web, Android e iOS;
- formato: SVG/PNG conforme plataforma;
- temas: claro e escuro;
- movimento: estático;
- tratamento acessível: imagem decorativa quando o mesmo estado estiver claramente expresso em texto próximo;
- dependência: mensagem `Nenhum resultado encontrado` e ação de limpar filtros.
