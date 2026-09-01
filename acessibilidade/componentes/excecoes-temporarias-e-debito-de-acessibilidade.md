# Exceções temporárias e débito de acessibilidade

## Contrato

Exceção temporária não é aprovação definitiva nem mecanismo para normalizar barreiras conhecidas. Toda exceção precisa ser explícita, justificada, limitada no tempo e acompanhada por plano de correção.

## Regras

- exceção deve registrar problema, impacto, severidade, escopo e justificativa;
- toda exceção deve possuir responsável, prazo e critério de encerramento;
- não aceitar exceção indefinida ou sem dono;
- não reclassificar severidade apenas para permitir release;
- risco legal, regulatório, reputacional e funcional deve ser considerado junto do impacto na pessoa usuária;
- barreira alta em jornada essencial exige justificativa executiva excepcional e, sempre que possível, retirada da funcionalidade da release em vez de convivência silenciosa;
- exceções expiradas voltam automaticamente para revisão;
- correção de exceção exige reteste antes do encerramento.

## Registro mínimo

- identificador do bug ou achado;
- descrição da barreira;
- impacto funcional;
- severidade;
- jornada ou componente afetado;
- responsável;
- data de aprovação da exceção;
- data limite;
- plano de correção;
- evidência de reteste para encerramento.

## Exemplo conforme

Um problema médio de hierarquia de cabeçalhos permanece em uma tela secundária por uma sprint. A exceção possui bug vinculado, responsável, prazo de 14 dias e critério de encerramento após correção e reteste com leitor de tela.

## Exemplo não conforme

A equipe marca um bug alto como "aceito" sem prazo porque a correção é considerada trabalhosa.

## Por que falha

O débito vira permanente, a barreira desaparece da governança e o risco fica invisível para decisões futuras.

## Critérios de teste

- nenhuma exceção está sem responsável;
- toda exceção possui vencimento;
- severidade original foi preservada;
- existe plano de correção verificável;
- exceções expiradas são reavaliadas;
- encerramento depende de reteste.
