# Assets visuais e mascotes

## Contrato

Assets visuais do CIATA Design System devem ser produzidos com intenção acessível desde a origem. Imagens, ilustrações, ícones, personagens e mascotes podem reforçar identidade e compreensão, mas nunca podem ser a única fonte de informação necessária para concluir uma tarefa.

Este documento complementa [Imagens e ícones](imagens-e-icones.md) e organiza critérios de produção para novos assets.

## Regras

- classificar o asset como decorativo, informativo, funcional ou complexo antes de produzir variações;
- definir alternativa textual e papel semântico no mesmo momento em que o asset é especificado;
- não depender de cor, expressão facial, posição ou gesto visual para comunicar estado essencial;
- manter contraste e legibilidade compatíveis com os fundos e temas suportados;
- evitar texto rasterizado quando o conteúdo puder existir como texto real;
- produzir variações necessárias para tema claro, escuro, alto contraste ou fundo alternativo quando aplicável;
- documentar quando o asset deve ser ocultado da árvore de acessibilidade;
- garantir que versões animadas tenham alternativa estática ou comportamento compatível com redução de movimento;
- mascotes não substituem mensagens de erro, sucesso, alerta, instrução ou confirmação.

## Exemplo conforme

Uma tela de sucesso exibe o mascote comemorando, mas também possui o título textual `Cadastro concluído` e a próxima ação `Ir para a página inicial`.

### Comportamento esperado

A pessoa entende o resultado e a próxima ação mesmo que o mascote esteja oculto da árvore de acessibilidade.

## Exemplo não conforme

Uma tela mostra apenas o mascote com expressão triste para indicar falha e disponibiliza um botão genérico `Tentar novamente` sem mensagem textual explicando o problema.

### Por que falha

A informação crítica depende de interpretação visual e contexto implícito.

## Critérios de teste

- remover o asset visual não elimina informação essencial;
- contraste e leitura permanecem adequados em temas suportados;
- alternativa textual é proporcional à função do asset;
- assets decorativos não geram ruído no leitor de tela;
- animações respeitam redução de movimento;
- mascotes nunca substituem semântica, texto ou feedback funcional.
