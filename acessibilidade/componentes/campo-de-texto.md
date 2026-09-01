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

## Exemplos práticos

### Conforme

```html
<label for="email">E-mail</label>
<input id="email" name="email" type="email" autocomplete="email">
```

**Comportamento esperado:** ao chegar ao campo, o leitor de tela anuncia algo equivalente a `E-mail, campo de edição`, seguido do valor quando houver. O rótulo continua disponível mesmo depois que o usuário digita.

Exemplo com erro associado:

```html
<label for="cpf">CPF</label>
<input id="cpf" aria-invalid="true" aria-describedby="erro-cpf">
<p id="erro-cpf">Informe um CPF válido com 11 dígitos.</p>
```

**Comportamento esperado:** o campo é identificado como inválido e a mensagem de erro permanece relacionada a ele, sem depender apenas de cor ou de um aviso visual distante.

### Não conforme

```html
<input type="text" placeholder="E-mail">
```

**Por que falha:** o placeholder pode desaparecer durante a digitação e não constitui rótulo persistente. A pessoa pode perder a referência sobre qual dado está editando.

Outro erro recorrente é exibir `Campo obrigatório` apenas em vermelho ao lado do campo, sem associação programática.

**Por que falha:** o erro pode não ser anunciado quando o campo recebe foco e a informação depende de percepção visual e proximidade espacial.

## Critérios de teste

- rótulo é anunciado antes do valor;
- conteúdo pode ser digitado, editado, selecionado, copiado e colado;
- erro é associado ao campo e anunciado sem roubar foco indevidamente;
- máscara não cria caracteres fantasma ou reposicionamento imprevisível do cursor;
- autocomplete e gerenciador de senhas funcionam quando aplicáveis;
- aumento de texto não corta label, erro ou conteúdo essencial.
