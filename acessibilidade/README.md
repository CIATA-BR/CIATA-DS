# Acessibilidade no CIATA Design System

A acessibilidade é requisito de origem, não etapa posterior de correção. Todo ativo, componente, modelo e implementação derivada deste repositório deve ser planejado para uso por pessoas com diferentes deficiências, tecnologias assistivas e formas de interação.

## Princípios obrigatórios

- Não transmitir informação somente por cor, posição, formato, animação ou som.
- Manter contraste suficiente entre texto, ícones, controles e seus fundos.
- Fornecer nomes acessíveis claros, objetivos e localizáveis.
- Preservar ordem de leitura e navegação coerentes.
- Garantir uso completo por teclado e tecnologias de acionamento alternativo.
- Manter foco visível e previsível, sem deslocamentos inesperados.
- Preservar dados, etapa e foco lógico após rotação, redimensionamento ou recriação da interface.
- Descrever imagens informativas e marcar imagens decorativas adequadamente.
- Evitar texto incorporado em imagens quando houver alternativa semântica.
- Não usar símbolos isolados quando o significado não for universal.
- Respeitar preferências de redução de movimento, ampliação, contraste e tamanho do texto.

## Guias e referências internas

- [Base canônica WCAG 2.2](wcag-2.2/README.md)
- [VPAT® e Accessibility Conformance Report (ACR)](vpat/README.md)
- [Referenciais regulatórios e de conformidade](referenciais/README.md)
- [Processo canônico de auditoria de acessibilidade](processo-de-auditoria.md)
- [Receitas de acessibilidade multiplataforma](receitas/README.md)
- [Componentes canônicos de acessibilidade](componentes/README.md)
- [Classificação de severidade de bugs de acessibilidade](severidade-de-bugs.md)
- [Padrão de evidências de auditoria e reteste](evidencias-de-auditoria.md)
- [Política geral de acessibilidade](../ACCESSIBILITY.md)
- [Guia de validação multiplataforma](validacao-multiplataforma.md)
- [SPEC-0005 — Acessibilidade](../specs/SPEC-0005-acessibilidade.md)
- [CHECK-0001 — Revisão manual de acessibilidade](../checklists/acessibilidade/CHECK-0001-revisao-manual-de-acessibilidade.md)
- [PB-0005 — Executar validação manual de acessibilidade](../playbooks/PB-0005-validar-acessibilidade.md)
- [Acessibilidade da marca](marca.md)

## Alvo de conformidade

O alvo padrão para produtos digitais é WCAG 2.2 nos níveis A e AA, conforme a [base canônica do CIATA](wcag-2.2/README.md). O texto normativo do W3C prevalece sobre resumos, exemplos e orientações internas.

Quando houver obrigação legal, regulatória ou contratual adicional, ela deve ser avaliada separadamente conforme os [referenciais regulatórios e de conformidade](referenciais/README.md). Atender à WCAG 2.2 não autoriza declarar automaticamente conformidade com EN 301 549, Revised Section 508 ou outro padrão que contenha requisitos próprios.

O critério 4.1.1 permanece apenas como registro histórico para avaliações ou obrigações baseadas em WCAG 2.0 ou 2.1.

## Tecnologias e cenários de teste

Os ativos e componentes devem considerar, conforme a plataforma:

- TalkBack e outros leitores de tela Android, incluindo Jieshuo como cobertura adicional;
- VoiceOver no iOS e macOS;
- NVDA e JAWS no Windows;
- Narrador e linhas Braille HID quando o recurso e o ambiente forem aplicáveis, sem tratar versão experimental como linha de base estável;
- linhas Braille com modelo, conexão, tabela e leitor de tela registrados;
- navegação somente por teclado, incluindo teclado físico no mobile;
- Switch Access e controles por varredura;
- ampliação de tela e zoom do navegador;
- modos de alto contraste e cores forçadas;
- orientação retrato e paisagem;
- tela dividida, redimensionamento e retomada após alternância de aplicativo;
- texto ampliado e espaçamento personalizado.

## Revisão de ativos visuais

Antes da publicação, verificar:

1. propósito e contexto do ativo;
2. contraste e legibilidade;
3. comportamento em ampliação;
4. alternativa textual;
5. ausência de informação exclusiva na imagem;
6. ordem lógica quando inserido em documentos ou interfaces;
7. nomes de arquivo descritivos;
8. formatos editável e final disponíveis quando aplicável.

## Registros de problemas

Problemas de acessibilidade devem ser registrados pelo modelo específico disponível em `.github/ISSUE_TEMPLATE/problema-de-acessibilidade.md`, seguindo o [padrão de evidências de auditoria e reteste](evidencias-de-auditoria.md) e classificando o impacto conforme o [padrão de severidade](severidade-de-bugs.md).
