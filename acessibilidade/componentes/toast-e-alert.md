# Toast e alert

## Contrato

Toast/alert comunica feedback temporário ou mudança relevante de estado sem exigir que a pessoa procure visualmente pela mensagem. O anúncio deve ser proporcional à urgência e não roubar foco sem necessidade.

## Regras

- mensagens importantes devem ser expostas às tecnologias assistivas;
- usar anúncio assertivo apenas para eventos realmente urgentes;
- não mover foco para toast informativo comum;
- a mensagem deve permanecer tempo suficiente quando visualmente temporária;
- ações disponíveis dentro do feedback precisam ser focáveis e possuir nome claro;
- não anunciar repetidamente a mesma mensagem durante atualizações de estado;
- erros que exigem correção devem permanecer disponíveis além de um toast efêmero e ser associados ao contexto afetado.

## Web

Usar regiões vivas/roles apropriados conforme a urgência, evitando recriar continuamente a região ou disparar anúncios duplicados. Um `alert` não deve ser usado para todo feedback trivial.

## Android e iOS

Usar mecanismos nativos de anúncio/feedback quando necessários, respeitando as convenções da plataforma. Feedback visual transitório não pode ser a única forma de comunicar sucesso, falha ou mudança importante.

## Exemplo conforme

Após salvar uma alteração, aparece visualmente `Alterações salvas` e a tecnologia assistiva recebe anúncio equivalente, sem mudança de foco. O foco permanece no controle ou contexto da tarefa.

### Comportamento esperado

A pessoa sabe que a ação terminou com sucesso sem perder a posição de navegação.

## Exemplo não conforme

Um toast verde surge por dois segundos com o texto `Erro ao salvar`, sem região acessível, sem anúncio e sem mensagem persistente próxima ao formulário.

### Por que falha

Quem não percebe o toast visual pode continuar acreditando que a ação foi concluída. Além disso, um erro que exige nova ação desaparece antes de poder ser revisado.

## Critérios de teste

- feedback relevante é anunciado exatamente quando necessário;
- mensagens não urgentes não interrompem excessivamente a leitura;
- foco não é roubado por toast comum;
- erro acionável permanece disponível no contexto;
- anúncios não são duplicados;
- conteúdo não depende apenas de cor, posição ou tempo curto de exibição.

## Referências relacionadas

- [Mensagens dinâmicas](../receitas/mensagens-dinamicas.md), para estratégia de anúncios e regiões vivas;
- [Mensagens de erro, sucesso e orientação](mensagens-de-erro-sucesso-e-orientacao.md), para qualidade editorial do feedback;
- [Erro e sucesso](erro-e-sucesso.md), para estados persistentes ligados ao contexto da tarefa.
