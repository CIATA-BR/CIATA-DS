# Definição de pronto — Web

Antes de considerar a implementação pronta, Engenharia Web deve confirmar que:

- elementos nativos são preferidos quando atendem ao comportamento necessário;
- nome, função, estado e valor são expostos corretamente;
- navegação por teclado cobre todas as ações sem armadilhas de foco;
- ordem de foco segue a ordem lógica da tarefa;
- foco visível permanece perceptível;
- modais, menus, comboboxes, tabs e demais estruturas complexas seguem o contrato correspondente;
- conteúdo dinâmico relevante é anunciado sem excesso e sem roubo de foco;
- erros são associados ao campo ou contexto afetado e permanecem consultáveis;
- zoom, reflow e aumento de texto não escondem conteúdo ou ação essencial;
- contraste e estados não dependem apenas de cor;
- imagens decorativas ficam fora da árvore de acessibilidade e imagens informativas possuem equivalente;
- gestos de ponteiro possuem alternativa quando necessário;
- CSS, virtualização, renderização condicional ou atualização assíncrona não quebram semântica nem ordem de foco;
- automação de acessibilidade aplicável passa, sem substituir teste manual.

## Evidência mínima

Registrar build/URL testada, navegador, versão, leitor de tela quando aplicável e resultado dos testes manuais relevantes à mudança.

## Referências

- [Componentes canônicos](../componentes/README.md)
- [Testes e automação](../componentes/testes-e-automacao-de-acessibilidade.md)
- [Foco e contexto](../receitas/foco-e-contexto.md)
- [Matriz mestra](../rastreabilidade/matriz-mestra.md)
