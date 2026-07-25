# BP-0001 — Projeto Laravel institucional

## Metadados

- **Tipo:** Blueprint
- **Código:** BP-0001
- **Versão:** 0.1.0
- **Status:** rascunho
- **Responsável:** CIATA
- **Última revisão:** 2026-07-25

## Objetivo

Definir uma base reutilizável para novos sistemas Laravel do CIATA, reduzindo decisões repetidas e garantindo acessibilidade, segurança, localização, auditoria e operação desde o início.

## Escopo

Aplicações web institucionais, portais, bibliotecas digitais, sistemas administrativos e APIs com interface web associada.

## Estrutura recomendada

- Laravel em versão estável suportada;
- PHP compatível com a versão adotada;
- banco MariaDB ou PostgreSQL conforme o projeto;
- filas para tarefas demoradas;
- armazenamento privado para documentos sensíveis;
- autenticação com papéis e permissões explícitos;
- auditoria de ações relevantes;
- envio de e-mail transacional desacoplado;
- idioma padrão `pt-BR` e fuso `America/Sao_Paulo`;
- testes automatizados e validação manual de acessibilidade.

## Camadas e responsabilidades

1. **Domínio:** regras de negócio sem dependência direta da interface.
2. **Aplicação:** casos de uso, serviços e autorização.
3. **Infraestrutura:** banco, arquivos, e-mail, integrações e filas.
4. **Interface:** controladores, componentes, páginas e mensagens localizáveis.

## Requisitos iniciais

- variáveis de ambiente documentadas em `.env.example` sem segredos;
- HTTPS obrigatório em produção;
- cookies seguros e proteção contra falsificação de requisição;
- validação no servidor para toda entrada;
- políticas de autorização para ações sensíveis;
- tratamento de erros sem exposição de detalhes internos;
- logs estruturados com retenção definida;
- rotas, títulos, formulários e mensagens acessíveis.

## Acessibilidade

- usar HTML semântico antes de componentes personalizados;
- manter título de página e cabeçalho principal coerentes;
- garantir navegação completa por teclado;
- controlar foco apenas quando houver mudança de contexto real;
- associar erros aos campos e oferecer resumo de erros;
- não usar ícones ou cores como única forma de comunicação;
- testar com leitor de tela, ampliação, contraste elevado e linha Braille quando aplicável.

## Segurança e privacidade

- privilégio mínimo para usuários, serviços e integrações;
- dados pessoais coletados apenas quando necessários;
- arquivos sensíveis fora do diretório público;
- trilha de auditoria para ações administrativas;
- segredos em variáveis protegidas ou cofre;
- política de backup, restauração e retenção antes da produção.

## Qualidade e entrega

- análise estática e formatação automatizadas;
- testes unitários e de integração para regras críticas;
- checklist funcional e de acessibilidade antes de cada release;
- migrações reversíveis ou plano explícito de recuperação;
- documentação de instalação, operação e suporte.

## Critérios de aceite

- [ ] O projeto inicia sem segredos versionados.
- [ ] Idioma e fuso estão configurados corretamente.
- [ ] Autenticação, autorização e auditoria possuem testes.
- [ ] Formulários seguem PAT-0001.
- [ ] E-mails seguem REC-0001 quando Microsoft Graph for adotado.
- [ ] A navegação principal funciona por teclado e leitor de tela.
- [ ] Existe procedimento de backup, restauração e publicação.

## Relações

- **Padrões:** PAT-0001 — Formulários acessíveis
- **Receitas técnicas:** REC-0001 — Envio de e-mail com Microsoft Graph
- **Especificações:** SPEC-0002 — Estrutura; SPEC-0005 — Acessibilidade
- **Checklists:** CHECK-0001; CHECK-0101; CHECK-0401
- **Playbooks:** PB-0001 — Iniciar novo projeto; PB-0003 — Publicar uma release

## Histórico

- 2026-07-25 — Criação inicial pelo CIATA.