# Rastreabilidade de achados, correções e reteste

## Contrato

Cada barreira de acessibilidade deve manter uma linha clara entre descoberta, evidência, correção e validação final. O objetivo é impedir que um bug seja considerado resolvido apenas porque houve alteração de código.

## Regras

- vincular o achado à evidência original e ao ambiente em que foi reproduzido;
- registrar severidade e jornada afetada antes da correção;
- associar PR, commit ou versão que contém a correção quando disponível;
- exigir reteste no ambiente relevante antes de fechar o achado;
- registrar resultado do reteste e eventuais efeitos colaterais;
- reabrir quando o comportamento continuar falhando ou quando a correção deslocar a barreira para outro ponto da jornada;
- preservar histórico suficiente para auditoria e aprendizado futuro;
- evitar evidência com dados pessoais desnecessários.

## Fluxo mínimo

`Achado -> Evidência -> Bug -> Correção -> Build/versão -> Reteste -> Encerramento`

## Exemplo conforme

Um modal perde o foco ao fechar. O bug contém vídeo ou passos reproduzíveis, ambiente e leitor de tela usados. O PR da correção é vinculado e, após build de homologação, o reteste confirma retorno do foco ao acionador. O resultado é registrado antes do fechamento.

## Exemplo não conforme

O bug é fechado com o comentário "corrigido no código" sem versão de teste nem nova validação.

## Por que falha

A mudança pode não ter chegado à build, pode não resolver o comportamento real ou pode introduzir regressão em outra tecnologia assistiva.

## Critérios de teste

- achado possui evidência reproduzível;
- correção possui referência técnica quando aplicável;
- reteste ocorreu em versão identificável;
- fechamento registra resultado funcional;
- efeitos colaterais relevantes foram avaliados;
- histórico permanece consultável.
