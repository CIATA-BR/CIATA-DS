# VPAT e Accessibility Conformance Report no CIATA Design System

Esta área define como a CIATA prepara, revisa e publica relatórios de conformidade de acessibilidade baseados no **Voluntary Product Accessibility Template® (VPAT®)** da Information Technology Industry Council (ITI).

## Referência adotada

A referência atual é o **VPAT® 2.5Rev (abril de 2025)**, usando a edição adequada ao contexto:

- **WCAG Edition** para relatórios baseados em WCAG 2.0, 2.1 ou 2.2;
- **508 Edition** quando houver obrigação ligada à Revised Section 508;
- **EU Edition** quando houver obrigação ligada à EN 301 549;
- **INT Edition** quando o relatório precisar reunir múltiplos referenciais.

Para produtos digitais da CIATA, o ponto de partida padrão é a **WCAG Edition**, com avaliação contra WCAG 2.2 níveis A e AA, salvo requisito contratual, regulatório ou de mercado mais amplo.

## VPAT e ACR não são a mesma coisa

O VPAT® é o modelo publicado pela ITI. Quando o modelo é preenchido com os resultados de avaliação de um produto ou serviço, o documento resultante é um **Accessibility Conformance Report (ACR)**.

A CIATA não deve alterar o formulário oficial do VPAT® e apresentá-lo como se continuasse sendo o modelo oficial da ITI. Os arquivos desta pasta servem como processo interno, guia de preenchimento e estrutura de evidências. Quando houver publicação formal de um ACR baseado em VPAT®, deve-se usar o template oficial correspondente da ITI.

## Arquivos desta pasta

- [Modelo interno de ACR](modelo-acr.md): estrutura de trabalho para consolidar evidências antes de transpor os resultados para o VPAT® oficial.
- [Guia de preenchimento](guia-de-preenchimento.md): critérios de classificação, evidências mínimas e regras de revisão.

## Fonte canônica de critérios

A interpretação interna dos critérios WCAG deve partir da [base canônica WCAG 2.2 do CIATA Design System](../wcag-2.2/README.md). O texto normativo do W3C prevalece quando houver divergência entre qualquer resumo interno e a norma.

## Princípios do processo

1. Nenhum nível de conformidade deve ser declarado sem evidência verificável.
2. Automação pode apoiar a avaliação, mas não substitui validação manual.
3. Resultados devem ser registrados por plataforma quando o produto existir em mais de uma plataforma.
4. Tecnologias assistivas, navegador, sistema operacional, versão e método de teste devem ser identificados quando forem relevantes para a evidência.
5. "Supports" não significa "sem nenhum bug de acessibilidade"; significa que existe ao menos um método que atende ao critério sem defeitos conhecidos que impeçam a conformidade daquele requisito.
6. "Partially Supports" e "Does Not Support" exigem descrição objetiva da funcionalidade afetada e da forma como o critério não é atendido.
7. "Not Applicable" exige justificativa.
8. O ACR deve refletir o estado real da versão avaliada do produto, e não o estado esperado de uma versão futura.

## Saída esperada

Ao final da avaliação, a equipe deve conseguir produzir um ACR reproduzível, auditável e consistente, com rastreabilidade entre:

- requisito normativo;
- evidência;
- ambiente de teste;
- nível de conformidade declarado;
- observação ou exceção registrada;
- versão do produto avaliada.
