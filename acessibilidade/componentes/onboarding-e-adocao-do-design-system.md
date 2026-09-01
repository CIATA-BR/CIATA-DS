# Onboarding e adoção do Design System

## Contrato

A adoção do CIATA Design System deve reduzir variação de implementação sem criar uma nova barreira de entrada para times de produto. A documentação deve permitir que design, conteúdo, engenharia e QA encontrem o padrão aplicável, entendam seu contrato de acessibilidade e saibam como validá-lo.

## Regras

- novos integrantes devem encontrar rapidamente princípios, componentes, receitas, critérios de aceite e processo de auditoria;
- exemplos de uso devem explicar comportamento esperado com teclado, toque e tecnologia assistiva quando aplicável;
- a documentação deve indicar quando usar componente nativo e quando um padrão customizado é justificável;
- padrões obrigatórios, recomendações e exemplos ilustrativos devem ser claramente distinguidos;
- jornadas críticas devem apontar para os contratos relacionados, evitando depender de conhecimento tácito;
- onboarding deve incluir acessibilidade desde o início, não como módulo opcional posterior;
- dúvidas recorrentes devem alimentar a documentação canônica em vez de permanecer apenas em mensagens ou reuniões.

## Exemplo conforme

Uma pessoa nova no time consegue localizar o padrão de modal, entender entrada e retorno de foco, encontrar os testes mínimos e aplicar a implementação sem precisar descobrir regras por tentativa e erro.

## Exemplo não conforme

O time recebe apenas um catálogo visual de componentes e precisa perguntar individualmente como foco, estados e anúncios devem funcionar.

## Critérios de teste

- os principais caminhos de entrada da documentação levam aos padrões canônicos;
- cada padrão indica comportamento e validação, não apenas aparência;
- não há regras críticas mantidas somente em conhecimento oral;
- conteúdo de onboarding acompanha mudanças relevantes do Design System.