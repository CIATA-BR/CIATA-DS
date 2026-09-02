# CMP-0001 — Button / Botão

## Status

Rascunho.

## Propósito

Executar uma ação iniciada pela pessoa usuária.

Use Button quando o resultado esperado for uma ação, por exemplo salvar, enviar, confirmar, abrir uma caixa de diálogo, iniciar um processo ou cancelar uma operação.

Não use Button para navegação para outro recurso ou URL quando um link nativo representar melhor a intenção.

## Princípio de implementação

A implementação deve preferir o controle de botão nativo da plataforma e preservar nome, papel, estado, foco e acionamento expostos às APIs de acessibilidade.

## Variantes funcionais iniciais

- `primary` — ação principal do contexto;
- `secondary` — ação alternativa;
- `danger` — ação destrutiva ou de alto impacto;
- `ghost` — ação de menor ênfase, quando necessária.

A variante visual nunca substitui texto, semântica ou confirmação necessária para ações destrutivas.

## Propriedades conceituais

- `label` — nome visível da ação;
- `disabled` — impede acionamento quando a ação não está disponível;
- `loading` — informa que a ação foi iniciada e ainda está em andamento;
- `variant` — prioridade/ênfase visual;
- `icon` — ícone opcional, antes ou depois do texto;
- `iconOnly` — permitido apenas quando houver nome acessível inequívoco e justificativa de uso;
- `onActivate` — ação executada no acionamento.

Os nomes concretos das propriedades podem variar por linguagem e framework.

## Estados

- padrão;
- hover, quando a plataforma possui apontador;
- foco;
- pressed/active;
- disabled;
- loading.

Estados não devem depender exclusivamente de cor.

## Nome acessível

O nome acessível deve comunicar a ação de forma clara e contextual.

Exemplos adequados:

- `Salvar alterações`;
- `Enviar mensagem`;
- `Continuar para pagamento`;
- `Excluir arquivo`.

Evitar nomes genéricos fora de contexto, como `OK`, `Clique aqui` ou múltiplos botões chamados apenas `Continuar` quando o destino não for evidente.

Não acrescentar manualmente palavras como "botão" ao nome acessível quando a plataforma já expõe o papel do controle.

## Semântica

O controle deve ser exposto como botão pela plataforma.

Quando o botão representa estado alternável, expansão ou outro padrão especializado, o estado correspondente deve ser exposto pela API nativa adequada. Não simular estado apenas por alteração visual.

## Teclado e acionamento

### Web e desktop

- deve participar da ordem de foco quando habilitado;
- `Enter` e/ou `Espaço` devem acionar conforme o comportamento nativo da plataforma;
- não exigir gesto de apontador para operação essencial;
- o foco não deve desaparecer após acionamento, salvo quando a própria ação mover legitimamente o contexto para outro elemento.

### Touch

O controle deve ser acionável por gesto simples de toque da plataforma e possuir área de interação compatível com os padrões do CIATA-DS.

## Área de interação

O padrão interno recomendado é 44 × 44 CSS px ou equivalente lógico da plataforma quando o contexto permitir, conforme a RFC-0002.

O alvo visual pode ser menor que a área acionável quando a plataforma permitir ampliar hit target sem causar sobreposição ou ambiguidade.

## Foco

O indicador de foco deve:

- ser visível;
- não depender apenas de mudança sutil de cor;
- possuir contraste suficiente contra as cores adjacentes;
- permanecer identificável em tema claro e escuro;
- não ser removido apenas por razões estéticas.

## Loading

Quando `loading=true`:

- acionamentos repetidos devem ser evitados quando puderem gerar duplicidade ou conflito;
- a pessoa deve receber indicação perceptível de que a ação está em andamento;
- o nome original da ação não deve ser perdido sem necessidade;
- leitores de tela devem receber feedback de estado por mecanismo adequado ao contexto, sem anúncios repetitivos;
- a mudança para loading não deve provocar perda arbitrária de foco.

`loading` e `disabled` não são semanticamente equivalentes. Uma implementação pode impedir novos acionamentos durante loading, mas deve preservar comunicação de que existe uma operação em andamento.

## Disabled

Use disabled somente quando a ação realmente não puder ser executada naquele estado.

