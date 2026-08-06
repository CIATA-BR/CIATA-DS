# CHECK-0102 — Validação de formulários acessíveis

## Metadados

- **Tipo:** Checklist
- **Código:** CHECK-0102
- **Versão:** 0.2.0
- **Status:** rascunho
- **Responsável:** CIATA
- **Última revisão:** 2026-08-04

## Objetivo

Verificar se um formulário pode ser compreendido, preenchido, corrigido e enviado por diferentes pessoas e tecnologias assistivas.

## Estrutura e linguagem

- [ ] O título comunica claramente a finalidade do formulário.
- [ ] Cada campo possui rótulo visível, persistente e programaticamente associado.
- [ ] Placeholder não substitui rótulo.
- [ ] Instruções aparecem antes da ação que dependem delas.
- [ ] Campos obrigatórios são indicados em texto, não apenas por cor ou símbolo.
- [ ] Botões usam nomes que descrevem a ação, como “Salvar alterações”.

## Teclado e foco

- [ ] Todos os controles funcionam apenas com teclado.
- [ ] A ordem de foco acompanha a sequência lógica.
- [ ] O foco permanece visível e não fica preso.
- [ ] Falhas de validação não provocam saltos repetidos de foco.
- [ ] O resumo de erros permite chegar ao campo correspondente.
- [ ] O sucesso move o foco somente quando há mudança relevante de contexto.
- [ ] Após editar um item ou usuário, o fluxo retorna à listagem correspondente ou ao contexto pai que apresenta seus subitens.
- [ ] A listagem de destino identifica o recurso atualizado e anuncia o resultado em texto.

## Erros e validação

- [ ] Cada erro identifica o campo, o problema e a forma de correção.
- [ ] A mensagem está programaticamente associada ao campo.
- [ ] O estado inválido é exposto à tecnologia assistiva.
- [ ] Há resumo de erros quando múltiplos problemas exigem visão geral.
- [ ] Dados válidos permanecem preenchidos após falha.
- [ ] A validação no servidor repete as regras críticas.
- [ ] Mensagens não são disparadas de forma excessiva a cada caractere.

## Entrada e edição

- [ ] Colagem, seleção, Backspace e Delete funcionam previsivelmente.
- [ ] Máscaras não impedem correção parcial nem leitura em Braille.
- [ ] Datas, documentos e telefones incluem exemplo de formato quando necessário.
- [ ] Autocompletar semântico é usado para dados conhecidos.
- [ ] Campos dependentes informam mudanças de estado e disponibilidade.

## Uploads

- [ ] Formatos e tamanho máximo são informados antes da seleção.
- [ ] O nome do arquivo selecionado aparece em texto.
- [ ] É possível substituir ou remover o arquivo pelo teclado.
- [ ] Progresso, sucesso e falha possuem mensagens textuais.
- [ ] Arquivos privados não possuem endereço público direto.

## Testes manuais

- [ ] O fluxo completo foi executado com leitor de tela.
- [ ] O fluxo completo foi executado apenas com teclado.
- [ ] Foi verificado comportamento com ampliação e contraste elevado.
- [ ] Foi conferida a leitura em linha Braille quando disponível.
- [ ] Foram testados envio vazio, dados inválidos, correção e sucesso.
- [ ] Foram testadas falha de rede e sessão expirada quando aplicável.

## Evidências

Registrar ambiente, tecnologia assistiva, versão, cenários testados, resultados e pendências. Não declarar aprovação apenas com testes automatizados.

## Relações

- **Padrões:** PAT-0001 — Formulários acessíveis
- **Receitas técnicas:** REC-0002 — Validação acessível de formulários; REC-0003 — Upload de arquivos acessível e seguro
- **Especificações:** SPEC-0005 — Acessibilidade
- **Playbooks:** PB-0005 — Executar validação manual de acessibilidade

## Histórico

- 2026-07-25 — Criação inicial pelo CIATA.
- 2026-08-04 — Inclusão da verificação de retorno após edição administrativa.
