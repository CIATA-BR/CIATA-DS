# CIATA Engineering System

O Engineering System reúne os padrões técnicos reutilizáveis do ecossistema CIATA. Ele não substitui decisões específicas de cada produto; oferece uma base comum para que projetos diferentes compartilhem qualidade, rastreabilidade, acessibilidade e capacidade de manutenção.

## Objetivos

- reduzir decisões repetidas;
- evitar que novos projetos comecem do zero;
- tornar escolhas técnicas compreensíveis para pessoas e agentes de IA;
- aproximar arquitetura, QA, segurança, acessibilidade e documentação;
- facilitar entrada de novos colaboradores;
- preservar conhecimento mesmo quando a equipe muda.

## Princípios

1. Pessoas e necessidades vêm antes da tecnologia.
2. Acessibilidade faz parte da arquitetura e dos critérios de aceite.
3. A solução mais simples que atende aos requisitos é preferível.
4. Decisões relevantes devem ser registradas.
5. Código, documentação e testes evoluem juntos.
6. Automação deve reduzir trabalho repetitivo sem ocultar responsabilidade.
7. Padrões compartilhados não anulam o contexto específico de cada produto.
8. Segurança, privacidade e dignidade podem bloquear uma entrega.

## Conteúdo inicial

- [Blueprint para novos projetos](PROJECT-BLUEPRINT.md)
- [Padrões de arquitetura](ARCHITECTURE.md)
- [Padrões de documentação](DOCUMENTATION.md)
- [Ciclo de vida dos projetos](../LIFECYCLE.md)
- [CIATA Way](../CIATA-WAY.md)
- [Governança](../GOVERNANCE.md)

## Relação com os repositórios de produto

Cada produto mantém localmente apenas o que é específico dele, como:

- visão e escopo;
- arquitetura concreta;
- ADRs e RFCs locais;
- instruções de instalação e operação;
- plano de testes;
- histórico de versões;
- riscos e decisões próprios.

Quando uma prática se torna útil para mais de um projeto, ela deve ser promovida para o CIATA-DS. O repositório de origem pode então apontar para a fonte canônica em vez de manter uma cópia divergente.

## Aplicação proporcional

Nem todo projeto precisa da mesma quantidade de processo. Um protótipo experimental e um sistema que trata dados pessoais não devem carregar o mesmo peso documental.

A aplicação dos padrões deve considerar:

- impacto sobre pessoas;
- sensibilidade dos dados;
- exposição pública;
- criticidade operacional;
- número de colaboradores;
- duração esperada;
- custo de falha;
- necessidade de auditoria.

Simplificar processo não significa remover acessibilidade, segurança, rastreabilidade ou responsabilidade.