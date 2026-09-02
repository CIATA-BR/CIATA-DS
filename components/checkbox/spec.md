# CMP-0003 — Checkbox / Caixa de seleção

## Status

Rascunho.

## Propósito

Permitir que a pessoa usuária marque ou desmarque uma opção independente, inclusive em conjuntos nos quais zero, uma ou várias opções podem permanecer selecionadas.

Use Checkbox quando cada opção representar uma escolha independente. Não use Checkbox para escolhas mutuamente exclusivas; nesse caso, prefira Radio. Não use Checkbox como substituto de um botão de ação.

## Princípio de implementação

A implementação deve preferir o controle nativo da plataforma e preservar nome, papel, estado, foco e acionamento expostos às APIs de acessibilidade.

## Propriedades conceituais

- `label` — rótulo visível e nome principal do controle;
- `checked` — indica o estado marcado/desmarcado;
- `indeterminate` — representa estado misto quando o domínio exigir seleção parcial;
- `disabled` — impede alteração quando a opção não está disponível;
- `required` — indica obrigatoriedade quando semanticamente aplicável ao contexto;
- `helpText` — orientação adicional opcional;
- `errorText` — mensagem de erro associada ao controle ou grupo;
- `onChange` — ação executada quando o estado muda.

Os nomes concretos das propriedades podem variar por linguagem e framework.

## Estados

- desmarcado;
- marcado;
- misto/indeterminado, quando aplicável;
- foco;
- hover, quando houver apontador;
- pressed/active, quando a plataforma expuser;
- disabled;
- erro, quando a validação exigir.

Nenhum estado pode depender exclusivamente de cor.

## Nome acessível

O nome acessível deve comunicar claramente o significado da opção.

Exemplos adequados:

- `Aceito receber comunicações`;
- `Lembrar-me neste dispositivo`;
- `Selecionar todos os arquivos`.

Evitar rótulos vagos como `Sim`, `Opção 1` ou instruções que dependam apenas da posição visual.

Não acrescentar palavras como `caixa de seleção` ao nome acessível quando a tecnologia assistiva já anuncia o papel.

## Semântica

O controle deve ser exposto como checkbox pela plataforma e seu estado deve ser programaticamente determinável.

O estado `checked` deve refletir imediatamente a escolha atual. Quando houver estado misto, a implementação deve usar o mecanismo nativo equivalente a `mixed`/`indeterminate`, sem simular o estado apenas visualmente.

## Associação entre rótulo e controle

O texto visível deve estar programaticamente associado ao checkbox.

Quando a plataforma permitir, acionar o rótulo visível deve alternar o checkbox, ampliando a área útil de interação sem criar múltiplos controles concorrentes.

Textos de ajuda e erro devem ser associados ao checkbox ou ao grupo de forma que a pessoa usuária consiga compreender contexto e validação sem depender da proximidade visual.

## Grupos

Conjuntos de checkboxes relacionados devem possuir um nome de grupo perceptível e programaticamente determinável quando isso for necessário para compreensão.

Exemplos:

- `Preferências de contato`;
- `Formatos de arquivo aceitos`;
- `Recursos de acessibilidade utilizados`.

O nome do grupo não substitui o rótulo individual de cada checkbox.

## Teclado e acionamento

### Web e desktop

- o controle habilitado deve participar da ordem de foco conforme o comportamento nativo da plataforma;
- `Espaço` deve alternar o estado quando esse for o comportamento nativo;
- `Tab` deve mover o foco sem alterar o estado;
- não exigir apontador para operação essencial;
- não implementar atalhos customizados que conflitem com o padrão nativo.

### Touch

O controle deve ser acionável por gesto simples da plataforma. A área interativa pode incluir o rótulo associado desde que não gere ambiguidade ou sobreposição com outros controles.

## Área de interação

O padrão interno recomendado é 44 × 44 CSS px ou equivalente lógico quando aplicável.

No Android, preservar controles nativos que adotem 48 dp. No iOS, preservar alvo mínimo de 44 × 44 pt para interação.

O marcador visual pode ser menor que a área acionável quando a plataforma permitir ampliar o hit target de forma segura.

## Foco

O indicador de foco deve:

- ser visível;
- permanecer identificável em tema claro e escuro;
- possuir contraste suficiente contra cores adjacentes;
- não ser removido por estética;
- indicar o controle inteiro ou sua área interativa de forma inequívoca.

## Checked

Quando marcado:

- o estado deve ser exposto pela API de acessibilidade;
- a indicação visual deve permanecer perceptível sem depender apenas de cor;
- a mudança deve ocorrer sem mover o foco arbitrariamente;
- a tecnologia assistiva deve anunciar o novo estado pelo comportamento nativo da plataforma.

## Indeterminate / Mixed

Use estado misto apenas quando houver significado real de seleção parcial, por exemplo um checkbox pai que representa vários itens filhos.

