# Conteúdo sensível a tempo

## Contrato

Conteúdos e tarefas com limite de tempo devem tornar duração, prazo, contagem regressiva e consequências compreensíveis sem depender de percepção visual contínua, além de oferecer extensão, pausa ou recuperação quando aplicável.

## Regras

- comunicar prazo ou duração de forma textual e programaticamente perceptível;
- não usar apenas animação, cor ou redução visual de barra para indicar tempo restante;
- evitar anúncios a cada segundo ou atualização excessiva que interrompa leitor de tela;
- quando houver limite ajustável, permitir extensão, pausa ou desativação conforme o contexto e os requisitos aplicáveis;
- avisar com antecedência suficiente antes de expiração de sessão ou perda de dados;
- preservar dados quando a sessão expirar sempre que tecnicamente possível;
- em códigos temporários, informar validade e permitir nova solicitação de forma acessível;
- usar datas e horários sem ambiguidade e respeitar localização/fuso quando relevante.

## Exemplo conforme

Uma sessão prestes a expirar apresenta `Sua sessão termina em 2 minutos` e oferece os botões `Continuar sessão` e `Sair agora`. O aviso é anunciado uma vez sem mover o foco.

### Comportamento esperado

A pessoa recebe tempo suficiente para decidir e consegue estender a sessão pelo mesmo mecanismo de entrada que já utiliza.

## Exemplo não conforme

Uma barra vermelha diminui no topo da tela e, ao chegar a zero, o formulário é descartado sem aviso textual ou opção de extensão.

### Por que falha

O prazo depende de percepção visual contínua e a consequência pode ocorrer sem que a pessoa saiba que havia um limite de tempo, levando à perda de dados e interrupção da jornada.

## Critérios de teste

- prazo e consequência são compreensíveis sem visão;
- avisos não geram fala repetitiva excessiva;
- extensão ou pausa funciona quando aplicável;
- foco não é roubado pelo aviso;
- dados são preservados ou recuperação é oferecida quando possível;
- datas, horários e duração são anunciados sem ambiguidade.