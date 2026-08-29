# Botão

## Contrato

Botão representa uma ação. Deve expor nome acessível, função de botão e estado quando houver variação como pressionado, expandido, desabilitado ou carregando.

## Regras

- usar elemento/controle nativo de botão sempre que possível;
- o nome deve indicar a ação resultante, por exemplo `Salvar`, `Enviar mensagem` ou `Continuar para pagamento`;
- não repetir a palavra "botão" dentro do nome acessível quando a plataforma já anuncia a função;
- botões apenas com ícone precisam de nome acessível equivalente à ação;
- estado desabilitado deve estar disponível à tecnologia assistiva e visualmente distinguível sem depender apenas de cor;
- estado de carregamento não deve remover silenciosamente o contexto do controle;
- botões de alternância devem expor estado pressionado/selecionado apropriado;
- a ativação não deve depender exclusivamente de gesto complexo.

## Web

Preferir `<button>`. Não substituir por `div` ou `span` clicável. Enter e Espaço devem funcionar conforme a convenção nativa. Para botões de alternância, usar o estado ARIA adequado apenas quando necessário.

## Android

Preferir componentes nativos ou equivalentes do toolkit utilizado, expondo conteúdo descritivo, papel e estado pelo sistema de semântica da plataforma. Não transformar texto estático em controle clicável sem semântica de botão.

## iOS

Preferir controles nativos e traits coerentes com botão. Estados como selecionado ou desabilitado devem ser expostos pelo mecanismo de acessibilidade da plataforma, sem concatenar manualmente informações que o VoiceOver já fornece.

## Critérios de teste

- o leitor de tela anuncia nome e função corretos;
- Enter/Espaço ou gesto equivalente ativam o controle;
- foco é visível e não se perde após ativação;
- estado desabilitado impede ação e é anunciado;
- botão de alternância comunica mudança de estado;
- ícone sem texto continua compreensível fora do contexto visual.
