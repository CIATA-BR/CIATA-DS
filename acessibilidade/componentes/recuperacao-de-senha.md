# Recuperação de senha

## Objetivo

Garantir que redefinição e recuperação de acesso sejam compreensíveis, compatíveis com gerenciadores de senha e utilizáveis por diferentes tecnologias assistivas.

## Regras

- identificar claramente cada etapa do fluxo e o próximo passo;
- aceitar colagem em campos de senha e confirmação;
- permitir uso de gerenciadores de senha e preenchimento automático;
- comunicar requisitos de senha antes ou durante o preenchimento, sem depender apenas de cor;
- evitar regras ocultas que só aparecem após submissão;
- o controle de mostrar/ocultar senha deve possuir nome e estado claros;
- informar expiração ou invalidade do link/token e oferecer caminho de recuperação;
- após sucesso, confirmar a redefinição e indicar de forma explícita onde o usuário deve prosseguir;
- não revelar se uma conta existe quando isso conflitar com a política de segurança, mas ainda fornecer orientação útil.

## Exemplo conforme

A página informa os requisitos da nova senha antes do campo. Os campos “Nova senha” e “Confirmar nova senha” aceitam colagem e gerenciador de senhas. O botão “Mostrar senha” comunica mudança de estado. Após salvar, a mensagem diz “Senha redefinida com sucesso. Continuar para entrar”.

### Comportamento esperado

A pessoa entende o requisito, consegue inserir ou gerar a senha com as ferramentas de sua escolha, identifica erros e sabe exatamente como continuar.

## Exemplo não conforme

O campo bloqueia colagem, exige digitação manual, possui um ícone sem nome para mostrar a senha e só revela os critérios após cada tentativa recusada.

### Por que falha

A implementação cria carga cognitiva desnecessária, impede tecnologias de apoio e gerenciadores de credenciais e torna a recuperação mais difícil sem ganho real de segurança.

## Critérios mínimos de teste

- testar colagem, gerenciador de senha e preenchimento automático;
- validar mostrar/ocultar e seu estado;
- testar requisitos, divergência entre senhas e token expirado;
- confirmar foco e anúncio após erro e sucesso;
- testar continuidade até o login.