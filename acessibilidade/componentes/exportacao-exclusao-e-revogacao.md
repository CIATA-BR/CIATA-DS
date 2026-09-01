# Exportação, exclusão e revogação

## Objetivo

Ações de exportar dados, excluir conta, revogar consentimento ou remover autorizações devem ser localizáveis, compreensíveis e seguras, inclusive quando envolvem consequências irreversíveis.

## Regras

- usar nomes de ação específicos, como **Exportar meus dados**, **Excluir minha conta** ou **Revogar acesso**;
- explicar consequência e alcance antes da confirmação final;
- distinguir ações reversíveis das irreversíveis;
- oferecer cancelamento claro em ações destrutivas;
- não esconder revogação ou exclusão atrás de navegação desproporcionalmente complexa;
- manter foco previsível ao abrir confirmações e retornar ao contexto quando canceladas;
- comunicar progresso e conclusão de exportações ou exclusões sem depender apenas de cor ou toast efêmero;
- quando a ação for assíncrona, informar estado atual e próximo passo de forma persistente;
- preservar alternativa acessível quando houver download, envio por e-mail ou outra forma de entrega.

## Exemplo conforme

Botão **Excluir minha conta** abre um diálogo chamado **Excluir conta permanentemente** com texto explicando o que será removido, botões **Cancelar** e **Excluir conta**, foco inicial no título ou primeiro elemento apropriado e retorno ao acionador se a pessoa cancelar.

### Comportamento esperado

A pessoa entende exatamente o que acontecerá, consegue desistir sem perder contexto e recebe confirmação persistente após concluir a ação.

## Exemplo não conforme

Um ícone de lixeira sem nome abre uma confirmação genérica **Tem certeza?** com botões **Sim** e **Não**. Após confirmar, aparece por dois segundos apenas uma mensagem visual verde no canto da tela.

### Por que falha

O controle não identifica a ação, a confirmação não explica consequência nem objeto afetado e o resultado pode não ser percebido por tecnologia assistiva.

## Testes mínimos

1. localizar a ação somente por teclado e leitor de tela;
2. validar nome, consequência e objeto afetado;
3. testar cancelamento e retorno de foco;
4. testar conclusão, erro e estado em processamento;
5. confirmar que a pessoa consegue obter ou revogar seus dados sem depender de interação visual exclusiva.
