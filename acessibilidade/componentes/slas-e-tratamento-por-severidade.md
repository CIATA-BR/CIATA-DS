# SLAs e tratamento por severidade

## Objetivo

Orientar resposta operacional aos achados de acessibilidade sem confundir severidade, prioridade e prazo de correção.

## Princípios

- severidade mede impacto funcional na experiência da pessoa;
- prioridade considera também exposição, frequência, alcance, dependências e risco de release;
- SLA é compromisso operacional de resposta e tratamento, não redefinição da severidade;
- barreiras altas em jornadas essenciais exigem tratamento acelerado;
- prazo vencido deve gerar revisão e decisão explícita, não desaparecimento do backlog.

## Referência operacional

### Alto

- iniciar triagem imediatamente após confirmação;
- definir responsável e plano de correção com urgência;
- bloquear release quando a barreira impede jornada essencial, conforme o gate de release;
- se houver exceção extraordinária, registrá-la formalmente com prazo curto e mitigação.

### Médio

- incluir em planejamento de curto prazo;
- avaliar incidência em múltiplas telas ou componentes, pois recorrência pode elevar prioridade;
- evitar acumular o mesmo padrão de barreira em novas entregas.

### Baixo

- manter rastreabilidade e dono;
- agrupar correções quando houver ganho de eficiência;
- não descartar automaticamente: baixa severidade ainda pode indicar problema sistêmico ou recorrente.

## SLA de resposta x SLA de correção

É útil distinguir:

- **resposta:** tempo até o achado ser triado, confirmado e receber dono;
- **correção:** tempo até existir implementação corrigida disponível para reteste;
- **fechamento:** somente após reteste confirmar a remoção da barreira.

Os tempos concretos podem variar por produto e contexto, mas devem ser definidos pela organização e acompanhados de forma consistente.

## Exemplo conforme

Um botão essencial não recebe foco. O bug é classificado como alto, recebe dono imediatamente, bloqueia o release da jornada e só é fechado após reteste na build corrigida.

## Exemplo não conforme

O time reduz um bug de alto para médio apenas porque a correção não cabe no sprint atual.

## Por que falha

Severidade passa a refletir conveniência operacional e deixa de representar impacto real para a pessoa usuária.
