# Gráficos e visualização de dados

## Objetivo
Garantir que tendências, comparações e valores apresentados visualmente também possam ser compreendidos e operados sem visão.

## Regras
- não depender apenas de cor, posição ou forma para comunicar séries ou estados;
- fornecer resumo textual da mensagem principal do gráfico;
- disponibilizar dados subjacentes em formato acessível quando a leitura detalhada for relevante;
- manter rótulos, unidades, período e fonte dos dados claros;
- controles de filtro, legenda e seleção devem possuir nome, função, estado e foco previsíveis;
- mudanças dinâmicas devem ser anunciadas sem mover foco automaticamente;
- zoom, alto contraste e aumento de texto não podem ocultar informação essencial.

## Exemplo conforme
Um gráfico de barras apresenta o resumo “Inscrições aumentaram 24% entre janeiro e março”, oferece uma tabela equivalente logo após o gráfico e permite filtrar a série por botões acessíveis.

## Comportamento esperado
A pessoa consegue entender a conclusão principal, consultar valores exatos e operar filtros por teclado e leitor de tela.

## Exemplo não conforme
Um gráfico usa somente barras verdes e vermelhas, sem rótulos textuais, tabela ou descrição.

## Por que falha
A informação depende de percepção visual e de cor, impedindo acesso ao dado e à comparação.

## Critérios mínimos de teste
- validar leitura do resumo e da tabela equivalente;
- confirmar operação de filtros por teclado e tecnologia assistiva;
- verificar que cor não é o único diferenciador;
- testar atualização dinâmica, zoom e aumento de texto.

Ver também [Mídia e conteúdo visual](../receitas/midia-e-conteudo-visual.md).
