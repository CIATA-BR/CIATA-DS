# Assets animados, estados e multiplataforma

## Contrato

Assets que mudam por estado, animação, tema, densidade ou plataforma devem preservar significado e acessibilidade em todas as variações. A versão visual não pode divergir do estado programático exposto pela interface.

## Regras

- documentar estados necessários: padrão, hover/foco quando aplicável, selecionado, desabilitado, erro, sucesso e carregamento;
- não usar animação como único feedback de mudança;
- respeitar preferências de redução de movimento e oferecer versão estática quando necessário;
- manter nome e significado consistentes entre Web, Android e iOS mesmo que o desenho seja adaptado às convenções da plataforma;
- evitar exportar texto fixo dentro do asset quando o conteúdo precisar de tradução;
- definir variantes para diferentes densidades e tamanhos sem perder detalhes essenciais;
- garantir que assets ocultos ou substituídos em responsividade não removam informação necessária;
- manter correspondência clara entre tokens/nomes de asset e sua finalidade funcional;
- validar composição em tema claro, escuro e fundos previstos quando houver variantes.

## Exemplo conforme

Um ícone de sincronização gira durante processamento, mas o controle também expõe estado de carregamento e uma preferência de movimento reduzido usa uma versão estática sem perder o feedback textual.

## Exemplo não conforme

O único sinal de envio concluído é uma animação rápida do mascote e uma mudança de cor no ícone.

## Por que falha

Pessoas que não percebem a animação ou a cor podem não saber se a ação terminou.

## Critérios de teste

- estado visual corresponde ao estado programático;
- redução de movimento mantém feedback equivalente;
- versões de plataforma preservam a mesma intenção;
- tradução não depende de texto embutido no asset;
- variações de tamanho não removem detalhes funcionais;
- mudanças responsivas não escondem informação essencial.
