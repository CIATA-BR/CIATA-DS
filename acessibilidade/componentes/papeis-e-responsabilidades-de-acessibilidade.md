# Papéis e responsabilidades de acessibilidade

## Objetivo

Distribuir responsabilidade por acessibilidade ao longo do ciclo de produto, evitando dependência de uma única pessoa, etapa ou área.

## Princípios

- acessibilidade é responsabilidade compartilhada;
- especialistas apoiam decisão, critério e validação, mas não substituem design, conteúdo, engenharia, QA ou produto em suas responsabilidades;
- cada entrega deve possuir dono funcional e técnico;
- decisão excepcional deve indicar quem aprovou, por quê e até quando será revista;
- conhecimento crítico não deve existir apenas de forma informal ou concentrado em uma pessoa.

## Responsabilidades por função

### Produto

- inclui acessibilidade em escopo, risco e critérios de pronto;
- prioriza correções considerando severidade, jornada, exposição e dependências;
- não transforma exceção temporária em aceitação permanente silenciosa.

### Design

- especifica comportamento, foco, estados, contraste, ordem, alternativas e conteúdo necessário;
- reutiliza padrões canônicos do Design System;
- documenta exceções quando um padrão não atende ao caso.

### Conteúdo

- garante rótulos, instruções, mensagens e linguagem compatíveis com compreensão e tecnologia assistiva;
- participa do reteste quando mudança editorial afeta comportamento ou nome acessível.

### Engenharia

- preserva semântica, foco, estados e equivalência de entrada;
- implementa componentes nativos ou padrões aprovados sempre que possível;
- adiciona cobertura automatizada quando aplicável sem presumir que ela substitui teste manual.

### QA

- valida critérios de aceite e regressão;
- registra ambiente, tecnologia assistiva, build e evidência reproduzível;
- não encerra bug sem confirmar comportamento corrigido.

### Acessibilidade

- mantém padrões, orienta casos complexos e apoia classificação de impacto;
- revisa exceções relevantes e padrões novos;
- ajuda a transformar achados recorrentes em prevenção sistêmica.

## Exemplo conforme

Uma nova jornada de cadastro chega ao desenvolvimento com especificação de foco, mensagens de erro, comportamento de leitor de tela e critérios de aceite. Design, conteúdo, engenharia e QA possuem responsabilidades explícitas, e a pessoa especialista em acessibilidade atua em casos de decisão e validação de risco.

## Exemplo não conforme

O time conclui uma funcionalidade e a envia ao profissional de acessibilidade no fim do ciclo com a expectativa de que ele sozinho encontre, classifique e resolva todos os problemas antes do release.

## Por que falha

Acessibilidade vira uma inspeção tardia, aumenta retrabalho, concentra risco e torna a qualidade dependente da disponibilidade de uma única pessoa.
