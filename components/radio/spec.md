# CMP-0004 — Radio / Botão de opção

## Status

Rascunho.

## Propósito

Permitir que a pessoa usuária escolha exatamente uma opção entre alternativas mutuamente exclusivas pertencentes ao mesmo grupo.

Use Radio quando todas as opções relevantes puderem ser apresentadas juntas e somente uma delas puder permanecer selecionada. Não use Radio para escolhas independentes; nesse caso, prefira Checkbox. Para listas extensas ou carregadas dinamicamente, avaliar Select/Combobox.

## Princípio de implementação

Preferir controles nativos da plataforma e preservar nome, papel, estado, foco, seleção e acionamento expostos às APIs de acessibilidade.

## Propriedades conceituais

- `label` — rótulo individual da opção;
- `value` — valor associado à opção;
- `selected` — indica se a opção está selecionada;
- `disabled` — impede alteração quando a opção não está disponível;
- `required` — indica que uma escolha no grupo é obrigatória quando aplicável;
- `groupLabel` — nome perceptível e programático do grupo;
- `helpText` — orientação adicional do grupo ou da opção;
- `errorText` — mensagem de validação associada ao grupo;
- `onChange` — ação executada quando a seleção muda.

Os nomes concretos podem variar por plataforma.

## Estados

- não selecionado;
- selecionado;
- foco;
- hover, quando houver apontador;
- pressed/active, quando a plataforma expuser;
- disabled;
- erro no grupo, quando aplicável.

Nenhum estado deve depender exclusivamente de cor.

## Semântica de grupo

Radios relacionados devem pertencer ao mesmo grupo semântico e possuir um nome de grupo perceptível e programaticamente determinável.

Exemplos de grupos:

- `Forma de contato preferida`;
- `Tipo de documento`;
- `Periodicidade do relatório`.

O nome do grupo não substitui o rótulo individual de cada opção.

## Nome acessível

Cada opção deve possuir rótulo claro e específico, por exemplo:

- `E-mail`;
- `Telefone`;
- `WhatsApp`.

Evitar nomes vagos como `Opção 1`, `Primeiro` ou rótulos que dependam somente da posição visual.

Não acrescentar palavras como `botão de opção` ao nome acessível quando a tecnologia assistiva já anuncia o papel.

## Seleção

Em um grupo:

- no máximo uma opção pode permanecer selecionada;
- selecionar uma opção deve desmarcar a anteriormente selecionada conforme o comportamento nativo;
- a mudança de seleção não deve provocar perda arbitrária de foco;
- o estado selecionado deve ser programaticamente determinável;
- a interface não deve simular exclusividade somente por aparência.

## Estado inicial

Quando uma opção inicial puder ser escolhida sem presumir intenção da pessoa usuária, ela pode iniciar selecionada.

Quando a escolha exigir decisão explícita, especialmente em contextos sensíveis, não selecionar uma opção apenas por conveniência.

## Teclado e foco

### Web e desktop

Preservar o comportamento nativo do grupo. Quando aplicável:

- `Tab` entra e sai do grupo conforme a plataforma;
- setas direcionais movem a seleção entre opções do grupo;
- `Espaço` seleciona a opção focada quando esse for o comportamento nativo;
- não exigir apontador para operação essencial;
- não substituir o padrão nativo por gerenciamento manual de foco sem necessidade.

### Touch

A opção deve ser acionável por gesto simples da plataforma. O rótulo associado pode compor a área interativa quando isso não gerar sobreposição ou ambiguidade.

## Área de interação

O padrão interno recomendado é 44 × 44 CSS px ou equivalente lógico quando aplicável.

No Android, preservar o target nativo de 48 dp quando recomendado. No iOS, preservar alvo mínimo de 44 × 44 pt.

O marcador visual pode ser menor que a área acionável.

## Foco visível

O indicador de foco deve:

- ser claramente perceptível;
- permanecer identificável em temas claro e escuro;
- possuir contraste suficiente com superfícies adjacentes;
- não ser removido por estética;
- indicar inequivocamente qual opção está focada.

## Disabled

Use disabled somente quando uma opção realmente não puder ser escolhida naquele estado.

