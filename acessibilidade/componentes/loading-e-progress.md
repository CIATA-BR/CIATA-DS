# Loading e progress

## Contrato

Estados de carregamento e progresso devem informar que uma operação começou, continua em andamento e terminou, sem bloquear desnecessariamente a navegação nem repetir anúncios de forma excessiva.

## Regras

- diferenciar progresso determinado de indeterminado;
- informar início e conclusão quando a espera for relevante;
- quando houver porcentagem ou etapa real, expor valor atual de forma semanticamente útil;
- não anunciar atualizações rápidas a cada pequena variação quando isso gerar fala contínua;
- preservar o contexto e o foco do usuário durante operações assíncronas;
- não substituir conteúdo inteiro por spinner quando for possível manter o contexto visível e operável;
- se uma ação não puder ser repetida durante o carregamento, comunicar esse estado sem apagar o nome do controle;
- permitir cancelamento quando a tarefa for longa e tecnicamente cancelável;
- usar regiões de status para mensagens transitórias quando elas precisarem ser anunciadas, sem tornar o status uma dependência descritiva permanente do controle que iniciou a ação.

## Web

Preferir elementos e estados semânticos apropriados ao contexto. Para progresso determinado, usar um mecanismo que exponha valor mínimo, máximo e atual. Para carregamento textual, usar região de status separada quando a mensagem precisar ser anunciada sem mover foco.

## Android

Usar componentes de progresso do toolkit e expor descrição e valor quando aplicáveis. Evitar eventos de acessibilidade a cada frame ou atualização pequena. Se o botão que iniciou a ação continuar visível, manter nome e contexto enquanto comunica estado ocupado.

## iOS

Usar indicadores de atividade/progresso nativos ou equivalentes, expondo valor quando determinado. Atualizações faladas devem ser proporcionais à necessidade, sem interromper continuamente o VoiceOver.

## Exemplo conforme

```html
<button type="submit">Enviar</button>
<p role="status" aria-live="polite">Enviando mensagem…</p>
```

Para uma operação determinada, o componente de progresso deve expor, por exemplo, 60% concluído quando esse valor for real.

## Comportamento esperado

- a pessoa ativa `Enviar`;
- recebe feedback equivalente a “Enviando mensagem”;
- o foco não é deslocado para o texto de status;
- o botão mantém seu nome e contexto enquanto a operação estiver ocupada;
- ao concluir, recebe feedback equivalente a “Mensagem enviada” ou encontra o novo estado da interface de forma previsível.

## Exemplo não conforme

```html
<div class="spinner"></div>
```

O spinner é apenas visual, não possui texto ou estado acessível e substitui silenciosamente o conteúdo da tela.

## Por que falha

Uma pessoa que não vê a animação pode não saber se a ação foi aceita, se a interface travou ou se deve repetir o comando. Repetições podem gerar ações duplicadas, como múltiplos envios ou pagamentos.

## Critérios de teste

- início e fim da operação são perceptíveis quando relevantes;
- progresso determinado expõe valor coerente;
- atualizações não geram fala excessiva;
- foco não é roubado por mensagens de carregamento;
- mensagens transitórias não são acopladas desnecessariamente à descrição permanente do controle;
- não há dupla ativação acidental durante processamento;
- cancelamento é acessível quando aplicável.

## Veja também

- [Mensagens dinâmicas](../receitas/mensagens-dinamicas.md)
- [Foco e contexto](../receitas/foco-e-contexto.md)
