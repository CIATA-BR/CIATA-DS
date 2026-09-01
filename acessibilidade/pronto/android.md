# Definição de pronto — Android

Antes de considerar a implementação pronta, Engenharia Android deve confirmar que:

- componentes nativos ou equivalentes acessíveis do toolkit são preferidos;
- TalkBack recebe nome, função, estado e valor corretos;
- ordem de navegação e foco de acessibilidade acompanha a lógica da tarefa;
- controles permanecem operáveis sem gesto complexo exclusivo;
- ações por swipe, arraste ou movimento possuem alternativa quando necessário;
- foco não salta, some ou retorna ao topo após atualizações de tela;
- diálogos, bottom sheets e overlays transferem e devolvem foco de forma previsível;
- conteúdo dinâmico relevante é anunciado sem interromper continuamente a leitura;
- aumento de fonte, tamanho de exibição e orientação não cortam ações essenciais;
- estados não dependem apenas de cor, ícone ou animação;
- conteúdo decorativo não polui a árvore de acessibilidade;
- WebViews preservam ordem, foco e contexto entre camada nativa e conteúdo Web;
- feedback sonoro ou háptico nunca é a única forma de comunicar informação necessária;
- teste manual com TalkBack cobre a jornada alterada.

## Evidência mínima

Registrar versão/build do app, versão do Android, dispositivo/emulador, versão/configuração do TalkBack quando relevante e resultado da jornada testada.

## Referências

- [Componentes canônicos](../componentes/README.md)
- [Gestos complexos e movimento do dispositivo](../componentes/gestos-complexos-e-movimento-do-dispositivo.md)
- [Orientação e layout adaptável](../componentes/orientacao-e-layout-adaptavel.md)
- [Testes manuais e tecnologia assistiva](../componentes/testes-manuais-e-tecnologia-assistiva.md)
