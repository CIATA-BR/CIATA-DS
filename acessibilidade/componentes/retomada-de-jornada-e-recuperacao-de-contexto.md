# Retomada de jornada e recuperação de contexto

## Objetivo

Permitir que a pessoa retome uma tarefa após interrupção, erro, navegação para outra tela ou expiração de sessão sem precisar reconstruir contexto desnecessariamente.

## Regras

- preservar dados já informados sempre que segurança e integridade permitirem;
- após retorno, posicionar foco em ponto lógico e previsível;
- informar claramente o que foi preservado, o que precisa ser refeito e por quê;
- etapas de fluxo devem manter título e progresso compreensíveis;
- links de retorno devem identificar destino e contexto;
- não reiniciar uma jornada inteira por erro localizado quando for possível corrigir apenas a etapa afetada;
- quando sessão expirar, após autenticação permitir retorno seguro ao ponto anterior quando apropriado.

## Exemplo conforme

```html
<h1>Cadastro — etapa 2 de 3</h1>
<p>Seus dados da etapa 1 foram preservados.</p>
<a href="/cadastro/etapa-1">Revisar dados pessoais</a>
```

### Comportamento esperado

Ao retornar, a pessoa entende em que ponto está, quais dados continuam válidos e qual ação pode executar em seguida.

## Exemplo não conforme

Após um erro de upload, redirecionar silenciosamente para o início do cadastro com todos os campos vazios.

### Por que falha

Há perda de contexto e de dados, aumento de carga cognitiva e risco de abandono da jornada.

## Validação mínima

1. interromper e retomar fluxos em diferentes etapas;
2. verificar preservação de valores e mensagens;
3. confirmar foco após retorno e autenticação;
4. validar títulos, progresso e ação seguinte com leitor de tela;
5. testar erros localizados sem reinício desnecessário da jornada.
