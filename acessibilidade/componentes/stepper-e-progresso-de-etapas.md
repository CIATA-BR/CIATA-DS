# Stepper e progresso de etapas

## Contrato

Stepper de jornada representa progresso em um fluxo com múltiplas etapas. Ele deve informar onde a pessoa está, o que já foi concluído e o que ainda vem depois, sem depender apenas de cor, posição ou decoração visual.

Este padrão é diferente de stepper numérico usado para aumentar ou reduzir valores.

## Regras

- identificar a etapa atual de forma programática e textual;
- informar posição no fluxo, por exemplo `Etapa 2 de 4: Endereço`;
- distinguir etapas concluídas, atuais e futuras sem depender apenas de cor ou ícone;
- não substituir o título da etapa pelo indicador de progresso;
- quando etapas anteriores puderem ser revisitadas, usar controles com função clara de link ou botão;
- preservar dados já preenchidos ao voltar quando tecnicamente possível;
- comunicar erros da etapa atual antes de impedir avanço;
- não mover foco automaticamente entre etapas sem contexto previsível;
- ao avançar, posicionar o foco no início lógico do novo conteúdo, normalmente no título da etapa.

## Exemplo conforme

Fluxo de cadastro com lista ordenada:

1. Dados pessoais — concluída
2. Endereço — atual
3. Preferências — não iniciada
4. Revisão — não iniciada

O título da página continua sendo `Endereço`, enquanto o indicador informa `Etapa 2 de 4`.

## Comportamento esperado

A pessoa entende imediatamente onde está no processo, consegue revisar etapas anteriores quando permitido e não perde dados ou foco ao navegar entre etapas.

## Exemplo não conforme

Quatro círculos coloridos sem texto, com o segundo em azul para representar a etapa atual.

## Por que falha

A posição depende de percepção visual e de cor. A pessoa não sabe qual etapa está ativa, quantas faltam nem se pode voltar.

## Critérios de teste

- etapa atual é anunciada de forma inequívoca;
- posição total no fluxo é compreensível;
- concluído/atual/futuro não dependem apenas de cor;
- navegação entre etapas preserva dados quando aplicável;
- avanço e retorno mantêm foco previsível;
- erros impedindo avanço são identificados e localizáveis.

Veja também [Instruções e linguagem cognitiva](instrucoes-e-linguagem-cognitiva.md) e [Formulários e erros](../receitas/formularios-e-erros.md).