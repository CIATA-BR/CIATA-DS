# PAT-0001 — Formulários acessíveis

## Metadados

- **Tipo:** Padrão
- **Código:** PAT-0001
- **Versão:** 0.2.0
- **Status:** rascunho
- **Responsável:** CIATA
- **Última revisão:** 2026-07-25

## Resumo

Formulários devem permitir compreensão, preenchimento, revisão, correção e envio sem depender de visão, ponteiro preciso ou memorização. Este padrão define estrutura, estados e critérios mínimos para formulários institucionais e funciona como porta de entrada para receitas, checklists e diagnósticos relacionados.

## Mapa da família

### Receitas técnicas

- [REC-0002 — Validação acessível de formulários](../recipes/REC-0002-validacao-formularios.md)
- [REC-0003 — Upload de arquivos acessível e seguro](../recipes/REC-0003-upload-arquivos-acessivel-seguro.md)

### Checklist

- [CHECK-0102 — Validação de formulários acessíveis](../checklists/CHECK-0102-validacao-formularios-acessiveis.md)

### Base de conhecimento

- [KB-0001 — Diagnóstico de falhas de acessibilidade em formulários](../kb/KB-0001-diagnostico-falhas-acessibilidade-formularios.md)
- [KB-0002 — Erros comuns em formulários e como diagnosticá-los](../kb/KB-0002-erros-comuns-formularios.md)

### Blueprint relacionado

- [BP-0001 — Projeto Laravel institucional](../blueprints/BP-0001-projeto-laravel-institucional.md)

## Quando usar

Em cadastros, autenticação, buscas avançadas, filtros, configurações, pagamentos, uploads e qualquer fluxo que solicite dados ao usuário.

## Quando não usar

Não transformar ações simples em formulários desnecessários. Para uma única escolha imediata, prefira controles diretos e claramente identificados.

## Estrutura do padrão

1. Um título claro descreve a finalidade do formulário.
2. Cada campo possui rótulo persistente e programaticamente associado.
3. Instruções aparecem antes do campo quando necessárias.
4. Campos obrigatórios são informados em texto, não apenas por cor ou símbolo.
5. A ordem de foco acompanha a ordem lógica do conteúdo.
6. Erros são associados ao campo, resumidos no início e anunciados por tecnologia assistiva.
7. O valor informado é preservado após falha de validação, salvo quando isso criar risco de segurança.
8. O botão principal descreve a ação, como “Criar conta” ou “Salvar alterações”.
9. Operações críticas oferecem revisão ou confirmação antes da conclusão.
10. O resultado do envio é comunicado em texto e com gerenciamento adequado de foco.

## Acessibilidade

- Compatível com teclado, leitores de tela, linha Braille, ampliação e comandos por voz.
- Não usar placeholder como substituto de rótulo.
- Não depender apenas de cor, posição, ícone ou formatação visual.
- Mensagens de erro devem identificar o problema e orientar a correção.
- O foco deve ir para o resumo de erros apenas quando isso ajudar, sem apagar o contexto do usuário.
- Campos com máscara devem aceitar edição previsível, inclusive Backspace, Delete, colagem e seleção de texto.
- Autocompletar deve usar atributos semânticos adequados quando houver dados pessoais conhecidos.
- Tempo limite deve ser evitado; quando necessário, deve haver aviso e possibilidade de extensão.

## Exemplos

### Correto

- Rótulo: “Data de nascimento”
- Ajuda: “Informe no formato dia, mês e ano.”
- Erro: “Data de nascimento inválida. Verifique o dia, o mês e o ano.”

### Incorreto

- Campo identificado apenas por “DD/MM/AAAA”.
- Erro genérico “Valor inválido”.
- Campo obrigatório indicado somente por borda vermelha.

## Critérios de aceite

- [ ] Todos os campos possuem nome acessível e rótulo visível.
- [ ] A navegação completa funciona apenas com teclado.
- [ ] A sequência de foco é lógica e estável.
- [ ] Erros são específicos, vinculados aos campos e anunciados corretamente.
- [ ] O formulário preserva dados válidos após falha.
- [ ] O envio informa sucesso, falha e próximos passos.
- [ ] Foi executado teste manual com leitor de tela.
- [ ] Foi verificado uso com ampliação e contraste elevado.
- [ ] O CHECK-0102 foi concluído e as evidências foram registradas.

## Relações

- **Especificações:** SPEC-0005 — Acessibilidade
- **Decisões arquiteturais:** ADR-0003 — Acessibilidade desde a concepção
- **Checklists:** CHECK-0001 — Revisão manual de acessibilidade; CHECK-0101 — QA funcional; CHECK-0102 — Validação de formulários acessíveis
- **Playbooks:** PB-0005 — Executar validação manual de acessibilidade
- **Receitas técnicas:** REC-0002 — Validação acessível de formulários; REC-0003 — Upload de arquivos acessível e seguro
- **Base de conhecimento:** KB-0001 — Diagnóstico de falhas de acessibilidade em formulários; KB-0002 — Erros comuns em formulários e como diagnosticá-los
- **Blueprints:** BP-0001 — Projeto Laravel institucional

## Histórico

- 2026-07-25 — Criação inicial pelo CIATA.
- 2026-07-25 — Transformação em hub da família de formulários e inclusão das relações da Sprint 9.
