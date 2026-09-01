# Fluxo de rastreabilidade

## Do achado ao fechamento

1. **Achado:** registrar comportamento observado e contexto da jornada.
2. **Referência:** relacionar componente/padrão, WCAG e demais referenciais aplicáveis.
3. **Evidência:** anexar passos reproduzíveis, ambiente e resultado observado.
4. **Severidade:** classificar pelo impacto funcional real.
5. **Correção:** vincular PR, commit ou build em que a alteração foi aplicada.
6. **Reteste:** repetir o fluxo original e validar regressões adjacentes.
7. **Fechamento:** registrar resultado final e evidência de reteste.

## Identificadores recomendados

Quando houver ferramenta de gestão, manter vínculos entre:

- ID do achado/bug;
- componente ou padrão afetado;
- critério WCAG relacionado;
- evidência inicial;
- PR/commit/build da correção;
- evidência de reteste;
- decisão de release, quando aplicável.

## Regra de fechamento

`Corrigido no código` não é estado final. O achado só deve ser considerado resolvido quando a correção estiver disponível em uma build identificável e o comportamento tiver sido retestado com o mecanismo relevante.

## Exceções

Quando uma barreira permanecer temporariamente:

- registrar justificativa;
- definir responsável;
- definir prazo;
- registrar mitigação, se houver;
- manter o achado rastreável até correção definitiva.

Consulte também os padrões de [rastreabilidade de achados, correções e reteste](../componentes/rastreabilidade-de-achados-correcoes-e-reteste.md), [gate de acessibilidade para release](../componentes/gate-de-acessibilidade-para-release.md) e [exceções temporárias e débito de acessibilidade](../componentes/excecoes-temporarias-e-debito-de-acessibilidade.md).