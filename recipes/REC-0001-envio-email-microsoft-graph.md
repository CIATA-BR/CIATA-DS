# REC-0001 — Envio de e-mail com Microsoft Graph

## Metadados

- **Tipo:** Receita técnica
- **Código:** REC-0001
- **Versão:** 0.1.0
- **Status:** rascunho
- **Responsável:** CIATA
- **Última revisão:** 2026-07-25

## Objetivo

Configurar uma aplicação institucional para enviar e-mails transacionais por uma conta do Microsoft 365 usando Microsoft Graph, com segredos fora do código, permissões mínimas e mensagens acessíveis.

## Quando usar

Em confirmações de cadastro, recuperação de senha, avisos administrativos e outras mensagens enviadas por sistemas do CIATA.

## Ingredientes técnicos

- locatário Microsoft Entra ID;
- registro de aplicativo;
- identificador do locatário e do cliente;
- segredo de cliente ou certificado;
- permissão de aplicação `Mail.Send` aprovada por administrador;
- caixa postal remetente autorizada;
- biblioteca HTTP ou SDK oficial compatível com o projeto.

## Receita

1. Registre o aplicativo no Microsoft Entra ID.
2. Conceda apenas a permissão de aplicação necessária para envio.
3. Aplique consentimento administrativo.
4. Restrinja o aplicativo às caixas postais necessárias sempre que a infraestrutura permitir.
5. Armazene identificadores e credenciais em variáveis de ambiente ou cofre de segredos.
6. Solicite token pelo fluxo de credenciais do cliente.
7. Envie a mensagem pelo endpoint da caixa postal remetente.
8. Registre sucesso ou falha sem armazenar corpo, token ou dados pessoais desnecessários.
9. Implemente tentativas controladas para erros temporários e impeça duplicação de mensagens.
10. Teste texto simples, HTML semântico, assunto, destinatários e resposta de erro.

## Validação

- enviar mensagem para uma caixa de teste;
- confirmar remetente, assunto, codificação UTF-8 e links;
- validar leitura com leitor de tela em cliente web e aplicativo de e-mail;
- simular segredo inválido, permissão ausente, destinatário inválido e indisponibilidade temporária;
- confirmar que logs não expõem token, segredo ou conteúdo sensível.

## Erros comuns

### Resposta 401

- **Causa provável:** token inválido, expirado ou emitido para recurso incorreto.
- **Correção:** revisar locatário, cliente, segredo e escopo solicitado.

### Resposta 403

- **Causa provável:** permissão sem consentimento administrativo ou remetente não autorizado.
- **Correção:** revisar permissões e política de acesso à caixa postal.

### Mensagem duplicada

- **Causa provável:** repetição automática sem idempotência.
- **Correção:** registrar identificador da operação e limitar novas tentativas.

## Segurança e privacidade

- Nunca versionar segredo, certificado privado ou token.
- Aplicar privilégio mínimo e rotação de credenciais.
- Não incluir dados sensíveis no assunto.
- Evitar registrar destinatários completos quando não forem necessários para suporte.
- Definir retenção de logs e trilha de auditoria.

## Acessibilidade

- O assunto deve identificar claramente a finalidade da mensagem.
- O conteúdo deve manter ordem lógica de leitura e títulos semânticos.
- Links devem ter texto significativo fora de contexto.
- Informações importantes não podem depender apenas de cor ou imagem.
- Fornecer alternativa textual para imagens relevantes.
- Evitar tabelas de layout e blocos excessivamente longos.

## Reversão

Revogar o segredo ou certificado, remover a permissão `Mail.Send`, desabilitar o aplicativo e restaurar o mecanismo anterior de envio. Confirmar que filas pendentes não produzirão mensagens duplicadas.

## Relações

- **Padrões:** PAT-0001 — Formulários acessíveis
- **Especificações:** SPEC-0004 — Artefatos; SPEC-0005 — Acessibilidade
- **Checklists:** CHECK-0101 — QA funcional; CHECK-0401 — Preparação de release
- **Playbooks:** PB-0003 — Publicar uma release

## Histórico

- 2026-07-25 — Criação inicial pelo CIATA.