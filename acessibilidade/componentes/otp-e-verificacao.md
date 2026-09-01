# OTP e verificação

## Objetivo

Garantir que códigos de verificação, autenticação em duas etapas e mecanismos equivalentes sejam utilizáveis sem exigir transcrição visual, memória excessiva ou precisão desnecessária.

## Regras

- permitir colar o código quando o fluxo e a política de segurança permitirem;
- aceitar preenchimento automático e recursos nativos de one-time code;
- não dividir o código em vários campos sem necessidade;
- se houver campos separados, a navegação deve ser previsível e a exclusão não pode aprisionar o foco;
- informar validade e possibilidade de reenvio sem depender apenas de cor ou contagem visual;
- o botão de reenviar deve comunicar indisponibilidade temporária e quando ficará disponível;
- erros devem indicar código inválido, expirado ou já utilizado sem expor dados sensíveis;
- oferecer método alternativo de verificação quando previsto pelo produto.

## Exemplo conforme

Um único campo rotulado “Código de verificação” aceita colagem e preenchimento automático. Abaixo dele, o texto informa “Código válido por 10 minutos”. O botão “Reenviar código” fica indisponível por 30 segundos e seu estado é comunicado semanticamente.

### Comportamento esperado

A pessoa pode receber o código por um canal suportado, inserir ou colar o valor sem obstáculos e compreender claramente expiração, erro e reenvio.

## Exemplo não conforme

Seis campos visuais recebem um dígito cada, bloqueiam colagem, mudam foco automaticamente de forma inconsistente e o leitor de tela anuncia apenas “editar” em cada posição.

### Por que falha

O fluxo aumenta carga cognitiva, dificulta uso com leitor de tela, voz, Braille e gerenciadores de credenciais, e pode tornar a autenticação impossível sem benefício proporcional.

## Critérios mínimos de teste

- testar digitação, colagem e preenchimento automático;
- validar navegação e correção do código;
- testar código inválido, expirado e reenvio;
- verificar anúncio de estado e prazo;
- validar método alternativo quando existir.