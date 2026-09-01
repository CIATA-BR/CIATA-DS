# Uso de imagens

As imagens do CIATA devem comunicar autonomia, participação, diversidade e uso contemporâneo de tecnologia assistiva. A representação das pessoas deve ser digna, natural e contextualizada.

## Princípios

- mostrar pessoas estudando, trabalhando, ensinando, pesquisando, criando e participando da sociedade;
- representar diversidade de gênero, raça, idade, deficiência e contexto social;
- evitar enquadramentos que reduzam a pessoa à deficiência ou ao equipamento;
- evitar narrativas de pena, heroísmo obrigatório ou superação como única leitura possível;
- preferir tecnologias atuais e ambientes coerentes com o contexto;
- não simular marcas, interfaces ou equipamentos de forma enganosa;
- informar quando uma imagem tiver sido gerada por inteligência artificial.

## Acessibilidade

### Imagem informativa

Deve possuir texto alternativo curto e funcional, descrevendo a informação relevante para o contexto da página.

### Imagem decorativa

Deve usar texto alternativo vazio (`alt=""`) e não deve receber função, nome acessível ou foco.

### Imagem complexa

Montagens, diagramas e imagens com várias cenas podem exigir uma descrição breve no texto alternativo e uma descrição longa no conteúdo adjacente.

Não repetir no texto alternativo informações que já estejam claramente disponíveis no texto próximo.

## Desempenho

- gerar versões responsivas quando a imagem for usada em páginas web;
- preferir AVIF ou WebP para publicação, mantendo o arquivo-fonte quando necessário;
- informar `width` e `height` no HTML para evitar deslocamento de layout;
- aplicar carregamento tardio apenas a imagens fora da primeira dobra;
- não usar uma imagem de montagem extensa como fundo de texto sem validar contraste e legibilidade.

## Registro obrigatório

Cada ativo deve possuir um arquivo Markdown com o mesmo nome-base contendo:

- título;
- descrição visual;
- origem;
- autoria ou método de geração;
- data de criação ou incorporação;
- licença e restrições;
- texto alternativo sugerido;
- descrição longa quando necessária;
- usos recomendados;
- usos não recomendados;
- formatos derivados disponíveis.

## Convenção de nomes

Os caminhos e nomes de arquivos usam português do Brasil, letras minúsculas, sem acentos, sem espaços e com hífen entre palavras.

Exemplo:

```text
imagens/pessoas/tecnologia-assistiva-diversidade-001.png
imagens/pessoas/tecnologia-assistiva-diversidade-001.md
```
