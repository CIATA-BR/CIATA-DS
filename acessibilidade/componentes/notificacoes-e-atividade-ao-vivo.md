# Notificações e atividade ao vivo

## Objetivo

Notificações e atividades ao vivo devem comunicar mudanças relevantes sem interromper tarefas, deslocar foco ou gerar uma sequência excessiva de anúncios.

## Regras

- usar anúncios automáticos apenas para mudanças que realmente exigem percepção imediata;
- atualizações rotineiras devem permanecer disponíveis para consulta sem serem necessariamente vocalizadas na hora;
- não mover foco para toast, badge, painel de atividade ou item recém-criado sem ação explícita da pessoa;
- contadores devem expor valor e significado, por exemplo `3 notificações não lidas`;
- prioridade visual por cor ou ícone deve possuir equivalente textual ou programático;
- notificações agrupadas devem indicar quantidade e permitir navegação pelos itens;
- ações em notificações devem possuir nomes específicos, como `Marcar comentário de Ana como lido`;
- atualizações contínuas devem ser agregadas quando possível para evitar interrupções repetitivas;
- notificações críticas devem permanecer disponíveis tempo suficiente ou até ação da pessoa.

## Exemplo conforme

Durante a edição de um documento, chegam cinco atualizações. O foco permanece no editor. A interface atualiza discretamente `5 novas atividades`. A pessoa abre o painel quando quiser e percorre cada item em ordem lógica.

## Comportamento esperado

A atividade fica disponível e perceptível, mas não compete continuamente com a tarefa atual nem interrompe a fala do leitor de tela a cada evento.

## Exemplo não conforme

Cada alteração de outro colaborador abre um toast assertivo, interrompe a fala em andamento e move o foco para o painel de notificações.

## Por que falha

A interface torna mudanças secundárias mais prioritárias que a própria tarefa, causando perda de contexto e sobrecarga cognitiva e auditiva.

## Critérios mínimos de teste

- receber uma e várias notificações durante outra tarefa;
- conferir contadores e estados não lidos;
- testar agrupamento e navegação por histórico;
- validar notificações críticas e não críticas;
- confirmar ausência de movimento inesperado de foco;
- observar comportamento com leitor de tela durante alta frequência de atualizações.
