# KB-0001 — Diagnóstico de falhas de acessibilidade em formulários

## Metadados

- **Tipo:** Base de conhecimento
- **Código:** KB-0001
- **Versão:** 0.1.0
- **Status:** rascunho
- **Responsável:** CIATA
- **Última revisão:** 2026-07-25

## Problema

Um formulário parece funcionar visualmente, mas pessoas que usam teclado, leitor de tela, linha Braille, ampliação ou comandos por voz não conseguem compreender, preencher, corrigir ou enviar os dados.

## Sinais comuns

- o leitor de tela anuncia apenas “edição” ou “campo em branco”;
- o placeholder desaparece e o usuário perde a referência do campo;
- a tecla Tab percorre os controles em ordem inesperada;
- mensagens de erro aparecem visualmente, mas não são anunciadas;
- o foco retorna ao início da página após o envio;
- máscaras impedem apagar, colar ou corrigir valores;
- campos obrigatórios são indicados apenas por cor ou asterisco sem explicação;
- botões possuem nomes vagos, como “OK”, “Enviar” ou apenas um ícone.

## Diagnóstico passo a passo

1. Percorra todo o formulário usando apenas Tab, Shift + Tab, Enter, Barra de espaço e teclas de seta.
2. Confirme que cada campo possui rótulo visível e nome acessível equivalente.
3. Verifique se instruções e formatos obrigatórios são informados antes do preenchimento.
4. Envie o formulário vazio ou com valores inválidos.
5. Confirme se o erro é anunciado, associado ao campo e orienta a correção.
6. Verifique para onde o foco vai após sucesso e falha.
7. Teste edição completa de campos mascarados, incluindo Backspace, Delete, colagem e seleção.
8. Amplie a página e confirme que conteúdo e ações permanecem disponíveis sem perda de informação.
9. Teste com pelo menos um leitor de tela e registre navegador, sistema e versão.

## Causas frequentes

### Campo sem nome acessível

O elemento não possui rótulo associado, ou o rótulo foi substituído por placeholder.

**Correção:** usar rótulo persistente e associação programática nativa sempre que possível.

### Erro não anunciado

A mensagem foi inserida apenas visualmente ou longe do campo.

**Correção:** associar a mensagem ao controle, usar comunicação dinâmica com moderação e mover o foco apenas quando necessário.

### Ordem de foco incoerente

A ordem visual foi alterada por CSS ou atributos positivos de `tabindex`.

**Correção:** alinhar a ordem do DOM à leitura e evitar `tabindex` maior que zero.

### Máscara hostil

O componente reformata o valor a cada tecla e impede operações normais de edição.

**Correção:** aceitar entrada flexível, preservar posição do cursor e validar no servidor.

### Botão sem finalidade clara

O controle possui somente um ícone ou texto genérico.

**Correção:** usar nome que descreva a ação e seu resultado.

## Evidências a registrar

- página ou rota;
- campo afetado;
- passos de reprodução;
- resultado esperado e observado;
- tecnologia assistiva, navegador e sistema;
- gravação ou captura quando útil;
- impacto sobre conclusão da tarefa;
- gravidade e recomendação.

## Critério de resolução

A falha está resolvida quando a tarefa pode ser concluída com teclado e tecnologia assistiva, os rótulos e erros são compreensíveis, o foco permanece previsível e nenhum dado válido é perdido sem justificativa.

## Relações

- **Padrões:** PAT-0001 — Formulários acessíveis
- **Especificações:** SPEC-0005 — Acessibilidade
- **Checklists:** CHECK-0001 — Revisão manual de acessibilidade; CHECK-0101 — QA funcional
- **Playbooks:** PB-0005 — Executar validação manual de acessibilidade

## Histórico

- 2026-07-25 — Criação inicial pelo CIATA.