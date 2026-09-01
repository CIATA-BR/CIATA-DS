# Treeview e árvore hierárquica

## Contrato

Treeview representa uma hierarquia interativa com níveis, expansão e recolhimento. O padrão de árvore deve ser usado apenas quando a interação realmente exigir navegação hierárquica; listas apenas indentadas não precisam de semântica de treeview.

## Regras

- expor nível hierárquico, estado expandido/recolhido e seleção quando aplicáveis;
- distinguir foco de seleção;
- preservar ordem lógica da hierarquia independentemente da indentação visual;
- permitir expandir e recolher por teclado e tecnologia assistiva;
- quando o padrão Web de árvore for adotado, respeitar navegação por setas de forma consistente;
- não usar `role="tree"` em listas estáticas apenas para obter anúncio diferente;
- itens carregados dinamicamente devem preservar posição e contexto;
- mudanças de expansão não devem mover foco sem necessidade.

## Exemplo conforme

`Projetos, árvore. CIATA, nível 1, expandido. Design System, nível 2, selecionado.`

A pessoa pode usar os controles esperados da plataforma para percorrer irmãos, entrar em níveis e expandir/recolher nós.

## Comportamento esperado

A hierarquia é compreensível sem depender de recuo visual. Foco, seleção e expansão são estados separados e previsíveis.

## Exemplo não conforme

Lista de `div`s indentadas com clique no texto, sem função, nível ou estado programático.

## Por que falha

A pessoa não sabe onde está na hierarquia, quais nós possuem filhos, o que está aberto ou qual item está selecionado.

## Critérios de teste

- níveis são percebidos corretamente;
- expandido/recolhido é anunciado;
- foco e seleção não são confundidos;
- teclado e tecnologia assistiva conseguem percorrer a estrutura;
- carregamento dinâmico não perde contexto;
- semântica de árvore só é usada quando o comportamento corresponde ao padrão.

Veja também [Foco e contexto](../receitas/foco-e-contexto.md) e [Nome, função, estado e valor](../receitas/nome-funcao-estado-valor.md).