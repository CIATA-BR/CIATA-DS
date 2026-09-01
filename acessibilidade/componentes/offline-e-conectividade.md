# Offline e conectividade

## Objetivo

Garantir que perda de conexão, rede instável ou indisponibilidade temporária não destruam contexto nem deixem a pessoa sem saber o que aconteceu.

## Regras

- comunicar de forma textual e programática quando a conexão cair ou voltar;
- não depender apenas de ícone, cor ou animação para indicar estado de rede;
- preservar dados já preenchidos sempre que tecnicamente possível;
- diferenciar claramente conteúdo indisponível, conteúdo em cache e conteúdo confirmado no servidor;
- evitar mudanças inesperadas de foco quando o estado de rede mudar;
- oferecer tentativa novamente quando a ação puder ser repetida com segurança;
- explicar quando uma ação não pode ser concluída offline.

## Exemplo conforme

Ao enviar um formulário sem conexão, os dados permanecem preenchidos e a interface informa: “Sem conexão. Seus dados foram preservados. Tente novamente quando a internet voltar.” O foco permanece no contexto atual e existe um botão “Tentar novamente”.

## Comportamento esperado

Leitor de tela e demais tecnologias assistivas recebem a mudança relevante uma vez, sem perda de foco. A pessoa entende o estado da conexão, sabe se seus dados foram preservados e possui próximo passo claro.

## Exemplo não conforme

A tela exibe apenas um ícone vermelho de nuvem, limpa o formulário e retorna silenciosamente para a página inicial.

## Por que falha

A pessoa pode perder trabalho, não entender a causa e não ter caminho previsível para recuperação.

## Testes mínimos

- simular queda e retorno de conexão durante uma jornada;
- validar preservação de dados e foco;
- confirmar anúncio único e compreensível de mudança de estado;
- verificar comportamento com conteúdo em cache e conteúdo indisponível;
- testar a ação de tentar novamente.
