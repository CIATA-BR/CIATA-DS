# Conflitos de estado e sincronização

## Objetivo

Garantir que conflitos entre versões locais, remotas ou concorrentes sejam compreensíveis e resolvíveis sem depender de comparação visual complexa.

## Regras

- informar claramente quando o conteúdo mudou em outro dispositivo, sessão ou aba;
- não sobrescrever silenciosamente alterações da pessoa usuária;
- apresentar opções de resolução com nomes e consequências claras;
- quando houver comparação, oferecer estrutura textual e semântica compreensível por tecnologia assistiva;
- preservar uma cópia recuperável antes de operações destrutivas de resolução;
- manter foco previsível durante atualização de estado;
- comunicar quando a sincronização terminar ou continuar pendente.

## Exemplo conforme

Ao detectar versão mais recente no servidor, a interface informa: “Este conteúdo foi alterado em outro dispositivo.” e oferece “Manter minhas alterações”, “Usar versão mais recente” e “Revisar diferenças”. A revisão apresenta diferenças em estrutura textual navegável.

## Comportamento esperado

A pessoa entende que existem duas versões, sabe qual opção preserva cada conjunto de alterações e consegue comparar o conteúdo sem depender apenas de destaques visuais.

## Exemplo não conforme

A aplicação substitui automaticamente o conteúdo local e mostra por dois segundos uma mensagem visual “Sincronizado”.

## Por que falha

A pessoa pode perder trabalho sem perceber e não tem meios de entender ou recuperar a versão substituída.

## Testes mínimos

- editar o mesmo conteúdo em duas sessões;
- validar detecção e anúncio do conflito;
- testar todas as opções de resolução com teclado e leitor de tela;
- verificar recuperação da versão não escolhida quando aplicável;
- confirmar foco e feedback após sincronização.
