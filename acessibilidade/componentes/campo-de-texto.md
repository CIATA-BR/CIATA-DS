# Campo de texto

## Contrato

Campo de texto deve permitir entrada, edição e revisão de conteúdo com rótulo persistente, instruções e estado acessíveis.

## Regras

- todo campo deve possuir rótulo persistente associado programaticamente;
- placeholder não substitui rótulo;
- instruções de formato devem ser disponibilizadas antes ou junto do campo;
- obrigatório, inválido, somente leitura e desabilitado devem ser expostos semanticamente;
- erros devem identificar o problema e como corrigir;
- máscara não pode impedir edição, seleção, colagem ou uso de tecnologia assistiva;
- não bloquear colagem, preenchimento automático ou gerenciadores de senha sem necessidade legítima e alternativa acessível;
- alterações automáticas não devem apagar dados ou mover foco inesperadamente.

## Web

Preferir `<input>`, `<textarea>` e associação por `<label>`. Usar `autocomplete`, `inputmode`, `aria-describedby` e estados ARIA apenas quando apropriado. Mensagens de erro devem permanecer associadas ao campo.

## Android

Preferir componentes de entrada nativos ou equivalentes do toolkit. Garantir que label, valor, erro, dica e estado sejam expostos na semântica. Campos customizados devem anunciar composição e edição sem duplicação.

## iOS

Preferir controles nativos de entrada. Garantir label, valor, hint quando necessário e traits/estado coerentes. A navegação por rotor e a edição com VoiceOver devem continuar previsíveis.

## Critérios de teste

- rótulo é anunciado antes do valor;
- conteúdo pode ser digitado, editado, selecionado, copiado e colado;
- erro é associado ao campo e anunciado sem roubar foco indevidamente;
- máscara não cria caracteres fantasma ou reposicionamento imprevisível do cursor;
- autocomplete e gerenciador de senhas funcionam quando aplicáveis;
- aumento de texto não corta label, erro ou conteúdo essencial.
