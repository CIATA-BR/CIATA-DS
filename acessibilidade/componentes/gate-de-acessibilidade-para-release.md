# Gate de acessibilidade para release

## Contrato

Toda entrega deve ter critérios explícitos de acessibilidade antes de produção. O gate não substitui auditoria completa, mas impede que barreiras conhecidas de alto impacto sejam tratadas como detalhe de acabamento.

## Regras

- definir o escopo de acessibilidade da release antes da validação final;
- relacionar jornadas críticas, componentes alterados e riscos conhecidos;
- bloquear release quando houver barreira de severidade alta em jornada essencial, salvo decisão formal de não liberar aquela funcionalidade;
- não usar nível WCAG, quantidade de issues ou resultado de ferramenta automática como substituto da análise de impacto;
- exigir reteste das correções que alterem foco, semântica, conteúdo dinâmico, entrada de dados ou navegação crítica;
- registrar o resultado do gate como `Aprovado`, `Aprovado com ressalvas` ou `Reprovado`;
- quando houver ressalvas, documentar claramente o que permanece aberto, impacto, responsável e prazo.

## Evidência mínima

O gate deve apontar, quando aplicável:

- versão ou build avaliada;
- ambiente e plataforma;
- jornada ou componente testado;
- tecnologia assistiva usada;
- achados abertos e severidade;
- bugs corrigidos e retestados;
- exceções temporárias ainda vigentes;
- decisão final de release.

## Exemplo conforme

Uma nova jornada de pagamento tem todos os bugs altos corrigidos e retestados com teclado e leitor de tela. Permanecem dois bugs baixos documentados, sem impacto na conclusão da tarefa, com responsáveis e prazo definidos. A release é registrada como `Aprovado com ressalvas`.

## Exemplo não conforme

A equipe libera a funcionalidade porque a automação reportou zero violações, embora o botão `Confirmar pagamento` não receba foco pelo teclado.

## Por que falha

A pessoa pode não conseguir concluir uma tarefa essencial, enquanto o processo interno registra falsamente que a entrega foi validada.

## Critérios de teste

- existe decisão explícita de release;
- bloqueios são baseados em impacto funcional;
- jornada crítica possui cobertura proporcional ao risco;
- correções relevantes foram retestadas;
- ressalvas têm rastreabilidade e prazo;
- automação não é tratada como evidência suficiente isoladamente.
