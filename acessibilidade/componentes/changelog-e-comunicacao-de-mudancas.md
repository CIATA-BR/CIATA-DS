# Changelog e comunicação de mudanças

## Contrato

Mudanças relevantes do Design System devem ser comunicadas de forma objetiva, rastreável e útil para quem consome os padrões. O changelog deve destacar impacto funcional e de acessibilidade, não apenas alterações visuais ou técnicas.

## Regras

- cada mudança relevante deve indicar componente ou padrão afetado;
- mudanças de comportamento devem explicar impacto para pessoas usuárias e para times consumidores;
- correções de acessibilidade devem registrar a barreira resolvida e, quando útil, o ambiente validado;
- alterações incompatíveis devem apontar para guia de migração;
- mudanças sem impacto funcional podem ser agrupadas para reduzir ruído;
- o changelog não substitui documentação canônica, mas deve apontar para ela;
- comunicação deve evitar depender apenas de cor, ícone ou marcação visual para indicar criticidade.

## Exemplo conforme

A atualização informa que o modal passou a devolver foco ao elemento acionador após fechamento, aponta a documentação atualizada e indica necessidade de reteste nos produtos consumidores.

## Exemplo não conforme

O changelog registra apenas `ajustes no modal`, sem explicar comportamento, impacto ou ação necessária.

## Critérios de teste

- mudanças funcionais são distinguíveis de alterações cosméticas;
- impactos de acessibilidade são explicitados quando aplicáveis;
- links para documentação e migração estão atualizados;
- consumidores conseguem identificar se precisam agir após uma atualização.