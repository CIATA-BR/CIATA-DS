# CMP-0012 — Toast

## Status
Rascunho.

## Propósito
Comunicar feedback transitório e não bloqueante sobre uma ação concluída, estado alterado ou evento relevante, sem roubar foco nem exigir reação imediata do usuário.

## Princípios
- Toast não substitui erro persistente, validação de formulário, alerta crítico ou conteúdo que o usuário precisa consultar depois.
- Não mover foco para o toast quando ele aparecer.
- Mensagens devem ser curtas, específicas e compreensíveis fora do contexto visual.
- Não depender apenas de cor, ícone, animação ou posição para transmitir significado.
- O desaparecimento automático nunca pode impedir o usuário de perceber informação essencial.
- Ações dentro de toast só devem existir quando forem realmente úteis e tecnicamente confiáveis.

## Propriedades conceituais
- `message` — texto principal;
- `variant` — neutral, success, warning ou error quando aplicável;
- `duration` — tempo de exibição quando o conteúdo puder desaparecer com segurança;
- `persistent` — mantém o toast até fechamento explícito;
- `actionLabel` e `onAction` — ação opcional, como `Desfazer`;
- `dismissible` e `onDismiss` — fechamento explícito quando necessário;
- `announce` — política de anúncio alinhada à urgência real.

## Semântica e anúncios
Para feedback informativo comum, usar mecanismo equivalente a status/polite. Alertas urgentes podem exigir assertive/alert, mas não devem ser transformados em toast apenas por conveniência visual. Não repetir a mesma mensagem em múltiplas regiões vivas.

Na Web, preferir uma região estável de `role="status"`/`aria-live="polite"` para mensagens comuns. Não criar uma nova região live a cada toast nem focar o elemento para forçar leitura.

## Temporização
- Conteúdo essencial não deve desaparecer automaticamente sem alternativa persistente.
- Quando houver ação como `Desfazer`, oferecer tempo suficiente ou alternativa equivalente persistente.
- Pausar temporização durante interação por teclado/ponteiro quando necessário para permitir uso da ação.
- Evitar filas rápidas que substituam mensagens antes que possam ser percebidas.

## Foco e interação
- O foco permanece no controle/contexto que originou a ação.
- Ações do toast entram na ordem de foco normal somente enquanto estiverem presentes.
- Ao fechar um toast, não deslocar foco arbitrariamente.
- Se o toast desaparecer enquanto sua ação possui foco, devolver foco de modo previsível ao contexto lógico anterior.

## Posicionamento e conteúdo
A posição visual não define prioridade semântica. Mensagens devem explicar o resultado, por exemplo `Relatório salvo` ou `Não foi possível enviar o arquivo`, em vez de `Sucesso` ou `Erro` isolados.

## Tema e movimento
Respeitar claro, escuro, sistema, forced/high contrast, text scaling e redução de movimento. Entrada/saída animada deve ser decorativa e dispensável.

## Exemplos conformes
- após salvar, mensagem `Relatório salvo` anunciada uma vez por status sem mudança de foco;
- toast persistente para falha que exige leitura, com botão `Fechar` e caminho de recuperação no conteúdo principal;
- ação `Desfazer` com alvo adequado e tempo suficiente para interação;
- ícone de sucesso tratado como decorativo quando o texto já comunica o resultado.

## Exemplos não conformes
- toast recebendo foco automaticamente ao aparecer;
- mensagem crítica desaparecendo em três segundos sem alternativa persistente;
- `Erro` anunciado sem explicar o que falhou;
- múltiplas regiões `aria-live` repetindo a mesma mensagem;
- ação `Desfazer` removida enquanto está focada sem recuperação previsível;
- toast visual verde sem texto equivalente;
- animação obrigatória ignorando redução de movimento.

## Matriz mínima
Verificar anúncio, urgência, foco, temporização, persistência, ação opcional, fechamento, fila de mensagens, alto contraste, redução de movimento, text scaling e tecnologias assistivas.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
