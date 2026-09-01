# Definição de pronto — Design

Antes do handoff, Design deve confirmar que:

- a jornada pode ser compreendida sem depender apenas de cor, posição, forma, animação ou gesto;
- ordem visual e ordem lógica não entram em conflito;
- foco, retorno de foco e mudança de contexto estão especificados nos fluxos relevantes;
- estados normal, foco, selecionado, desabilitado, erro, sucesso e carregamento estão previstos quando aplicáveis;
- componentes nativos ou padrões canônicos são usados antes de criar interação customizada;
- alvo de toque, contraste, zoom, aumento de texto e reflow foram considerados;
- conteúdo essencial não depende de imagem ou ícone sem equivalente;
- instruções e ações possuem contexto suficiente para acessibilidade cognitiva;
- gestos complexos têm alternativa simples;
- modais, bottom sheets, popovers, carrosséis e estruturas complexas possuem comportamento de foco definido;
- preferências como redução de movimento, tema e tamanho de texto não quebram a experiência;
- casos críticos ou novos padrões foram alinhados com acessibilidade antes do desenvolvimento.

## Evidência mínima

Protótipo ou especificação deve registrar comportamento, estados, conteúdo e foco suficientes para que engenharia e QA implementem e testem sem precisar inferir decisões essenciais.

## Referências

- [Mapa de relações](../componentes/mapa-de-relacoes.md)
- [Foco e contexto](../receitas/foco-e-contexto.md)
- [Gestos e drag and drop](../receitas/gestos-e-drag-and-drop.md)
- [Zoom, reflow e texto](../receitas/zoom-reflow-e-texto.md)
- [Instruções e linguagem cognitiva](../componentes/instrucoes-e-linguagem-cognitiva.md)
