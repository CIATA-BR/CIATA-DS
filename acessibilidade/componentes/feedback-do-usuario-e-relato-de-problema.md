# Feedback do usuário e relato de problema

## Objetivo

Permitir que a pessoa relate dificuldade, barreira de acessibilidade ou comportamento inesperado de forma simples, rastreável e sem exigir conhecimento técnico.

## Regras

- o canal de feedback deve ser localizável e possuir nome acessível claro;
- não exigir classificação técnica, critério WCAG ou terminologia especializada da pessoa usuária;
- permitir descrição livre do problema e, quando possível, captura opcional de contexto técnico não sensível;
- informar antes do envio quais dados serão coletados;
- nunca coletar automaticamente senhas, tokens, conteúdo de campos sensíveis ou informações privadas desnecessárias;
- confirmação de envio deve ser persistente e fornecer protocolo quando houver;
- erros no próprio formulário de feedback devem seguir o padrão canônico de formulários e erros;
- quando houver anexo, aplicar o padrão de upload acessível.

## Exemplo conforme

```html
<label for="problema">Conte o que aconteceu</label>
<textarea id="problema" name="problema"></textarea>
<label>
  <input type="checkbox" name="contexto-tecnico">
  Incluir informações técnicas básicas do dispositivo e navegador
</label>
<button type="submit">Enviar relato</button>
```

### Comportamento esperado

A pessoa consegue explicar a barreira com suas próprias palavras, entende o que será enviado e recebe confirmação clara após o envio.

## Exemplo não conforme

Exigir que a pessoa escolha obrigatoriamente um critério WCAG e informe manualmente versão de navegador, leitor de tela e sistema antes de poder relatar o problema.

### Por que falha

Transfere para a pessoa usuária uma responsabilidade técnica desnecessária e pode impedir justamente quem encontrou a barreira de registrar o problema.

## Validação mínima

1. localizar e abrir o canal por teclado e leitor de tela;
2. enviar relato sem preencher informação técnica opcional;
3. verificar transparência sobre dados coletados;
4. testar erros e confirmação de envio;
5. validar anexos e protocolo quando aplicáveis.
