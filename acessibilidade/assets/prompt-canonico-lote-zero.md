# Prompt canônico do lote zero

Este documento define a estrutura mínima do prompt usado para gerar os primeiros assets do mascote.

## Fonte obrigatória

Antes de qualquer geração, considerar como fonte de verdade:

- `biblia-visual-primeiro-mascote.md`;
- `ficha-mestra-do-mascote.md`;
- `criterios-de-aprovacao-do-mascote.md`;
- `primeira-geracao-e-referencias-canonicas.md`;
- `catalogo-de-estados-do-mascote.md`;
- `matriz-de-assets.md`.

## Estrutura do prompt

O prompt deve declarar explicitamente:

1. identidade visual canônica do mascote;
2. estado representado;
3. pose principal;
4. expressão;
5. composição e enquadramento;
6. fundo e tema;
7. elementos que devem permanecer invariáveis;
8. elementos que podem variar;
9. proibições visuais;
10. necessidade de fundo transparente quando aplicável;
11. ausência de texto embutido, salvo quando estritamente previsto;
12. requisito de leitura clara da silhueta em tamanho reduzido.

## Bloco fixo de consistência

Toda geração do lote zero deve instruir que o personagem mantenha a mesma silhueta, proporções, linguagem de formas, acessórios permanentes, paleta principal e identidade facial da referência canônica. O estado pode alterar expressão, gesto e postura, mas não transformar o personagem em uma identidade diferente.

## Bloco fixo de acessibilidade

A imagem deve funcionar como reforço visual e nunca como única fonte de significado. Não incluir instruções essenciais, mensagens críticas ou texto funcional dentro da imagem. Não representar deficiência por estereótipos, caricaturas ou símbolos desnecessários. Evitar detalhes finos indispensáveis para compreensão.

## Critério de repetibilidade

O prompt deve ser suficientemente específico para que gerações sucessivas do mesmo estado permaneçam reconhecíveis como o mesmo personagem, mesmo quando houver pequenas variações de composição.