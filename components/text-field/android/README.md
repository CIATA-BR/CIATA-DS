# CMP-0002 — TextField Android / Jetpack Compose

Implementação experimental do contrato canônico `CMP-0002 — TextField / Campo de texto` para Android com Jetpack Compose e Material 3.

## Princípios

- usa `OutlinedTextField` nativo;
- mantém label persistente;
- `required`, `readOnly` e `enabled` são conceitos distintos;
- `errorText` substitui `helpText` enquanto houver erro;
- `isError` comunica o estado visual/semântico da plataforma;
- senha usa `PasswordVisualTransformation` e uma ação textual `Mostrar`/`Ocultar`;
- `KeyboardOptions` fica exposto para teclado, ação IME e finalidade de entrada adequados;
- não executa validação agressiva a cada caractere;
- não impõe máscara automática no componente base.

## Exemplo

```kotlin
CiataTextField(
    value = email,
    onValueChange = { email = it },
    label = "E-mail",
    required = true,
    helpText = "Use um endereço que você consulte com frequência.",
    errorText = emailError,
    keyboardOptions = KeyboardOptions(
        keyboardType = KeyboardType.Email,
        imeAction = ImeAction.Next,
    ),
)
```

## Senha

Ao usar `password = true`, o valor começa oculto. A ação textual adjacente muda entre `Mostrar` e `Ocultar`, mantendo um alvo nativo separado e compreensível para TalkBack e para pessoas com necessidades cognitivas.

## Readonly e disabled

- `readOnly = true`: o campo continua navegável e seu valor pode ser consultado, mas não editado;
- `enabled = false`: usa o estado desabilitado nativo do Material/Compose.

Não use `enabled = false` apenas para representar somente leitura.

## Erros

A implementação recebe `errorText` como estado da aplicação. A decisão de quando validar pertence ao fluxo consumidor. Prefira validar ao sair do campo, ao avançar ou ao enviar o formulário quando isso reduzir interrupções. Evite trocar a mensagem de erro a cada tecla.

## Máscaras

CPF, telefone, CEP e datas não recebem máscara automática nesta implementação base. Uma transformação visual ou lógica específica deve ser validada quanto a cursor, seleção, colagem, TalkBack e edição antes de ser incorporada ao DS.

## Autofill e finalidade de entrada

A versão inicial expõe `KeyboardOptions`. Integrações com autofill/content type devem seguir a API vigente da versão de Compose adotada pelo aplicativo consumidor e ser testadas no produto real antes de virar contrato estável do DS.

## Validação mínima antes de estabilidade

Validar em dispositivo Android real:

- TalkBack com label, ajuda e erro;
- required, readOnly e disabled;
- senha e ação Mostrar/Ocultar;
- multiline;
- teclado e IME adequados;
- seleção, copiar/colar e ditado quando disponível;
- font scaling;
- temas claro e escuro;
- erro sem perda inesperada de foco;
- navegação por teclado físico quando aplicável.

Status: **experimental**.
