# Definição de pronto — iOS

Antes de considerar a implementação pronta, Engenharia iOS deve confirmar que:

- componentes nativos ou equivalentes acessíveis são preferidos;
- VoiceOver recebe nome, função, estado e valor corretos;
- ordem de navegação acompanha a lógica da tarefa e não depende do layout visual;
- foco de acessibilidade entra e retorna corretamente em sheets, dialogs e overlays;
- ações não dependem de gesto complexo exclusivo quando alternativa simples é possível;
- custom actions possuem nomes claros e comportamento previsível;
- conteúdo dinâmico relevante é anunciado sem interromper excessivamente a leitura;
- Dynamic Type e ajustes de texto não cortam conteúdo ou ações essenciais;
- rotação e mudanças de layout preservam contexto e foco;
- estados não dependem apenas de cor, ícone, posição ou animação;
- imagens decorativas não geram ruído e imagens informativas têm equivalente adequado;
- feedback háptico ou sonoro complementa, mas não substitui, informação necessária;
- WebViews preservam foco e continuidade entre camada nativa e conteúdo Web;
- teste manual com VoiceOver cobre a jornada alterada.

## Evidência mínima

Registrar versão/build do app, versão do iOS, dispositivo/simulador, configuração do VoiceOver quando relevante e resultado da jornada testada.

## Referências

- [Componentes canônicos](../componentes/README.md)
- [Foco e contexto](../receitas/foco-e-contexto.md)
- [Tamanho de texto, zoom e densidade](../componentes/tamanho-de-texto-zoom-e-densidade.md)
- [Testes manuais e tecnologia assistiva](../componentes/testes-manuais-e-tecnologia-assistiva.md)
