# CMP-0002 — TextField / Campo de texto — Flutter

Status: experimental.

Esta implementação usa `TextFormField` nativo e segue o contrato de `components/text-field/spec.md`.

## Decisões de acessibilidade

- label persistente via `InputDecoration.labelText`;
- `readOnly` permanece distinto de `enabled=false`;
- ajuda e erro usam `helperText` e `errorText`;
- senha usa `obscureText` e ação textual `Mostrar`/`Ocultar`;
- `keyboardType`, `textInputAction` e `autofillHints` ficam expostos ao consumidor;
- multiline usa `minLines`/`maxLines`;
- a implementação preserva seleção, colagem, cursor, ditado e text scaling do Flutter;
- placeholder não substitui label;
- máscaras de CPF, telefone, CEP e datas não fazem parte do widget base;
- validação não deve anunciar erro a cada caractere por padrão.

## Exemplo

```dart
final controller = TextEditingController();

CiataTextField(
  controller: controller,
  label: 'E-mail',
  requiredField: true,
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.next,
  autofillHints: const [AutofillHints.email],
  helpText: 'Use o endereço que você acessa com frequência.',
)
```

Para senha:

```dart
CiataTextField(
  controller: passwordController,
  label: 'Senha',
  password: true,
  requiredField: true,
  autofillHints: const [AutofillHints.password],
)
```

## Validação mínima antes de estável

Validar em Android e iOS reais com:

- TalkBack;
- VoiceOver;
- text scaling;
- teclado externo quando aplicável;
- autofill;
- seleção/copiar/colar;
- senha e Mostrar/Ocultar;
- multiline;
- `readOnly`;
- `enabled=false`;
- ajuda e erro;
- temas claro e escuro.

## Limitações atuais

- tokens CIATA específicos do componente ainda não estão conectados à implementação Flutter;
- máscara automática não é fornecida pelo widget base;
- critérios de anúncio de erro continuam responsabilidade do fluxo de validação da aplicação consumidora.