Sempre que possível, prefira permitir a tentativa e explicar erros de validação em vez de manter ações permanentemente indisponíveis sem explicação.

Se o botão estiver disabled:

- o estado deve ser programaticamente identificável quando a plataforma suportar;
- não depender apenas de aparência acinzentada;
- a interface deve fornecer contexto suficiente para a pessoa entender como habilitar a ação quando isso não for óbvio.

A participação de controles disabled na ordem de foco deve seguir o comportamento nativo e a necessidade de compreensão do contexto da plataforma; não criar comportamento customizado inconsistente apenas para uniformizar plataformas.

## Ícones

Um ícone acompanhado de texto normalmente é decorativo para tecnologias assistivas quando o texto já comunica integralmente a ação.

Botões somente com ícone exigem nome acessível claro e devem ser usados com parcimônia, pois símbolos podem aumentar carga cognitiva e ser ambíguos.

## Conteúdo e linguagem

- usar verbos de ação claros;
- indicar destino quando isso reduzir ambiguidade;
- evitar instruções baseadas em posição, forma ou cor;
- manter textos curtos sem sacrificar significado;
- para ações críticas, deixar explícita a consequência.

## Ações destrutivas

A variante `danger` não elimina a necessidade de prevenção de erro.

Quando a ação produzir consequência difícil ou impossível de reverter, deve existir confirmação, possibilidade de desfazer ou outro mecanismo proporcional ao risco.

## Tokens

O componente deve consumir tokens semânticos e de fundação do CIATA-DS, incluindo quando disponíveis:

- cores de ação e texto;
- foco e foco-contraste;
- tipografia;
- espaçamento;
- raio;
- dimensão mínima de interação;
- tema claro/escuro.

Implementações não devem copiar valores fixos quando existir token canônico equivalente.

## Tema

O componente deve consumir os mesmos aliases semânticos em tema claro e escuro. O código do botão não deve precisar selecionar tokens `escuro-*` ou duplicar lógica por tema.

## Exemplos conformes

- botão nativo com texto `Salvar alterações`, foco visível e estado loading anunciado adequadamente;
- botão `Excluir conta` com tratamento de ação destrutiva e confirmação proporcional ao impacto;
- botão somente com ícone de fechar cujo nome acessível seja `Fechar diálogo`.

## Exemplos não conformes

- `div` clicável simulando botão sem semântica e teclado;
- botão cujo nome acessível seja `botão Salvar` quando o papel já é anunciado pela plataforma;
- indicador de foco removido;
- estado disabled indicado apenas pela cor;
- botão somente com ícone sem nome acessível;
- spinner que substitui todo o conteúdo e deixa a pessoa sem saber qual ação está em andamento;
- área acionável pequena sem justificativa ou alternativa adequada.

## Matriz mínima de testes

Cada implementação deve verificar, quando aplicável:

- renderização das variantes;
- acionamento por método nativo;
- foco e ordem de foco;
- acionamento por teclado;
- nome, papel e estado acessíveis;
- disabled;
- loading e prevenção de acionamento duplicado;
- ícone + texto;
- botão somente com ícone;
- target size;
- contraste dos estados;
- tema claro e escuro;
- zoom/escalabilidade;
- alto contraste ou configurações equivalentes da plataforma quando disponíveis.

## Validação manual

Antes de ser considerado estável, o componente deve ser validado com tecnologias assistivas relevantes para cada plataforma suportada. A evidência deve registrar ao menos plataforma, versão, tecnologia assistiva, cenário testado, resultado e limitações encontradas.

## Critérios de aceite para a especificação

- [ ] propósito e limites de uso acordados;
- [ ] variantes funcionais aprovadas;
- [ ] estados definidos;
- [ ] comportamento de loading e disabled aprovado;
- [ ] regras de foco e teclado aprovadas;
- [ ] regras de nome e semântica aprovadas;
- [ ] target size alinhado à RFC-0002;
- [ ] uso de tokens definido;
- [ ] matriz mínima de testes aprovada;
- [ ] implementações de plataforma ainda não são tratadas como estáveis antes da validação própria.

## Implementações planejadas

- Web;
- Laravel/PHP;
- Android/Kotlin;
- iOS/Swift;
- Flutter;
- Python desktop para CIATA - Games.