Quando `indeterminate=true`:

- o estado deve ser exposto programaticamente como misto quando a plataforma suportar;
- a aparência não pode ser a única evidência do estado;
- o comportamento ao acionar deve ser definido pela regra de negócio e documentado pela implementação;
- não use `indeterminate` como substituto de erro, loading ou ausência de resposta.

## Disabled

Use disabled somente quando a opção não puder ser alterada naquele momento.

Se estiver disabled:

- o estado deve ser identificável programaticamente quando suportado;
- não depender apenas de aparência acinzentada;
- a interface deve fornecer contexto suficiente para a pessoa entender por que a opção está indisponível quando isso não for óbvio;
- não converter disabled em readonly fictício por meio de bloqueio de eventos.

## Required e validação

Quando um checkbox for necessário para concluir uma tarefa, a obrigatoriedade deve ser comunicada de forma perceptível e programática conforme os recursos da plataforma.

Em grupos com regras como `selecione ao menos uma opção`, a validação deve pertencer ao grupo, não ser duplicada de forma confusa em cada item.

Quando houver erro:

- informar claramente o problema e como corrigi-lo;
- associar a mensagem ao controle ou grupo correspondente;
- mover foco somente quando isso fizer parte de uma estratégia de validação coerente;
- não depender apenas de cor, ícone ou mascote para comunicar o erro.

## Conteúdo e linguagem

- usar rótulos afirmativos e diretos;
- evitar dupla negação;
- manter cada opção semanticamente independente;
- explicitar consequências importantes, especialmente consentimentos;
- não usar texto que dependa apenas da posição, forma ou cor.

## Consentimento e opções sensíveis

Checkboxes usados para consentimento, autorização ou aceite devem deixar claro o que está sendo aceito.

Não pré-marcar opções de consentimento quando isso contrariar a regra de negócio, norma aplicável ou expectativa de escolha explícita.

## Tokens

O componente deve consumir tokens semânticos e de fundação do CIATA-DS, incluindo quando disponíveis:

- cor de superfície e borda;
- cor e contraste do marcador;
- foco e foco-contraste;
- tipografia;
- espaçamento;
- dimensão mínima de interação;
- estados disabled e erro;
- tema claro/escuro.

Implementações não devem inventar valores fixos quando existir token canônico equivalente.

## Tema

O componente deve consumir aliases semânticos compatíveis com tema claro, escuro e sistema. O código do checkbox não deve selecionar manualmente tokens específicos de tema quando o mecanismo de tema puder resolver isso.

## Exemplos conformes

- checkbox nativo `Aceito receber comunicações`, com rótulo associado e estado anunciado pelo leitor de tela;
- grupo `Preferências de contato` com opções independentes e legenda de grupo programática;
- checkbox `Selecionar todos` usando estado misto quando apenas parte dos itens filhos estiver selecionada;
- mensagem `Selecione pelo menos um formato` associada ao grupo de opções.

## Exemplos não conformes

- `div` ou ícone clicável simulando checkbox sem semântica nativa;
- estado marcado indicado somente por cor;
- rótulo visual não associado ao controle;
- nome acessível `caixa de seleção Receber novidades` quando o papel já é anunciado;
- checkbox de consentimento pré-marcado sem justificativa;
- estado indeterminado usado para representar erro ou loading;
- foco removido;
- área acionável pequena sem alternativa adequada.

## Matriz mínima de testes

Cada implementação deve verificar, quando aplicável:

- renderização desmarcado/marcado/misto;
- acionamento por método nativo;
- foco e ordem de foco;
- teclado;
- nome, papel e estado acessíveis;
- associação do rótulo;
- grupo e nome de grupo;
- disabled;
- required e erro;
- target size;
- contraste dos estados;
- tema claro e escuro;
- zoom/escalabilidade de texto;
- alto contraste ou configuração equivalente;
- compatibilidade com tecnologias assistivas relevantes.

## Validação manual

Antes de ser considerado estável, o componente deve ser validado com tecnologias assistivas relevantes para cada plataforma suportada. A evidência deve registrar ao menos plataforma, versão, tecnologia assistiva, cenário testado, resultado e limitações encontradas.

## Critérios de aceite para a especificação

- [ ] propósito e limites de uso acordados;
- [ ] estados checked, unchecked e mixed definidos;
- [ ] regras de rótulo, grupo e ajuda aprovadas;
- [ ] regras de teclado e foco aprovadas;
- [ ] required, erro e disabled definidos;
- [ ] target size alinhado à RFC-0002;
- [ ] uso de tokens definido;
- [ ] matriz mínima de testes aprovada;
- [ ] implementações de plataforma ainda não são tratadas como estáveis antes da validação própria.

## Implementações planejadas

- Web;
- Laravel/PHP;
- Python desktop, quando aplicável;
- Android/Jetpack Compose;
- iOS/SwiftUI;
- Flutter.
