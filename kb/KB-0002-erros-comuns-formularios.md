# KB-0002 — Erros comuns em formulários e como diagnosticá-los

## Metadados

- **Tipo:** Base de conhecimento
- **Código:** KB-0002
- **Versão:** 0.1.0
- **Status:** rascunho
- **Responsável:** CIATA
- **Última revisão:** 2026-07-25

## Resumo

Este artigo reúne sintomas recorrentes em formulários, causas prováveis, formas de diagnóstico e correções seguras. Deve ser usado durante desenvolvimento, revisão e suporte.

## Diagnóstico rápido

### O leitor de tela anuncia apenas “edição”

**Causas prováveis**

- campo sem rótulo associado;
- rótulo visual implementado como texto sem relação programática;
- nome acessível sobrescrito por conteúdo vazio.

**Como verificar**

1. Navegue até o campo pelo leitor de tela.
2. Confira nome, função, estado e instrução anunciados.
3. Inspecione a relação entre rótulo e controle.

**Correção**

Usar rótulo persistente e associação semântica nativa. Evitar nome acessível duplicado ou vazio.

### O erro aparece na tela, mas não é anunciado

**Causas prováveis**

- mensagem não vinculada ao campo;
- região dinâmica ausente ou mal configurada;
- atualização visual sem mudança semântica.

**Correção**

Associar a mensagem ao controle e usar anúncio dinâmico somente para o retorno necessário. O usuário deve conseguir reencontrar o erro navegando normalmente.

### O foco volta ao início após enviar

**Causas prováveis**

- página reconstruída sem estratégia de foco;
- redirecionamento para a mesma rota sem âncora lógica;
- componente remontado com identificadores instáveis.

**Correção**

Definir destino de foco conforme o resultado: resumo de erros, título da confirmação ou primeiro conteúdo relevante. Preservar chaves e identificadores estáveis.

### Backspace não corrige campo com máscara

**Causas prováveis**

- máscara reescreve o valor inteiro a cada tecla;
- cursor reposicionado automaticamente;
- separadores tratados como conteúdo imutável.

**Correção**

Permitir edição parcial, seleção, colagem, Backspace e Delete. Preferir normalização após a entrada em vez de disputar o cursor durante a digitação.

### Dados desaparecem depois de um erro

**Causas prováveis**

- formulário recriado sem reaproveitar valores aceitos;
- falha de sessão;
- limpeza genérica aplicada a todos os campos.

**Correção**

Preservar valores válidos, exceto segredos que precisem ser descartados. Informar claramente quando a sessão expirar.

### Upload funciona com mouse, mas não com teclado

**Causas prováveis**

- área de arrastar e soltar usada como única interface;
- elemento genérico com evento de clique;
- campo nativo ocultado de forma inacessível.

**Correção**

Oferecer controle nativo ou botão semântico associado e manter nome, estado e arquivo selecionado disponíveis em texto.

## Coleta de evidências

Registrar:

- página e etapa do fluxo;
- navegador, sistema e versão;
- leitor de tela ou tecnologia assistiva;
- sequência exata de teclas e ações;
- resultado esperado e observado;
- mensagem recebida;
- presença de perda de dados ou bloqueio do fluxo.

Não incluir senhas, tokens, documentos completos ou arquivos pessoais nas evidências.

## Quando escalar

Escalar para revisão técnica quando houver perda de dados, falha de autorização, divergência entre cliente e servidor ou comportamento dependente de estado. Escalar para revisão de acessibilidade quando nome, foco, anúncio, teclado ou Braille impedirem o fluxo.

## Relações

- **Padrões:** PAT-0001 — Formulários acessíveis
- **Receitas técnicas:** REC-0002 — Validação acessível de formulários; REC-0003 — Upload de arquivos acessível e seguro
- **Checklists:** CHECK-0102 — Validação de formulários acessíveis
- **Playbooks:** PB-0005 — Executar validação manual de acessibilidade

## Histórico

- 2026-07-25 — Criação inicial pelo CIATA.
