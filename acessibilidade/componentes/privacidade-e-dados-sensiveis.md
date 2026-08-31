# Privacidade e dados sensíveis

## Objetivo

Interfaces que coletam, exibem ou confirmam dados pessoais ou sensíveis devem comunicar claramente o que está sendo solicitado e reduzir exposição acidental, sem criar barreiras para tecnologias assistivas.

## Regras

- identificar claramente cada dado solicitado e sua finalidade quando necessário ao contexto;
- não mascarar informação de forma que impeça a própria pessoa de revisar ou corrigir o dado;
- quando houver ocultação visual por privacidade, oferecer forma acessível e deliberada de revelar o valor quando isso for seguro;
- evitar leitura automática em voz alta de informação sensível quando a própria pessoa não solicitou essa exposição;
- preservar compatibilidade com preenchimento automático, gerenciadores de senha e recursos assistivos quando aplicável;
- não exigir memorização ou transcrição de dados apresentados em outra tela;
- mensagens de erro devem orientar a correção sem expor mais informação do que o necessário;
- telas compartilhadas, comprovantes e confirmações devem minimizar exposição de dados que não sejam essenciais para a tarefa.

## Exemplo conforme

Campo **CPF** com rótulo persistente e valor editável. Em uma tela de confirmação, o sistema apresenta apenas os dados necessários para conferir a operação e permite revisar antes de continuar.

### Comportamento esperado

A pessoa consegue identificar o campo, revisar e corrigir o valor e compreender por que ele é necessário, sem depender de uma representação visual mascarada ou de memorização.

## Exemplo não conforme

O sistema mostra apenas **•••.•••.•••-••** para o próprio titular e não oferece forma acessível de conferir o CPF antes de concluir uma ação crítica. Ao ocorrer erro, anuncia todo o valor sensível em uma região automática de alta prioridade.

### Por que falha

Impede revisão independente e pode provocar exposição involuntária de informação sensível por tecnologia assistiva.

## Testes mínimos

1. revisar entrada, edição e correção com leitor de tela;
2. verificar comportamento de campos mascarados e ação de revelar conteúdo;
3. validar preenchimento automático e gerenciadores quando aplicáveis;
4. testar mensagens de erro sem exposição excessiva;
5. confirmar que a pessoa consegue revisar dados antes de uma ação crítica.
