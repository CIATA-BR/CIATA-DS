# Gestos, arraste e ações alternativas

## Contrato de experiência

Nenhuma ação essencial deve depender exclusivamente de gesto complexo, caminho específico, arraste ou movimento preciso. Sempre que a ação puder ser realizada por acionamento simples, teclado, menu de ações ou controle equivalente, essa alternativa deve existir.

## Regras comuns

- não use gesto complexo como única forma de concluir uma tarefa;
- forneça alternativa por acionamento simples para arraste quando aplicável;
- não dependa de velocidade, trajetória ou precisão motora sem alternativa;
- permita cancelar ou desfazer ações de alto impacto quando possível;
- mantenha alvos suficientemente grandes e separados;
- preserve equivalência funcional entre toque, teclado, leitor de tela, switch e outras entradas;
- documente gestos adicionais como atalhos, nunca como única via essencial.

## Web

- operações drag-and-drop devem ter alternativa por botões, menus ou teclado;
- componentes customizados devem definir interação por teclado coerente com o padrão adotado;
- não capture eventos de ponteiro de forma que impeça tecnologia assistiva ou teclado;
- mudanças de posição devem ser anunciadas de forma suficiente sem excesso de fala.

## Android

- exponha ações acessíveis equivalentes via semântica e ações customizadas quando necessário;
- não dependa apenas de swipe customizado para função essencial;
- teste com TalkBack, Switch Access e teclado físico;
- em reordenação, ofereça ações como mover para cima/baixo ou escolha de posição quando o arraste não for acessível.

## iOS

- use `accessibilityCustomActions` quando uma ação visual ou gestual precisar de equivalente acessível;
- não substitua o gesto padrão do VoiceOver por interação conflitante;
- para reordenação ou drag-and-drop, ofereça ação alternativa claramente nomeada;
- teste com VoiceOver, Switch Control e teclado físico quando aplicável.

## Verificação

- toda ação essencial possui caminho sem gesto complexo;
- drag-and-drop possui alternativa funcional equivalente;
- ações podem ser executadas sem precisão motora fina excessiva;
- leitor de tela e switch não perdem acesso ao controle;
- alvos e espaçamento são adequados;
- cancelamento ou reversão existe quando o impacto justificar.
