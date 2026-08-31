# Data grid e tabelas interativas

## Objetivo
Garantir que grandes conjuntos de dados continuem navegáveis, compreensíveis e operáveis quando incluem ordenação, edição, seleção ou paginação virtual.

## Regras
- diferenciar tabela estática de grid realmente interativo;
- cabeçalhos de linha e coluna devem manter associação programática;
- ordenação deve expor estado atual e permitir acionamento por teclado;
- edição de célula deve anunciar modo de edição, validação e resultado;
- seleção de linha ou célula deve ser semanticamente perceptível;
- virtualização não pode destruir contexto, posição lógica ou foco;
- atalhos customizados devem ser documentados e não conflitar com tecnologia assistiva;
- sempre que possível, oferecer alternativa mais simples para tarefas que não exigem navegação matricial avançada.

## Exemplo conforme
Uma grade de usuários permite ordenar por nome, selecionar linhas e editar status. O leitor de tela anuncia cabeçalho, posição, valor, seleção e estado de ordenação.

## Comportamento esperado
A pessoa entende em que linha e coluna está, quais ações existem e o efeito de cada edição ou seleção.

## Exemplo não conforme
Uma grade visual feita com `div` usa setas do teclado, mas não expõe cabeçalhos, posição, seleção nem modo de edição.

## Por que falha
A interação existe visualmente, porém a estrutura e os estados não chegam à tecnologia assistiva.

## Critérios mínimos de teste
- navegar por linhas e colunas com leitor de tela;
- testar ordenação, seleção e edição;
- verificar foco após atualização ou virtualização;
- validar paginação ou carregamento incremental;
- confirmar que atalhos não bloqueiam comandos do leitor de tela.

Ver também [Tabelas](tabelas.md).
