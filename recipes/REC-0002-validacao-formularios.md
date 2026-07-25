# REC-0002 — Validação acessível de formulários

## Metadados

- **Tipo:** Receita técnica
- **Código:** REC-0002
- **Versão:** 0.1.0
- **Status:** rascunho
- **Responsável:** CIATA
- **Última revisão:** 2026-07-25

## Objetivo

Implementar validação de formulários que identifique o problema, preserve os dados válidos e oriente a correção sem depender de cor, posição visual ou tentativa e erro.

## Quando usar

Em qualquer formulário com regras obrigatórias, formatos específicos, dependência entre campos ou validação no servidor.

## Ingredientes técnicos

- validação no cliente para retorno imediato;
- validação obrigatória no servidor;
- identificadores estáveis para campos e mensagens;
- mecanismo de anúncio acessível;
- testes com teclado e leitor de tela.

## Receita

1. Defina uma regra única para cada campo e compartilhe-a entre cliente e servidor quando possível.
2. Associe cada mensagem ao campo correspondente por semântica programática.
3. Marque o estado inválido no controle somente após tentativa de envio ou interação concluída.
4. Escreva mensagens específicas, como “CPF deve conter 11 dígitos”, evitando “Valor inválido”.
5. Exiba um resumo de erros no início quando houver múltiplos problemas.
6. Transforme cada item do resumo em link ou controle que mova o foco para o campo relacionado.
7. Preserve valores válidos após falha, exceto segredos que não devam ser reapresentados.
8. Ao corrigir um campo, remova o estado de erro sem apagar outros avisos.
9. No sucesso, anuncie o resultado e mova o foco apenas quando houver mudança relevante de contexto.

## Validação

- enviar o formulário vazio e conferir mensagens específicas;
- navegar apenas com teclado até cada erro;
- confirmar leitura do rótulo, estado inválido, ajuda e mensagem pelo leitor de tela;
- testar colagem, Backspace, Delete e correção parcial;
- confirmar que a validação do servidor rejeita dados manipulados no cliente.

## Erros comuns

### Foco salta para lugar inesperado

- **Causa provável:** foco movido a cada erro individual.
- **Correção:** mover uma única vez para o resumo ou primeiro erro, conforme o contexto.

### Leitor de tela anuncia apenas “inválido”

- **Causa provável:** mensagem não associada ao campo.
- **Correção:** ligar programaticamente o controle à descrição do erro.

### Dados desaparecem após o envio

- **Causa provável:** reconstrução integral do formulário sem reaproveitar os valores válidos.
- **Correção:** preservar os dados aceitos e limpar apenas campos sensíveis quando necessário.

## Segurança e privacidade

Nunca confiar apenas na validação do cliente. Não registrar senhas, tokens, documentos completos ou dados sensíveis em logs de erro.

## Acessibilidade

Não anunciar erros a cada caractere digitado. Evitar regiões dinâmicas excessivamente verbosas. Garantir que links do resumo tenham nomes completos e que a ordem de foco continue previsível.

## Reversão

Remover o comportamento novo mantendo a validação de servidor ativa. Restaurar a versão anterior somente após confirmar que mensagens e associações acessíveis não serão perdidas.

## Relações

- **Padrões:** PAT-0001 — Formulários acessíveis
- **Especificações:** SPEC-0005 — Acessibilidade
- **Checklists:** CHECK-0102 — Validação de formulários acessíveis
- **Playbooks:** PB-0005 — Executar validação manual de acessibilidade

## Histórico

- 2026-07-25 — Criação inicial pelo CIATA.
