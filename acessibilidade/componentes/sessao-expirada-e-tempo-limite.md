# Sessão expirada e tempo limite

## Objetivo

Garantir que expiração de sessão, inatividade e limites de tempo sejam comunicados de forma previsível, compreensível e recuperável, sem perda desnecessária de contexto ou dados.

## Regras

- avisar antes da expiração quando houver tempo suficiente para ação do usuário;
- informar claramente quanto tempo resta e qual ação evita a expiração;
- permitir extensão de sessão quando o requisito de segurança permitir;
- não depender apenas de contagem regressiva visual;
- preservar dados não sensíveis já preenchidos quando tecnicamente possível;
- ao expirar, explicar o que aconteceu e como retomar a jornada;
- não mover foco repetidamente durante a contagem regressiva;
- anúncios de tempo devem ser proporcionais para não interromper continuamente o leitor de tela.

## Exemplo conforme

Uma sessão com 2 minutos restantes exibe e anuncia uma única mensagem: “Sua sessão expira em 2 minutos. Ative Continuar sessão para permanecer conectado.” O botão “Continuar sessão” recebe foco apenas se o usuário navegar até ele. Ao estender, a confirmação é anunciada sem perda de contexto.

### Comportamento esperado

A pessoa recebe informação suficiente para decidir o que fazer, pode estender a sessão por teclado ou tecnologia assistiva e continua do ponto onde estava.

## Exemplo não conforme

A interface mostra apenas uma contagem regressiva visual. Nos últimos 30 segundos, o sistema envia um anúncio a cada segundo e, ao expirar, redireciona para login apagando todo o formulário em andamento.

### Por que falha

A informação temporal não é equivalente para todas as pessoas, os anúncios excessivos interrompem a navegação e a perda de dados cria barreira desproporcional.

## Critérios mínimos de teste

- validar aviso prévio com leitor de tela e teclado;
- verificar extensão de sessão e confirmação;
- testar expiração real e retorno ao fluxo;
- verificar preservação de dados permitidos;
- garantir que o foco não seja roubado pela contagem regressiva.