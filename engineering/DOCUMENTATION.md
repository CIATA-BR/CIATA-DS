# Padrões de documentação

A documentação faz parte do produto. Ela deve permitir que uma pessoa compreenda, use, teste, mantenha e transfira o conhecimento sem depender exclusivamente de conversas privadas ou memória individual.

## 1. Público

Antes de escrever, identificar para quem o conteúdo existe:

- pessoa usuária;
- colaborador técnico;
- QA;
- equipe de suporte;
- operação;
- liderança institucional;
- parceiro externo;
- agente de IA.

Um único documento pode servir a mais de um público, desde que a navegação e o nível de detalhe permaneçam claros.

## 2. Fonte canônica

Cada informação importante deve possuir uma fonte oficial.

Quando um conteúdo precisar aparecer em outro local:

- preferir link ou referência;
- resumir sem criar regra paralela;
- informar claramente qual versão é normativa;
- evitar copiar trechos que possam divergir com o tempo.

## 3. Estrutura

Documentos devem usar:

- um título principal claro;
- hierarquia de títulos sem saltos arbitrários;
- parágrafos curtos;
- listas reais quando necessárias;
- tabelas apenas quando melhorarem a compreensão;
- exemplos próximos da regra explicada;
- links descritivos;
- linguagem direta;
- termos consistentes.

Evitar navegação baseada apenas em posição visual, ícones, cor ou imagens.

## 4. Acessibilidade

Todo documento deve considerar:

- ordem de leitura;
- idioma correto;
- títulos semânticos;
- texto alternativo significativo;
- descrição completa de diagramas;
- tabelas simples e com cabeçalhos;
- links compreensíveis fora de contexto;
- contraste e ampliação;
- compatibilidade com leitores de tela e Braille;
- versão textual equivalente para conteúdo visual complexo.

Quando PDF for necessário, manter também uma fonte editável e acessível sempre que possível.

## 5. Diagramas

Diagramas complementam, mas não substituem texto.

Cada diagrama relevante deve possuir:

- título;
- finalidade;
- descrição textual;
- legenda quando houver símbolos;
- relações principais explicadas;
- versão atual identificável.

Não usar somente cor para diferenciar estados, fluxos ou categorias.

## 6. Exemplos de código

Exemplos devem:

- ser mínimos, mas utilizáveis;
- indicar linguagem;
- evitar segredos e dados reais;
- mostrar tratamento de erro quando relevante;
- seguir os padrões atuais do projeto;
- informar dependências e contexto;
- evitar abreviações obscuras;
- incluir acessibilidade quando houver interface.

Código demonstrativo desatualizado é uma forma de defeito documental.

## 7. Decisões

Usar:

- ADR para registrar decisão arquitetural tomada;
- RFC para proposta aberta a discussão;
- SPEC para regra normativa aprovada;
- issue para necessidade, defeito ou tarefa;
- pull request para mudança revisável;
- changelog para alteração percebida por pessoas usuárias ou integradores.

Não transformar o README em depósito de todas as decisões.

## 8. Estado e versão

Documentos sujeitos a mudança devem indicar, quando aplicável:

- status;
- responsável;
- data de revisão;
- versão;
- escopo;
- documentos substituídos;
- relação com decisões anteriores.

Conteúdo obsoleto deve ser removido, arquivado ou marcado claramente. Não deixar instruções antigas competirem silenciosamente com as atuais.

## 9. Documentação para agentes de IA

Conteúdo destinado também a agentes deve:

- declarar fontes canônicas;
- explicitar limites e proibições;
- separar regra de exemplo;
- registrar exceções;
- evitar referências vagas como “o arquivo acima”;
- usar caminhos, nomes e conceitos consistentes;
- informar quando uma decisão exige validação humana;
- não incluir credenciais ou dados sensíveis.

A clareza para IA não pode reduzir a clareza para pessoas.

## 10. Revisão

A revisão documental deve verificar:

- correção técnica;
- coerência com o produto real;
- acessibilidade;
- linguagem;
- links;
- exemplos;
- duplicação;
- privacidade;
- atualização de índices e navegação.

Mudanças de comportamento sem atualização da documentação correspondente não estão concluídas.

## 11. Critério de conclusão

Um documento está pronto quando:

- responde ao objetivo declarado;
- pode ser navegado com tecnologias assistivas;
- não depende de conhecimento oculto essencial;
- aponta para fontes oficiais;
- foi revisado pelas áreas afetadas;
- possui exemplos ou referências suficientes;
- não expõe informação sensível;
- pode ser mantido pela equipe depois de quem o escreveu.