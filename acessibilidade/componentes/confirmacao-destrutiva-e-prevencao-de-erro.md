# Confirmação destrutiva e prevenção de erro

## Objetivo

Reduzir erros irreversíveis ou de alto impacto, garantindo que ações destrutivas sejam compreendidas, confirmadas e, quando possível, reversíveis.

## Regras

- a ação deve ter nome específico, evitando rótulos genéricos como “OK”;
- informar claramente o objeto afetado e a consequência antes da confirmação;
- distinguir visual e semanticamente ação principal, cancelamento e ação destrutiva;
- o foco inicial de um diálogo destrutivo deve favorecer uma escolha segura quando isso não comprometer o fluxo;
- não exigir gesto complexo ou precisão para cancelar;
- evitar confirmações repetitivas em ações de baixo risco, reservando fricção para impacto real;
- oferecer desfazer quando tecnicamente possível;
- em transações financeiras, legais ou envio de dados importantes, permitir revisar, corrigir ou cancelar antes da conclusão quando aplicável;
- a confirmação de sucesso deve indicar exatamente o que foi realizado.

## Exemplo conforme

Ao excluir uma conta, o diálogo possui título “Excluir conta?”, explica que os dados serão removidos permanentemente e oferece os botões “Cancelar” e “Excluir conta permanentemente”. O foco inicial permanece em “Cancelar”.

### Comportamento esperado

A pessoa sabe qual ação está prestes a executar, entende a consequência, pode cancelar facilmente e recebe confirmação inequívoca se prosseguir.

## Exemplo não conforme

Um diálogo pergunta apenas “Tem certeza?” e oferece “Não” e “Sim”, sem dizer qual item será alterado. O foco inicial cai em “Sim”.

### Por que falha

A consequência depende de memória e contexto visual anterior, aumenta a chance de erro e torna a confirmação insegura para pessoas com deficiência visual, cognitiva ou motora.

## Critérios mínimos de teste

- verificar nome específico da ação e objeto afetado;
- testar foco inicial, cancelamento e retorno ao acionador;
- validar operação por teclado, toque e leitor de tela;
- testar desfazer ou revisão quando disponível;
- confirmar que sucesso e erro descrevem o resultado real.