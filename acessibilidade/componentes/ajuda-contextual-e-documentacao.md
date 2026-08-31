# Ajuda contextual e documentação

## Objetivo

Garantir que orientação e documentação estejam disponíveis no ponto em que a dúvida acontece, sem exigir que a pessoa abandone a jornada ou dependa de exploração visual.

## Regras

- ajuda contextual deve estar próxima do controle ou etapa a que se refere;
- o controle que abre ajuda deve possuir nome acessível específico;
- abrir ajuda não deve mover foco de forma inesperada;
- quando a ajuda abrir em diálogo ou painel, aplicar o contrato de foco correspondente;
- instruções essenciais não devem existir apenas dentro de tooltip;
- documentação externa deve informar destino quando isso não for óbvio;
- exemplos devem refletir a interface atual e evitar instruções exclusivamente espaciais como “clique no botão à direita”.

## Exemplo conforme

```html
<label for="cpf">CPF</label>
<input id="cpf" aria-describedby="ajuda-cpf">
<p id="ajuda-cpf">Informe 11 dígitos, somente números.</p>
<button type="button">Mais ajuda sobre CPF</button>
```

### Comportamento esperado

A instrução essencial é lida em associação ao campo. A ajuda adicional permanece opcional e pode ser aberta sem perder o contexto atual.

## Exemplo não conforme

```html
<input placeholder="CPF">
<span title="Digite seu CPF sem pontuação">?</span>
```

### Por que falha

A instrução depende de placeholder e tooltip, pode não ser encontrada por teclado ou leitor de tela e não fica persistentemente associada ao campo.

## Validação mínima

1. navegar até a ajuda com teclado e leitor de tela;
2. confirmar associação entre instrução e controle;
3. verificar foco ao abrir e fechar ajuda adicional;
4. confirmar que orientação essencial continua disponível sem tooltip;
5. revisar instruções com zoom, texto ampliado e diferentes tamanhos de tela.
