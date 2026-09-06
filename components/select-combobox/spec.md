# CMP-0005 — Select / Combobox

## Status

Rascunho.

## Propósito

Permitir a escolha de uma opção entre uma lista. Use Select quando a lista é finita e conhecida. Use Combobox quando a pessoa precisa pesquisar, filtrar ou digitar para localizar opções.

Não substituir Radio quando poucas opções mutuamente exclusivas puderem ser apresentadas de forma clara. Não usar Combobox apenas para reproduzir visualmente um Select nativo.

## Princípio de implementação

Preferir controles nativos da plataforma. Quando Combobox exigir composição customizada, preservar nome, papel, estado expandido/recolhido, valor atual, opção ativa, foco e relação com a lista por mecanismos nativos ou padrões consolidados de acessibilidade.

## Propriedades conceituais

- `label` — rótulo persistente do campo;
- `options` — opções disponíveis;
- `value` — valor selecionado;
- `placeholder` — instrução curta quando não houver valor, sem substituir o rótulo;
- `required` — obrigatoriedade;
- `disabled` — indisponibilidade;
- `helpText` — ajuda contextual;
- `errorText` — mensagem de erro;
- `searchable` — habilita comportamento de Combobox quando apropriado;
- `onChange` — alteração da seleção;
- `onQueryChange` — alteração da busca em Combobox.

## Estados

- sem seleção;
- selecionado;
- foco;
- aberto/expandido;
- fechado/recolhido;
- disabled;
- erro;
- carregando, somente quando opções forem carregadas de forma assíncrona.

Estados não podem depender exclusivamente de cor.

## Nome acessível e rótulo

O controle deve possuir rótulo visível persistente e programaticamente associado. Placeholder não substitui label.

Não acrescentar palavras como `caixa combinada`, `lista` ou `menu` ao nome acessível quando a plataforma já anunciar o papel.

## Select nativo

Quando a necessidade puder ser atendida por um seletor nativo, ele deve ser preferido. A implementação deve preservar teclado, foco, abertura, navegação e anúncio de valor da plataforma.

## Combobox pesquisável

Quando houver pesquisa:

- o campo de edição deve permanecer operável por teclado e recurso de tecnologia assistiva;
- o estado expandido deve ser programaticamente determinável;
- a lista associada deve ser identificável;
- a opção ativa deve ser comunicada sem mover o foco arbitrariamente para cada item;
- Enter/acionamento deve confirmar a opção ativa conforme o padrão da plataforma;
- Escape deve fechar a lista quando esse comportamento for esperado sem apagar valor confirmado arbitrariamente;
- a digitação deve filtrar sem gerar anúncios excessivos;
- resultados vazios devem ser informados de forma perceptível.

## Teclado e foco

Preservar o comportamento nativo de cada plataforma. Em Web/desktop, quando aplicável:

- `Tab` move foco para dentro/fora do controle sem selecionar opções inesperadamente;
- setas navegam entre opções conforme o padrão do controle;
- `Enter` ou `Espaço` abrem/confirmam quando previsto pelo padrão nativo;
- `Escape` fecha listas customizadas quando aplicável;
- digitação incremental ou busca funciona sem armadilhas de teclado;
- o foco permanece estável ao abrir, filtrar e fechar.

## Touch e target size

Usar gesto simples. O alvo deve seguir o padrão interno de 44 × 44 unidades lógicas quando aplicável; Android pode preservar 48 dp nativos e iOS deve preservar pelo menos 44 × 44 pt.

## Opções

Cada opção deve possuir texto claro e valor inequívoco. Opções disabled, quando necessárias, devem ser semanticamente distintas e não apenas acinzentadas.

Evitar listas excessivamente longas sem busca ou agrupamento apropriado. Agrupamentos devem possuir rótulos perceptíveis quando ajudarem a compreensão.

## Required, ajuda e erro

Obrigatoriedade deve ser comunicada de forma perceptível e programática conforme a plataforma. Ajuda e erro devem estar associados ao controle.

Quando houver erro:

- explicar o problema e como corrigi-lo;
- não depender apenas de cor, ícone ou mascote;
- não mover foco arbitrariamente;
- preservar o valor atual quando apropriado.

## Loading e dados assíncronos

Em Combobox com busca remota:

- loading deve ser distinguível de lista vazia;
- evitar anúncios repetitivos a cada caractere;
- resultados antigos não devem substituir silenciosamente uma consulta mais recente;
- falhas de carregamento devem ser comunicadas e permitir nova tentativa.

## Conteúdo e linguagem

- manter label curta e clara;
- evitar placeholder como única instrução;
- usar opção inicial vazia apenas quando fizer sentido;
- evitar `Selecione...` como valor real do domínio;
- indicar `Outro` somente quando houver fluxo claro de complementação.

## Tokens e tema

Consumir tokens canônicos de texto, superfície, borda, foco, erro, disabled, espaçamento, tipografia e ação quando existirem. Respeitar tema claro, escuro e sistema, forced colors/alto contraste e escalabilidade de texto.

## Exemplos conformes

- Select nativo `Estado` com label persistente e valor anunciado corretamente;
- Combobox `Cidade` pesquisável, com estado expandido e opção ativa expostos corretamente;
- erro `Escolha um estado` associado ao controle;
- resultado `Nenhuma cidade encontrada` perceptível sem roubar foco.

## Exemplos não conformes

- `div` que imita Select sem teclado ou semântica;
- placeholder usado como único label;
- abertura que move foco de forma imprevisível;
- lista customizada sem estado expandido programático;
- opção ativa indicada somente por cor;
- anúncios de toda a lista a cada caractere digitado;
- Combobox usado onde um Select nativo resolveria a necessidade.

## Matriz mínima de testes

Cada implementação deve verificar, quando aplicável:

- label, nome, papel e valor;
- estado aberto/fechado;
- teclado e foco;
- touch;
- seleção e limpeza quando suportada;
- disabled;
- required, ajuda e erro;
- opções disabled;
- busca e filtragem;
- opção ativa;
- resultado vazio;
- loading/erro remoto quando aplicável;
- target size;
- tema claro/escuro;
- alto contraste;
- zoom/text scaling;
- recursos de tecnologia assistiva relevantes.

## Validação manual

Antes de ser considerada estável, cada implementação deve possuir evidência real de teste com recursos de tecnologia assistiva relevantes, registrando plataforma, versão, recurso de tecnologia assistiva, cenário, resultado e limitações.

## Critérios de aceite para a especificação

- [ ] distinção entre Select e Combobox acordada;
- [ ] semântica e estados definidos;
- [ ] foco e teclado aprovados;
- [ ] busca, filtragem e opção ativa definidas;
- [ ] required, ajuda, erro e disabled definidos;
- [ ] loading assíncrono definido quando aplicável;
- [ ] target size alinhado à RFC-0002;
- [ ] tokens e tema definidos;
- [ ] implementações permanecem experimentais até validação manual real.

## Implementações planejadas

- Web;
- Laravel/PHP;
- Python desktop;
- Android/Jetpack Compose;
- iOS/SwiftUI;
- Flutter.
