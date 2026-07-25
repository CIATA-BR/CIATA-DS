# Blueprint do ecossistema CIATA

## Propósito

Este documento define como as principais fontes de conhecimento do CIATA se relacionam. Seu objetivo é evitar duplicação, reduzir ambiguidades e permitir que pessoas e agentes de IA encontrem a fonte correta antes de criar novos conteúdos.

## Fontes canônicas

### Organização `.github`

Responsável pela identidade pública e pela governança institucional compartilhada no GitHub.

Contém:

- perfil público da organização;
- orientações gerais de contribuição;
- Código de Conduta;
- política de segurança;
- canais de suporte;
- formulários de issues;
- template de pull request;
- regras sobre a divisão de responsabilidades entre repositórios.

Não deve concentrar padrões técnicos detalhados de plataformas ou produtos.

### CIATA Design System

Responsável por padrões reutilizáveis do ecossistema.

É organizado conceitualmente em cinco sistemas:

1. **Brand System:** identidade visual, sonora e documental;
2. **Design System:** interação, conteúdo, componentes e experiência;
3. **Engineering System:** arquitetura, qualidade, segurança, entrega e operação;
4. **Accessibility System:** requisitos, padrões, testes e conhecimento por plataforma e tecnologia assistiva;
5. **Knowledge System:** decisões, pesquisas, receitas, casos, lições aprendidas e anti-padrões.

### Repositórios de produtos

Comunica-CIATA, Biblioteca, Emprega, Portal, CIATA Play Toolkit e demais produtos mantêm apenas o conhecimento específico de sua solução.

Devem conter, conforme aplicável:

- objetivo e escopo do produto;
- arquitetura específica;
- instruções de desenvolvimento e operação;
- decisões locais;
- requisitos e testes próprios;
- roadmap e releases do produto;
- referências aos padrões reutilizados do CIATA-DS.

Quando um aprendizado local se tornar reutilizável, ele deve ser promovido ao CIATA-DS e substituído no produto por uma referência à fonte canônica.

## Fluxo de conhecimento

```text
Necessidade em um produto
        ↓
Pesquisa de padrões existentes
        ↓
Uso ou adaptação consciente
        ↓
Implementação e validação local
        ↓
Aprendizado reutilizável identificado
        ↓
Proposta ao CIATA-DS
        ↓
Revisão, publicação e referência pelos produtos
```

## Regra de não duplicação

Antes de criar um documento, componente ou padrão:

1. procure a fonte canônica;
2. confirme se o conteúdo é institucional, reutilizável ou específico do produto;
3. contribua na fonte correta;
4. use links em vez de cópias quando o conteúdo já existir;
5. registre divergências necessárias.

Duplicação temporária durante migrações deve possuir responsável e plano de remoção.

## Relação entre os repositórios principais

```text
CIATA-BR/.github
    identidade e governança institucional

CIATA-BR/CIATA-DS
    padrões e conhecimento reutilizáveis

CIATA-BR/Comunica-CIATA
    documentação geral do ecossistema de comunicação

CIATA-BR/Comunica-CIATA-Android
    implementação e decisões específicas do cliente Android

Repositórios de serviços e produtos
    implementação, operação e conhecimento específico
```

## Critério para novos repositórios

Um novo repositório deve possuir responsabilidade própria e ciclo de vida independente. Não deve ser criado apenas para separar algumas pastas ou documentos que pertencem naturalmente a uma fonte já existente.

Antes da criação, devem ser definidos:

- propósito;
- proprietário institucional;
- relação com outros repositórios;
- natureza pública ou privada;
- dados e riscos envolvidos;
- tecnologia e estratégia de manutenção;
- documentação inicial;
- critérios de continuidade ou arquivamento.

## Uso por agentes de IA

Antes de propor mudanças, agentes devem consultar nesta ordem:

1. regras institucionais da organização `.github`;
2. CIATA Way;
3. especificações, ADRs, RFCs e padrões aplicáveis do CIATA-DS;
4. documentação do produto afetado;
5. código e testes atuais.

Na existência de conflito, a regra mais específica e vigente prevalece, desde que não viole segurança, dignidade, acessibilidade ou governança institucional.
