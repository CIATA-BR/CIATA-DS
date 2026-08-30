# Erro e sucesso

## Contrato

Mensagens de erro e sucesso devem ser perceptíveis, específicas e vinculadas ao contexto que as originou, sem depender apenas de cor, ícone, posição ou mudança visual.

## Regras

- erro deve identificar o que ocorreu e, quando possível, como corrigir;
- mensagens relacionadas a campo devem permanecer associadas programaticamente ao campo;
- erro não deve apagar dados válidos já preenchidos;
- sucesso deve confirmar a ação realmente concluída, não apenas o clique no botão;
- mensagens importantes devem ser anunciadas sem exigir mudança manual de foco;
- não anunciar o mesmo conteúdo múltiplas vezes por diferentes mecanismos;
- em falhas de envio, preservar contexto, dados e possibilidade de nova tentativa;
- para erros globais, fornecer resumo útil e caminho para os pontos que exigem correção.

## Web

Associar erro ao campo com mecanismos semânticos apropriados e usar regiões de status/alerta apenas quando a urgência justificar. O foco pode ir para um resumo de erros quando isso ajuda a recuperação, mas não deve saltar arbitrariamente a cada validação.

## Android

Expor mensagens de erro pelo componente e pela árvore de acessibilidade. Evitar Toast visual como único mecanismo para erros que exigem ação da pessoa. Preservar foco no controle relevante quando apropriado.

## iOS

Erros devem permanecer disponíveis no contexto do campo ou da tela. Anúncios podem complementar a interface, mas não substituir conteúdo persistente quando a pessoa precisar consultá-lo novamente.

## Exemplo conforme

```html
<label for="email">E-mail</label>
<input id="email" aria-invalid="true" aria-describedby="erro-email">
<p id="erro-email">Informe um endereço de e-mail válido, como nome@exemplo.com.</p>
```

Após uma ação concluída, uma mensagem persistente ou região de status pode informar: `Mensagem enviada com sucesso.`

## Comportamento esperado

Ao chegar ao campo, a pessoa identifica o rótulo, percebe que ele está inválido e consegue acessar a orientação de correção. No sucesso, recebe confirmação inequívoca sem perder o contexto.

## Exemplo não conforme

```html
<input class="erro">
<span class="icone-vermelho">!</span>
```

A única indicação é borda/ícone vermelho e não há mensagem associada.

## Por que falha

Quem não percebe cor ou ícone não sabe que existe erro, qual campo está afetado nem como corrigi-lo. Um leitor de tela pode anunciar apenas “edição” sem qualquer estado de invalidez ou orientação.

## Critérios de teste

- erro identifica campo, problema e correção quando possível;
- mensagem é alcançável e associada semanticamente;
- sucesso confirma o resultado real da ação;
- cor ou ícone nunca são o único indicador;
- dados permanecem preservados após falha;
- anúncios não duplicam fala nem roubam foco sem necessidade.