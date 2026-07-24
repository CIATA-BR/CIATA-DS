# Governança do CIATA Design System

## Propósito

Este documento define como decisões são propostas, revisadas, aprovadas, publicadas e mantidas no CIATA Design System.

## Princípios de governança

1. Nenhum projeto do CIATA começa do zero.
2. Todo conhecimento produzido deve permanecer acessível à instituição.
3. Acessibilidade é requisito de concepção, não etapa posterior.
4. Automatizamos o repetitivo e reservamos decisões críticas para pessoas.
5. Papéis são permanentes; pessoas podem mudar ao longo do tempo.
6. Toda decisão relevante deve ser rastreável.

## Áreas de responsabilidade

### Arquitetura e governança

Responsável por estrutura, versionamento, integração entre projetos, especificações e decisões técnicas.

### Design visual

Responsável por identidade visual, composição, coerência gráfica e validação das peças.

### Acessibilidade

Responsável por revisão manual com tecnologias assistivas, contraste, legibilidade, alternativas textuais, navegação, foco e ausência de dependência exclusiva de cor.

### QA funcional

Responsável por verificar finalidade, integridade, formatos, dimensões, links, exportações e comportamento esperado.

### Linguagem e UX Writing

Responsável por clareza, consistência terminológica, linguagem inclusiva, tom institucional e compreensão do conteúdo.

### Comunicação institucional

Responsável pela adequação das mensagens aos públicos e canais oficiais do CIATA.

## Fluxo de mudança

1. A necessidade é registrada em Issue.
2. A proposta é desenvolvida em branch própria.
3. A mudança é submetida por Pull Request.
4. As áreas afetadas realizam a revisão.
5. Pendências são corrigidas e registradas.
6. A mudança aprovada é integrada à branch principal.
7. O catálogo, o histórico e a versão são atualizados quando aplicável.

## Portões de qualidade

Um artefato somente pode receber o status `Publicado` depois das validações aplicáveis:

- técnica;
- visual;
- acessibilidade;
- funcional;
- linguagem;
- comunicação institucional.

Uma validação pode ser marcada como não aplicável, desde que a justificativa fique registrada.

## Decisões estruturais

Mudanças amplas devem utilizar um ou mais dos seguintes registros:

- **RFC:** proposta aberta à discussão;
- **SPEC:** especificação normativa aprovada;
- **ADR:** decisão arquitetural e sua justificativa.

## Conflitos e impasses

As decisões devem priorizar, nesta ordem:

1. segurança e dignidade das pessoas;
2. acessibilidade;
3. finalidade institucional;
4. consistência com as especificações vigentes;
5. sustentabilidade de manutenção;
6. preferência estética ou individual.

## Equipe inicial

A composição nominal da equipe será mantida em documento próprio para permitir atualizações sem alterar as regras permanentes de governança.
