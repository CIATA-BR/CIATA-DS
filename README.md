# CIATA Design System

O CIATA Design System é a fonte oficial dos padrões reutilizáveis, da identidade institucional e do conhecimento técnico compartilhado pelo CIATA – Centro de Inclusão Através da Tecnologia Assistiva.

Seu papel ultrapassa uma biblioteca visual. Este repositório conecta marca, experiência, engenharia, acessibilidade e memória institucional para que nenhum projeto comece do zero e todo projeto deixe um legado.

## Os cinco sistemas

### Brand System

Identidade visual, sonora e documental do CIATA: logotipos, cores, tipografia, ícones, banners, apresentações, certificados, redes sociais e regras de aplicação.

### Design System

Princípios de interação, conteúdo, comportamento, estados, componentes, tokens, exemplos e padrões de experiência independentes de plataforma.

### Engineering System

Arquitetura, qualidade, segurança, privacidade, documentação, internacionalização, testes, entrega, observabilidade e convenções reutilizáveis entre projetos.

### Accessibility System

Requisitos, padrões, testes, checklists, tecnologias assistivas, plataformas, barreiras conhecidas e soluções validadas de acessibilidade.

### Knowledge System

ADRs, RFCs, especificações, pesquisas, receitas, casos reais, anti-padrões, postmortems, lições aprendidas e memória técnica consultável por pessoas e agentes de IA.

## Fundamentos

- [CIATA Way](CIATA-WAY.md): princípios que orientam nossas decisões.
- [Blueprint do ecossistema](BLUEPRINT.md): responsabilidades e fluxo de conhecimento entre repositórios.
- [Ciclo de vida de projetos](LIFECYCLE.md): caminho entre necessidade, entrega, operação e aprendizado.
- [Governança](GOVERNANCE.md): como mudanças são propostas, revisadas e aprovadas.
- [Acessibilidade](ACCESSIBILITY.md): compromisso e requisitos gerais.
- [Roadmap](ROADMAP.md): evolução planejada do sistema.
- [Como contribuir](CONTRIBUTING.md): fluxo de colaboração.

## Fundamentos oficiais da marca digital

- [Marca CIATA](marca/README.md): composições aprovadas, cores, tipografia e regras invioláveis.
- [Acessibilidade da marca](acessibilidade/marca.md): nomes acessíveis, textos alternativos e uso contextual.
- [Implementação da marca](docs/implementacao-da-marca.md): exemplos de HTML, desempenho e critérios de aceite.
- [`tokens/cores.css`](tokens/cores.css): cores oficiais e tokens semânticos para interfaces.
- [`tokens/cores.json`](tokens/cores.json): tokens de cor em formato interoperável.
- [`tokens/tipografia.css`](tokens/tipografia.css): Segoe UI e fallbacks de sistema.

## Princípios

- Pessoas primeiro.
- Acessibilidade desde a concepção.
- Nenhum projeto começa do zero.
- Todo projeto deixa um legado.
- Documentação faz parte da entrega.
- Reutilização antes da duplicação.
- Decisões relevantes devem ser rastreáveis.
- Automatizar o repetitivo e humanizar o importante.
- Inteligência artificial trabalha com fontes, limites e revisão proporcional ao risco.

## Estrutura atual

- `marca/`: logotipos, cores, tipografia, ícones e manual de marca.
- `tokens/`: tokens oficiais e semânticos consumíveis pelos produtos.
- `acessibilidade/`: padrões e orientações específicas de acessibilidade.
- `docs/`: guias de implementação reutilizáveis.
- `redes-sociais/`: ativos por plataforma e finalidade.
- `imagens/`: fotografias, ilustrações e imagens institucionais.
- `documentos/`: modelos e documentos oficiais.
- `apresentacoes/`: apresentações institucionais, de projetos e eventos.
- `certificados/`: modelos e versões oficiais de certificados.
- `sons/`: identidades sonoras, vinhetas e avisos.
- `videos/`: vídeos institucionais e materiais audiovisuais.
- `modelos/`: modelos reutilizáveis de peças e materiais.
- `recursos/`: outros ativos compartilhados.
- `catalogo/`: inventário permanente dos artefatos.
- `templates/`: modelos documentais e operacionais.
- `specs/`, `adrs/` e `rfcs/`: especificações, decisões e propostas estruturais.

A arquitetura conceitual dos cinco sistemas não exige reorganização imediata de todas as pastas. A estrutura física evoluirá de forma incremental, preservando histórico, links e rastreabilidade.

## Registro de artefatos

- [Registro Mestre de Artefatos](catalogo/registro-mestre.md)
- [Modelo de Passaporte de Artefato](templates/passaporte-de-artefato.asset.md)

## Convenções de nomenclatura

Arquivos universais mantêm a nomenclatura internacional consolidada, como `README.md`, `LICENSE`, `CHANGELOG.md`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md` e `SECURITY.md`.

Diretórios e arquivos de conteúdo institucional usam português do Brasil, em letras minúsculas, sem acentos, sem espaços e com hífen entre palavras quando necessário.

Projetos de desenvolvimento seguem as convenções técnicas de cada plataforma e tecnologia.

## Acessibilidade

Todo ativo, componente, padrão ou documento deve considerar estrutura semântica, contraste, legibilidade, descrição textual, tecnologias assistivas, navegação por teclado, foco previsível, compatibilidade com Braille e ausência de dependência exclusiva de características sensoriais.

Verificações automáticas apoiam o processo. A publicação exige validação humana proporcional ao impacto.

## Uso

Os materiais publicados neste repositório constituem a referência oficial e reutilizável do ecossistema CIATA. Projetos devem referenciar esta fonte em vez de manter cópias divergentes.

Quando uma necessidade específica exigir afastamento de um padrão, a decisão deve ser consciente, justificada e registrada.

## Licença

Consulte o arquivo `LICENSE` antes de reutilizar os materiais.

---

**Começamos pelas pessoas. Construímos com acessibilidade. Entregamos conhecimento.**
