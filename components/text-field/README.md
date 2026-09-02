# CMP-0002 — TextField / Campo de texto

Status das implementações desta pasta: **experimental**.

A especificação canônica está em `spec.md`. As implementações não devem divergir do contrato de nome, descrição, erro, foco, teclado, estado, autocomplete, escala e validação definido ali.

## Web

Arquivos:

- `web/text-field.css`
- `web/text-field.js`

Princípios:

- usar `input` ou `textarea` nativos;
- manter `label` visual persistente associado por `for`/`id`;
- não usar placeholder como único nome do campo;
- associar ajuda e erro por `aria-describedby`;
- usar `aria-invalid="true"` somente quando houver erro atual;
- `aria-errormessage` pode complementar a associação, mas não é a única fonte da mensagem;
- não anunciar erro a cada caractere por padrão;
- `readonly`, `disabled` e `required` mantêm semânticas distintas;
- preservar seleção, copiar/colar, ditado e recursos nativos do navegador;
- manter `autocomplete`, `inputmode` e `type` coerentes com a finalidade do campo.

### Validação

`setCiataFieldError` permite atualizar o estado de erro sem mover foco. O parâmetro `announce` deve ser usado somente quando o contexto justificar anúncio imediato, por exemplo após tentativa de envio ou validação concluída. Evite transformar validação durante digitação em uma sequência de regiões `alert`.

### Senha

`bindCiataPasswordToggle` mantém um botão real para Mostrar/Ocultar senha, atualiza `aria-pressed`, preserva o nome explícito da ação e devolve foco ao campo após a alteração do tipo.

## Laravel

`laravel/text-field.blade.php` é uma implementação Blade de referência. Ela exige `id`, `name` e `label` explícitos e aceita propriedades como `help`, `error`, `required`, `readonly`, `disabled`, `autocomplete`, `inputmode`, `maxlength` e `multiline`.

Exemplo:

```blade
<x-ciata.text-field
    id="email"
    name="email"
    label="E-mail"
    type="email"
    autocomplete="email"
    inputmode="email"
    :required="true"
    help="Usaremos este endereço para acesso à conta."
    :error="$errors->first('email')"
/>
```

Para CPF, telefone, CEP e datas, a máscara deve ser uma camada de entrada e apresentação. Não deve impedir colagem, apagar caracteres inesperadamente, reposicionar o cursor de forma arbitrária nem substituir validação real no servidor.

## Testes mínimos antes de estabilidade

- label e descrição anunciados corretamente;
- required/optional compreensíveis;
- erro associado e anunciado no momento correto;
- foco preservado após erro;
- readonly e disabled distintos;
- teclado e navegação por Tab;
- zoom e reflow;
- JAWS e NVDA na Web;
- contraste e foco em temas claro/escuro;
- forced colors/alto contraste quando aplicável;
- autofill/autocomplete;
- colagem e seleção;
- senha com Mostrar/Ocultar;
- textarea e maxlength;
- máscaras testadas com leitor de tela sem anúncios caóticos.

A implementação só deve ser promovida para estável após evidências reais de validação, seguindo o mesmo processo usado pelo CMP-0001 Button.
