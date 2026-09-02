# Política de duplicidade do acervo do Nexo

Esta política evita versões repetidas, quase idênticas ou semanticamente redundantes do mesmo asset.

## Tipos de duplicidade

### Duplicidade exata

Dois arquivos possuem os mesmos bytes ou o mesmo conteúdo após normalização técnica.

Ação:

- manter apenas o arquivo canônico;
- remover cópias redundantes;
- preservar referências históricas quando necessário por meio de registro de migração.

### Quase duplicidade visual

Dois assets são visualmente equivalentes, com diferenças pequenas de compressão, recorte, fundo ou detalhe sem mudança funcional relevante.

Ação:

- comparar finalidade e qualidade;
- escolher uma versão preferida;
- depreciar ou remover a redundante;
- registrar a decisão no catálogo.

### Duplicidade semântica

Dois assets são diferentes visualmente, mas cumprem a mesma função sem benefício claro de manter ambos.

Ação:

- avaliar se existe diferença real de estado, plataforma, tema, enquadramento ou contexto;
- se não houver, escolher um asset principal;
- manter múltiplas versões apenas quando houver justificativa documentada.

## Estratégia de detecção

A futura automação deve combinar:

1. hash criptográfico, como SHA-256, para duplicidade exata;
2. hash perceptual para similaridade visual;
3. comparação de dimensões, proporção e transparência;
4. metadados do catálogo para detectar redundância semântica;
5. revisão humana antes de excluir ou depreciar qualquer referência oficial.

## Limiares

Nenhum limiar perceptual deve excluir arquivos automaticamente.

A automação pode marcar pares como:

- provável duplicata;
- alta similaridade;
- revisão recomendada.

A decisão final é humana.

## Critérios para escolher a versão principal

Preferir, nesta ordem:

- identidade visual mais fiel à referência canônica;
- estado emocional e gesto mais claros;
- ausência de texto rasterizado desnecessário;
- fundo transparente quando favorecer reutilização;
- melhor enquadramento e legibilidade em tamanho reduzido;
- melhor qualidade técnica com tamanho de arquivo razoável;
- descrição e metadados completos.

## Exclusões

Não considerar duplicidade apenas porque dois assets usam o mesmo personagem.

Variações legítimas incluem:

- estado diferente;
- gesto diferente;
- enquadramento necessário para outro contexto;
- variante claro/escuro;
- variante estática/redução de movimento;
- versão para plataforma ou proporção diferente.
