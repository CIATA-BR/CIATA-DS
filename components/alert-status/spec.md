# CMP-0007 — Alert / Status

## Status

Rascunho.

## Propósito

Comunicar informações de estado, sucesso, aviso, erro ou atualização relevante sem depender apenas de aparência visual. Alert deve ser reservado a mensagens urgentes que exigem anúncio imediato. Status atende atualizações importantes, porém não urgentes.

## Princípio de implementação

Preferir mecanismos nativos da plataforma e preservar semântica, prioridade, leitura, foco e contexto. Não mover foco automaticamente para mensagens de status, salvo quando a própria jornada exigir interação imediata.

## Propriedades conceituais

- `message` — conteúdo textual principal;
- `title` — título opcional quando melhora compreensão;
- `variant` — info, success, warning, error;
- `priority` — status/polite ou alert/assertive conforme urgência real;
- `persistent` — indica se a mensagem permanece visível;
- `dismissible` — permite fechar quando apropriado;
- `onDismiss` — ação de fechamento;
- `icon` — apoio visual opcional, nunca fonte única de significado.

## Semântica

- Use status/polite para confirmações e atualizações não urgentes.
- Use alert/assertive somente quando a informação requer atenção imediata.
- Não anunciar mensagens rotineiras de forma assertiva.
- Não duplicar o mesmo anúncio em múltiplas regiões ao mesmo tempo.

## Foco

A chegada de um Alert/Status não deve roubar foco. Se houver ação dentro do componente, ela deve entrar na ordem de foco normal. Ao fechar mensagem dispensável, retornar o foco apenas se ele estiver dentro do componente fechado e houver destino lógico.

## Conteúdo

Mensagens devem ser objetivas, específicas e acionáveis quando houver correção necessária. Exemplos:

- `Dados salvos com sucesso.`
- `Não foi possível enviar o formulário. Revise os campos destacados.`
- `Sua sessão expira em 2 minutos.`

Evitar `Algo deu errado` sem orientação.

## Estados e variantes

Cor, ícone e posição podem reforçar significado, mas texto deve identificar a situação. Sucesso, aviso e erro precisam permanecer compreensíveis em alto contraste e sem cor.

## Dismiss

Mensagens críticas não devem desaparecer automaticamente antes de serem percebidas. Se houver fechamento:

- o controle deve possuir nome claro;
- fechamento deve ser operável por teclado e touch;
- não usar apenas um ícone sem nome acessível;
- não ocultar informação necessária para concluir a tarefa sem alternativa.

## Temporização

Evitar auto-dismiss para conteúdo importante. Quando temporização for necessária, oferecer duração suficiente e estratégia de pausa/recuperação quando aplicável.

## Loading versus Status

Loading/Progress possui componente próprio. Alert/Status pode anunciar início, conclusão ou falha, mas não deve substituir indicador de progresso contínuo.

## Área de interação

Controles dentro do componente seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode preservar 48 dp e iOS mínimo de 44 × 44 pt.

## Tokens e tema

Consumir tokens canônicos de superfície, texto, borda, foco, sucesso, aviso, erro, info, espaçamento e tipografia quando existirem. Respeitar claro, escuro, sistema, forced colors e text scaling.

## Exemplos conformes

- confirmação de salvamento em região de status sem mover foco;
- erro global com texto acionável e assertive somente quando necessário;
- botão `Fechar aviso` com nome explícito;
- ícone de erro acompanhado por texto equivalente.

## Exemplos não conformes

- usar vermelho como única indicação de erro;
- mover foco automaticamente para todo toast/status;
- usar `role=alert` para cada atualização trivial;
- esconder erro crítico após poucos segundos;
- mascote como única fonte de sucesso, erro ou aviso;
- botão de fechar sem nome acessível.

## Matriz mínima de testes

Cada implementação deve verificar:

- mensagem e título;
- prioridade correta;
- anúncio único;
- ausência de roubo de foco;
- dismiss e retorno de foco quando aplicável;
- variantes sem dependência de cor;
- teclado e touch;
- alto contraste;
- tema claro/escuro;
- text scaling/zoom;
- recursos de tecnologia assistiva relevantes.

## Validação manual

Antes de ser considerada estável, cada implementação deve possuir evidência real de teste com recursos de tecnologia assistiva relevantes.

## Critérios de aceite

- [ ] diferença entre Alert e Status definida;
- [ ] prioridade e anúncios definidos;
- [ ] foco e dismiss definidos;
- [ ] conteúdo e temporização definidos;
- [ ] tokens e tema definidos;
- [ ] matriz mínima aprovada;
- [ ] implementações permanecem experimentais até validação manual real.

## Implementações planejadas

- Web;
- Laravel/PHP;
- Python desktop;
- Android/Jetpack Compose;
- iOS/SwiftUI;
- Flutter.
