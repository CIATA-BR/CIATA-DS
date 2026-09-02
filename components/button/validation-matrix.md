# CMP-0001 — Matriz de validação multiplataforma

## Status

Em validação.

Esta matriz registra a evidência necessária para promover as implementações do `CMP-0001 — Button / Botão` de experimental para estável.

A presença do componente no repositório não é, por si só, evidência de conformidade. Cada plataforma deve ser validada em aplicação real ou harness equivalente, com tecnologias assistivas e configurações relevantes.

## Critérios comuns

Para cada plataforma, verificar ao menos:

- nome acessível claro e contextual;
- papel de botão exposto corretamente;
- acionamento pelo mecanismo nativo da plataforma;
- ordem de foco previsível;
- indicador de foco perceptível quando aplicável;
- `disabled` exposto como estado nativo;
- `loading` distinguível de `disabled`;
- prevenção de acionamento duplicado durante `loading`;
- preservação do rótulo original durante `loading`;
- variante destrutiva sem depender apenas de cor;
- alvo mínimo de interação conforme a plataforma;
- escala de texto, zoom ou Dynamic Type sem truncamento funcional;
- temas claro e escuro;
- alto contraste/forced colors quando disponível;
- teclado externo quando suportado;
- ausência de anúncio duplicado por tecnologia assistiva;
- ausência de perda arbitrária de foco após acionamento;
- comportamento adequado com leitor de tela ativo e inativo.

## Evidência mínima por teste

Registrar:

- plataforma e versão;
- framework/runtime e versão;
- dispositivo ou ambiente;
- tecnologia assistiva e versão;
- variante e estado testados;
- método de acionamento;
- resultado esperado;
- resultado observado;
- status: `pass`, `fail`, `blocked` ou `not-applicable`;
- observações e limitações;
- referência para issue/PR quando houver falha.

## Web / Laravel

### Ambientes mínimos

- Chrome + NVDA;
- Edge + JAWS;
- Firefox + NVDA;
- navegação somente por teclado;
- zoom de 200% e 400% quando aplicável;
- Windows High Contrast / forced colors.

### Cenários

- [ ] primary;
- [ ] secondary;
- [ ] danger;
- [ ] ghost;
- [ ] foco via Tab e Shift+Tab;
- [ ] acionamento por Enter;
- [ ] acionamento por Espaço;
- [ ] disabled;
- [ ] loading;
- [ ] prevenção de duplo acionamento;
- [ ] retorno/manutenção de foco após ação síncrona;
- [ ] alteração legítima de foco após abertura de diálogo;
- [ ] tema claro;
- [ ] tema escuro;
- [ ] forced colors;
- [ ] zoom/reflow.

## Python / wxPython

### Ambientes mínimos

- Windows + NVDA;
- Windows + JAWS;
- navegação somente por teclado;
- escala de exibição do sistema ampliada.

### Cenários

- [ ] papel e nome do `wx.Button`;
- [ ] foco via Tab/Shift+Tab;
- [ ] acionamento por teclado;
- [ ] disabled nativo;
- [ ] loading sem retirada indevida do fluxo de foco;
- [ ] bloqueio de novo acionamento durante loading;
- [ ] callback `on_status` integrado a mecanismo acessível do app;
- [ ] anúncio de início de operação;
- [ ] anúncio de conclusão sem repetição excessiva;
- [ ] dimensão mínima em diferentes escalas de DPI;
- [ ] alto contraste do Windows.

## Android / Jetpack Compose

### Ambientes mínimos

- Android real com TalkBack;
- fonte padrão e fonte ampliada;
- tema claro e escuro;
- teclado físico quando disponível;
- Switch Access quando aplicável ao produto.

### Cenários

- [ ] primary;
- [ ] secondary;
- [ ] danger;
- [ ] ghost;
- [ ] nome e papel anunciados pelo TalkBack;
- [ ] alvo mínimo de 48 dp;
- [ ] loading anunciado por `stateDescription` sem duplicidade;
- [ ] indicador de progresso não vira foco separado;
- [ ] disabled nativo;
- [ ] prevenção de duplo acionamento;
- [ ] texto ampliado sem perda funcional;
- [ ] navegação por foco/teclado quando disponível;
- [ ] tema claro;
- [ ] tema escuro.

## iOS / SwiftUI

### Ambientes mínimos

- iPhone real com VoiceOver;
- Dynamic Type em tamanhos ampliados, incluindo categorias de acessibilidade;
- tema claro e escuro;
- Switch Control;
- teclado externo quando aplicável.

### Cenários

- [ ] primary;
- [ ] secondary;
- [ ] danger;
- [ ] ghost;
- [ ] nome e papel anunciados pelo VoiceOver;
- [ ] alvo mínimo de 44 pt;
- [ ] loading comunicado sem marcar a ação como indisponível;
- [ ] `ProgressView` não vira elemento redundante;
- [ ] disabled nativo;
- [ ] prevenção de duplo acionamento;
- [ ] Dynamic Type sem truncamento funcional;
- [ ] ordem de foco previsível;
- [ ] Switch Control;
- [ ] teclado externo;
- [ ] tema claro;
- [ ] tema escuro.

## Flutter

### Ambientes mínimos

- Android real + TalkBack;
- iOS real + VoiceOver;
- text scaling ampliado;
- tema claro e escuro;
- teclado quando aplicável.

### Cenários

- [ ] primary;
- [ ] secondary;
- [ ] danger;
- [ ] ghost;
- [ ] papel e nome consolidados corretamente em `Semantics`;
- [ ] ausência de semântica duplicada entre wrapper e botão interno;
- [ ] alvo mínimo de 44 × 44 unidades lógicas;
- [ ] loading comunicado sem disabled semântico;
- [ ] indicador de progresso excluído da árvore semântica;
- [ ] disabled nativo;
- [ ] prevenção de duplo acionamento;
- [ ] text scaling sem perda funcional;
- [ ] tema claro;
- [ ] tema escuro;
- [ ] teclado/foco quando aplicável.

## Critério para promoção a estável

Uma implementação só pode ser promovida para `stable` quando:

1. todos os cenários obrigatórios aplicáveis estiverem em `pass`;
2. não houver falha aberta de severidade alta;
3. falhas de severidade média estiverem corrigidas ou formalmente aceitas com justificativa e prazo;
4. limitações específicas de plataforma estiverem documentadas;
5. evidências de teste manual estiverem registradas;
6. a implementação estiver alinhada aos tokens canônicos publicados para a plataforma;
7. houver pelo menos um produto consumidor real ou harness representativo validado.

A promoção pode ocorrer por plataforma. O `CMP-0001` não precisa esperar todas as plataformas para considerar uma implementação específica estável, desde que seu status seja registrado individualmente.

## Registro de status

| Plataforma | Implementação | Status atual | Evidência | Produto/harness |
| --- | --- | --- | --- | --- |
| Web | HTML/CSS/JS | experimental | pendente | pendente |
| Laravel | Blade + Web | experimental | pendente | pendente |
| Python | wxPython | experimental | pendente | CIATA-Game |
| Android | Jetpack Compose | experimental | pendente | pendente |
| iOS | SwiftUI | experimental | pendente | pendente |
| Flutter | Material | experimental | pendente | pendente |

## Próximos passos

1. executar os testes por plataforma;
2. registrar evidências e falhas;
3. corrigir divergências encontradas;
4. publicar/exportar tokens pendentes;
5. promover cada implementação elegível para `stable` em PR próprio.
