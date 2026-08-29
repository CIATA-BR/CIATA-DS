# Autenticação acessível

## Contrato de experiência

Autenticação deve permitir que pessoas com deficiência entrem, recuperem acesso e confirmem identidade sem depender exclusivamente de memória, percepção visual, transcrição, gesto complexo ou outro teste cognitivo inacessível.

## Regras comuns

- permita colagem em campos de usuário, senha, código e recuperação quando não houver razão de segurança comprovada em contrário;
- permita gerenciadores de senha e preenchimento automático;
- ofereça alternativa acessível para CAPTCHA ou mecanismos equivalentes;
- não exija memorizar ou transcrever informação apresentada em etapa anterior sem alternativa;
- mensagens de erro devem informar o que precisa ser corrigido sem expor credenciais;
- códigos de uso único devem poder ser recebidos, lidos e inseridos com tecnologia assistiva;
- não encerre sessões ou fluxos sem aviso e possibilidade de extensão quando aplicável;
- preserve foco e dados não sensíveis quando houver erro recuperável.

## Web

- use atributos `autocomplete` adequados, como `username`, `current-password`, `new-password` e `one-time-code` quando aplicáveis;
- não bloqueie `paste` em senha ou código;
- garanta que botões de mostrar/ocultar senha exponham nome e estado coerentes;
- CAPTCHA visual deve ter alternativa equivalente que não crie outra barreira;
- erros devem ser programaticamente associados ao campo e anunciados.

## Android

- integre autofill e credenciais da plataforma quando possível;
- não dependa de leitura visual de SMS quando APIs seguras ou autofill de OTP estiverem disponíveis;
- exponha corretamente o estado de mostrar/ocultar senha;
- teste com TalkBack, teclado, ditado e gerenciadores de senha.

## iOS

- utilize `textContentType` e APIs equivalentes para usuário, senha e códigos de uso único;
- permita Password AutoFill e serviços de credenciais;
- exponha corretamente o estado do controle de mostrar/ocultar senha;
- teste leitura e inserção de OTP com VoiceOver e AutoFill.

## Verificação

- usuário consegue autenticar sem depender de um teste cognitivo exclusivo;
- colagem e gerenciador de senhas funcionam;
- códigos de uso único podem ser percebidos e inseridos;
- mostrar/ocultar senha possui nome e estado acessíveis;
- timeout possui tratamento acessível quando aplicável;
- recuperação de conta não é menos acessível que o login principal.
