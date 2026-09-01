# Matriz mestra

A tabela abaixo oferece uma visão transversal dos principais padrões do CIATA Design System.

| Área/padrão | WCAG 2.2 relacionado | Referenciais complementares | Teste mínimo | Evidência esperada | Severidade típica quando falha |
| --- | --- | --- | --- | --- | --- |
| Nome, função, estado e valor | 1.3.1, 4.1.2 | EN 301 549, Section 508 | leitor de tela + inspeção semântica | anúncio observado + código/árvore acessível | Alto quando impede operação; Médio quando gera ambiguidade relevante |
| Teclado e mecanismo equivalente | 2.1.1, 2.1.2 | EN 301 549, Section 508 | teclado/controle equivalente | passos reproduzíveis + resultado | Alto quando bloqueia jornada |
| Ordem e visibilidade de foco | 2.4.3, 2.4.7, 2.4.11, 2.4.12, 2.4.13 | EN 301 549 | teclado + leitor de tela | sequência de foco observada | Alto quando há perda de contexto/bloqueio; Médio em desordem sem bloqueio |
| Formulários, rótulos e erros | 1.3.1, 3.3.1, 3.3.2, 3.3.3, 3.3.7, 3.3.8 | EN 301 549, Section 508 | teclado + leitor de tela + fluxo de erro | rótulo, erro, associação e recuperação | Alto se impede envio/autenticação; Médio quando dificulta correção |
| Contraste e não dependência de cor | 1.4.1, 1.4.3, 1.4.11 | EN 301 549 | medição + inspeção visual | razão calculada + captura/contexto | Médio; Alto quando informação essencial fica indisponível |
| Zoom, reflow e tamanho de texto | 1.4.4, 1.4.10, 1.4.12 | EN 301 549 | zoom/text scaling | configuração + resultado observado | Alto quando oculta ação essencial; Médio nos demais casos relevantes |
| Conteúdo dinâmico e mensagens | 4.1.3 | EN 301 549 | leitor de tela em mudança de estado | anúncio observado + contexto | Alto quando estado essencial não é comunicado; Médio nos demais casos |
| Modal, popover e mudança de contexto | 2.4.3, 3.2.1, 3.2.2 | EN 301 549 | teclado + leitor de tela | entrada, contenção e retorno de foco | Alto quando há perda de contexto ou operação indevida |
| Gestos complexos e drag and drop | 2.5.1, 2.5.7 | EN 301 549 | toque/teclado/AT | alternativa equivalente demonstrada | Alto quando gesto é único caminho |
| Alvo de toque e interação | 2.5.5, 2.5.8 | EN 301 549 | medição + operação | dimensão/spacing + teste funcional | Médio; Alto quando inviabiliza ação necessária |
| Áudio, vídeo, legenda e audiodescrição | 1.2.x | EN 301 549, Section 508 | reprodução com alternativas | mídia + alternativa equivalente | Alto quando conteúdo essencial não tem alternativa |
| Imagens, ícones e mascotes | 1.1.1, 1.4.1 | EN 301 549, Section 508 | leitor de tela + inspeção | texto alternativo/classificação funcional | Alto quando informação/ação essencial é só visual; Médio nos demais casos |
| Tabelas e data grids | 1.3.1, 2.1.1, 4.1.2 | EN 301 549 | leitor de tela + teclado | cabeçalhos, contexto, navegação | Alto quando dados/ações se tornam inacessíveis; Médio quando contexto é degradado |
| Autenticação acessível | 3.3.8 | EN 301 549 | jornada real com AT | fluxo completo reproduzível | Alto quando impede acesso à conta |
| Tempo limite e sessão | 2.2.1, 2.2.6 | EN 301 549 | fluxo temporizado | aviso, extensão e recuperação | Alto quando causa perda inevitável de tarefa/dados |
| Redução de movimento | 2.2.2, 2.3.3 | EN 301 549 | preferência do sistema | comportamento com preferência ativa | Médio; Alto se efeito impede uso seguro |
| Idioma e pronúncia | 3.1.1, 3.1.2 | EN 301 549 | leitor de tela | idioma programático + pronúncia observada | Médio; Alto se conteúdo essencial fica ininteligível |

## Regras de interpretação

- a coluna de severidade é indicativa, nunca automática;
- o impacto funcional observado prevalece sobre a categoria do critério;
- uma mesma barreira pode envolver vários critérios e referenciais;
- ausência de violação automática não equivale a conformidade;
- um achado só é encerrado após correção em build identificável e reteste.

Consulte também [Severidade de bugs](../severidade-de-bugs.md), [Evidências de auditoria](../evidencias-de-auditoria.md), [Processo de auditoria](../processo-de-auditoria.md), [VPAT/ACR](../vpat/README.md) e [Referenciais](../referenciais/README.md).