Quando disabled:

- o estado deve ser programaticamente identificável quando suportado;
- não depender apenas de aparência acinzentada;
- fornecer contexto quando o motivo da indisponibilidade não for óbvio;
- não remover todo o grupo se a informação sobre opções indisponíveis for relevante.

## Required e validação

A obrigatoriedade pertence conceitualmente ao grupo, mesmo quando APIs nativas exigirem atributos por controle.

Quando nenhuma opção válida tiver sido escolhida:

- explicar claramente o que precisa ser selecionado;
- associar o erro ao grupo ou estratégia equivalente da plataforma;
- não repetir a mesma mensagem de erro de forma confusa em cada opção;
- não comunicar erro apenas por cor, ícone ou mascote;
- mover foco somente dentro de uma estratégia de validação coerente.

## Ajuda e instruções

Textos de ajuda devem ser associados ao grupo ou à opção correspondente de forma perceptível.

Não usar ajuda para explicar interações que já são padrão da plataforma, salvo quando houver uma regra de negócio específica.

## Conteúdo e linguagem

- manter opções paralelas e mutuamente exclusivas;
- usar textos curtos e inequívocos;
- evitar dupla negação;
- não misturar ações com opções de escolha;
- evitar alternativas sobrepostas semanticamente, salvo quando a regra de negócio justificar;
- incluir `Outro` somente quando houver fluxo claro para detalhamento adicional.

## Tokens

O componente deve consumir tokens canônicos quando disponíveis, incluindo:

- cor de ação/seleção;
- texto primário e secundário;
- foco e foco-contraste;
- superfície e borda;
- estados disabled e erro;
- tipografia;
- espaçamento;
- dimensão mínima de interação;
- tema claro/escuro.

Não inventar tokens locais quando existir token canônico equivalente.

## Tema e preferências do sistema

O componente deve funcionar em tema claro, escuro e sistema quando suportado. Em alto contraste/forced colors, preservar distinção entre foco, selecionado, não selecionado e disabled.

## Exemplos conformes

- grupo `Forma de contato preferida` com opções nativas `E-mail`, `Telefone` e `WhatsApp`;
- seleção por teclado seguindo o comportamento nativo da plataforma;
- erro `Escolha uma forma de contato` associado ao grupo;
- opção disabled cujo estado continua programaticamente disponível.

## Exemplos não conformes

- círculos desenhados com `div` simulando radio sem semântica;
- várias opções visualmente selecionadas no mesmo grupo;
- rótulos sem associação programática;
- nome acessível `botão de opção E-mail` quando o papel já é anunciado;
- foco removido;
- grupo sem nome contextual;
- erro indicado somente pela cor;
- uso de Radio para opções independentes.

## Matriz mínima de testes

Cada implementação deve verificar, quando aplicável:

- nome e papel de cada opção;
- nome do grupo;
- estado selecionado/não selecionado;
- exclusividade da seleção;
- foco e ordem de foco;
- teclado e setas direcionais;
- touch;
- associação do rótulo;
- disabled;
- required e erro do grupo;
- ajuda;
- target size;
- contraste e foco;
- tema claro/escuro;
- alto contraste;
- zoom/escalabilidade de texto;
- tecnologias assistivas relevantes.

## Validação manual

Antes de ser considerado estável, cada implementação deve possuir evidência real de teste com tecnologias assistivas relevantes, registrando plataforma, versão, tecnologia assistiva, cenário, resultado e limitações.

## Critérios de aceite para a especificação

- [ ] propósito e limites de uso acordados;
- [ ] semântica de grupo definida;
- [ ] exclusividade e seleção definidas;
- [ ] foco e teclado aprovados;
- [ ] required, erro e disabled definidos;
- [ ] target size alinhado à RFC-0002;
- [ ] tokens e tema definidos;
- [ ] matriz mínima de testes aprovada;
- [ ] implementações permanecem experimentais até validação manual real.

## Implementações planejadas

- Web;
- Laravel/PHP;
- Python desktop, quando aplicável;
- Android/Jetpack Compose;
- iOS/SwiftUI;
- Flutter.
