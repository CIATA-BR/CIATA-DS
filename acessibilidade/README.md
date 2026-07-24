# Acessibilidade no CIATA Design System

A acessibilidade é requisito de origem, não etapa posterior de correção. Todo ativo, componente, modelo e implementação derivada deste repositório deve ser planejado para uso por pessoas com diferentes deficiências, tecnologias assistivas e formas de interação.

## Princípios obrigatórios

- Não transmitir informação somente por cor, posição, formato, animação ou som.
- Manter contraste suficiente entre texto, ícones, controles e seus fundos.
- Fornecer nomes acessíveis claros, objetivos e localizáveis.
- Preservar ordem de leitura e navegação coerentes.
- Garantir uso completo por teclado e tecnologias de acionamento alternativo.
- Manter foco visível e previsível, sem deslocamentos inesperados.
- Descrever imagens informativas e marcar imagens decorativas adequadamente.
- Evitar texto incorporado em imagens quando houver alternativa semântica.
- Não usar símbolos isolados quando o significado não for universal.
- Respeitar preferências de redução de movimento, ampliação, contraste e tamanho do texto.

## Tecnologias e cenários de teste

Os ativos e componentes devem considerar, conforme a plataforma:

- TalkBack e outros leitores de tela Android, incluindo Jieshuo;
- VoiceOver no iOS e macOS;
- NVDA e JAWS no Windows;
- linhas Braille;
- navegação somente por teclado;
- Switch Access e controles por varredura;
- ampliação de tela e zoom do navegador;
- modos de alto contraste e cores forçadas;
- orientação retrato e paisagem;
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

Problemas de acessibilidade devem ser registrados pelo modelo específico disponível em `.github/ISSUE_TEMPLATE/problema-de-acessibilidade.md`, informando plataforma, tecnologia assistiva, passos, resultado atual e resultado esperado.
