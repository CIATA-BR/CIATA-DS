# Versionamento, depreciação e migração

## Contrato

Mudanças incompatíveis em componentes e padrões devem ser versionadas e acompanhadas de estratégia de migração. Um componente deprecado não deve continuar indefinidamente em uso sem orientação, prazo e alternativa acessível.

## Regras

- mudanças incompatíveis devem ser identificadas explicitamente;
- depreciação deve informar motivo, substituto recomendado, impacto e prazo de suporte;
- a alternativa indicada deve possuir contrato de acessibilidade equivalente ou superior;
- consumidores precisam de instruções de migração claras e verificáveis;
- remoção de comportamento não pode eliminar alternativa necessária para teclado, leitor de tela, ampliação ou outras tecnologias assistivas;
- correções críticas de acessibilidade podem justificar migração acelerada, com comunicação proporcional ao risco;
- versões antigas mantidas temporariamente continuam sujeitas a monitoramento de barreiras conhecidas.

## Exemplo conforme

Um seletor customizado será substituído por componente nativo. A versão antiga é marcada como deprecada, o motivo de acessibilidade é explicado, há guia de migração e data prevista para remoção.

## Exemplo não conforme

O componente antigo desaparece em uma atualização e cada produto consumidor precisa descobrir sozinho como reproduzir comportamento, foco e estados.

## Critérios de teste

- versões incompatíveis são claramente identificadas;
- depreciações possuem substituto e caminho de migração;
- consumidores conseguem verificar o novo comportamento;
- a migração não introduz regressões conhecidas de acessibilidade.