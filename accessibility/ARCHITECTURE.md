# Arquitetura do Accessibility Engineering System

## Objetivo

Esta arquitetura define onde cada tipo de conhecimento vive, como as áreas se relacionam e quando uma descoberta deve ser promovida de pesquisa para referência estável.

## Camadas

```text
Contexto e obrigações
├── standards
└── laws

Ambientes de uso
├── platforms
└── assistive-technologies

Aplicação de engenharia
├── patterns
├── recipes
├── testing
├── tools
└── reports

Memória e evolução
├── research
└── knowledge
```

## Responsabilidades

### Standards

Explica requisitos normativos, escopo, interpretação, relações entre critérios e fontes oficiais. Não transforma interpretação do CIATA em texto normativo.

### Laws

Registra contexto legal por jurisdição, aplicabilidade, relações com normas e necessidade de revisão especializada. Não substitui aconselhamento jurídico.

### Platforms

Documenta APIs, semântica, comportamento nativo, limitações e estratégias por sistema operacional, framework ou ambiente.

### Assistive technologies

Documenta operação, modelos de navegação, configurações relevantes, diferenças de versão, interoperabilidade e problemas conhecidos.

### Patterns

Define resultados esperados para componentes, fluxos e interações, independentemente de uma implementação específica.

### Recipes

Traduz padrões em soluções reproduzíveis, com pré-condições, implementação, testes, limitações e alternativas.

### Testing

Define procedimentos, matrizes, evidências, regressão e critérios de prontidão.

### Tools

Explica instalação, configuração, alcance, falsos positivos, falsos negativos e uso responsável de automação.

### Reports

Padroniza registro de escopo, ambiente, resultados, severidade, evidências, recomendações e limitações.

### Research

Recebe hipóteses, experimentos, comparações, versões beta e descobertas ainda não consolidadas.

### Knowledge

Preserva conhecimento confirmado: problemas conhecidos, anti-padrões, estudos de caso, decisões e lições aprendidas.

## Fluxo de conhecimento

```text
necessidade ou incidente
        ↓
pesquisa e observação
        ↓
evidência reproduzível
        ↓
conhecimento confirmado
        ↓
padrão ou receita reutilizável
        ↓
teste e adoção em projetos
        ↓
feedback e evolução
```

Uma descoberta não deve ser promovida apenas porque parece plausível. A promoção exige contexto suficiente para reprodução e revisão.

## Metadados recomendados

Conteúdos técnicos versionáveis devem informar, quando aplicável:

- data da última verificação;
- plataforma e versão;
- tecnologia assistiva e versão;
- navegador, framework ou dispositivo;
- procedimento de reprodução;
- resultado esperado e observado;
- fontes oficiais;
- nível de confiança;
- projetos onde foi validado.

## Fonte canônica e especialização

O CIATA-DS mantém conhecimento reutilizável. Projetos mantêm detalhes locais. Quando uma solução local se torna aplicável a outros produtos, ela deve ser promovida ao CIATA-DS, preservando referência à origem.

## Mudanças estruturais

Novas áreas de primeiro nível exigem justificativa arquitetural. Conteúdo novo deve preferir a estrutura existente. Duplicações temporárias precisam indicar fonte canônica e plano de convergência.
