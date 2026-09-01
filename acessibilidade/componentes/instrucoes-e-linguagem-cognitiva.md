# Instruções e linguagem cognitiva

## Contrato

Instruções, rótulos e mensagens devem reduzir ambiguidade, antecipar consequências importantes e apoiar pessoas com diferentes níveis de atenção, memória, compreensão e experiência digital.

## Regras

- usar linguagem direta, específica e consistente;
- preferir verbos que indiquem a ação real e, quando útil, o destino ou resultado;
- evitar instruções dependentes de posição, cor, forma ou memória de etapas anteriores;
- apresentar requisitos antes da ação quando possível, não apenas depois do erro;
- dividir tarefas longas em etapas compreensíveis e manter indicação de progresso quando relevante;
- não trocar termos para o mesmo conceito ao longo do fluxo;
- evitar abreviações, jargão e mensagens vagas quando não forem necessários;
- confirmar ações destrutivas ou de alto impacto com contexto suficiente;
- permitir revisão e correção antes de envio definitivo quando a tarefa justificar.

## Exemplo conforme

Em um cadastro dividido em etapas, o botão final da primeira etapa é nomeado `Continuar para endereço`, em vez de apenas `Continuar`.

### Comportamento esperado

A pessoa entende antecipadamente o que ocorrerá após a ativação, inclusive ao navegar somente pela lista de controles do leitor de tela.

## Exemplo não conforme

Uma sequência de telas usa repetidamente botões chamados apenas `Continuar`, sem título de etapa, progresso ou indicação do próximo conteúdo.

### Por que falha

A pessoa precisa manter mentalmente o contexto da jornada para entender o efeito do controle. Isso aumenta carga cognitiva e pode tornar a navegação por controles isolados ambígua.

## Critérios de teste

- ações são compreensíveis fora do contexto visual imediato;
- instruções não dependem de cor ou posição;
- termos permanecem consistentes ao longo do fluxo;
- requisitos aparecem antes da submissão quando possível;
- ações destrutivas comunicam claramente consequência e objeto afetado;
- jornadas longas oferecem contexto suficiente de etapa e progresso.