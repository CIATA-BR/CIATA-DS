# Receita — Modais, diálogos e bottom sheets

## Objetivo

Garantir que superfícies temporárias sejam percebidas como mudança de contexto, mantenham navegação previsível e devolvam a pessoa usuária ao ponto correto ao serem fechadas.

## Regras comuns

- o conteúdo de fundo não deve permanecer operacional enquanto a superfície modal estiver ativa;
- o foco inicial deve estar dentro da superfície em um ponto lógico;
- título e finalidade devem ser identificáveis;
- ações de fechar, confirmar e cancelar devem ter nomes claros;
- o fechamento deve restaurar o foco ao gatilho quando a jornada continuar no contexto anterior;
- gestos de arraste não podem ser a única forma de fechar ou concluir uma ação quando houver alternativa simples aplicável.

## Web

- usar elemento `dialog` nativo quando adequado ou padrão ARIA de dialog corretamente implementado;
- expor nome acessível por título ou relação equivalente;
- conter a navegação por teclado dentro da superfície enquanto ela estiver modal;
- permitir fechamento por mecanismo explícito e, quando esperado, Escape;
- impedir que conteúdo de fundo receba foco ou interação enquanto o modal estiver aberto.

## Android

- usar componentes de diálogo e bottom sheet nativos quando possível;
- ao abrir, direcionar o foco de acessibilidade para título, instrução principal ou primeiro controle lógico;
- impedir que TalkBack navegue para conteúdo encoberto atrás da superfície;
- manter uma ação de fechamento acessível além de gesto de arraste;
- devolver o foco ao gatilho após fechamento quando aplicável.

## iOS

- apresentar sheets e diálogos com título ou conteúdo inicial identificável pelo VoiceOver;
- manter o conteúdo externo fora da navegação enquanto a superfície estiver ativa;
- oferecer controle explícito para fechar quando o gesto padrão não for suficiente ou não for equivalente;
- restaurar o foco ao elemento que iniciou a apresentação quando a jornada continuar no contexto anterior;
- testar tamanhos dinâmicos de sheet e mudanças de detent para garantir que o foco não salte inesperadamente.

## Bottom sheet com ação principal

Quando uma bottom sheet for aberta por um botão como “Escolher forma de pagamento”:

1. o foco deve entrar na sheet;
2. VoiceOver/TalkBack deve comunicar título ou primeiro conteúdo útil;
3. a navegação deve permanecer na sheet;
4. após seleção, o estado deve ser comunicado;
5. ao fechar, o foco retorna ao botão ou ao próximo ponto lógico da jornada.

## Falhas comuns

- foco permanece atrás do modal;
- conteúdo de fundo continua acessível;
- sheet só pode ser fechada arrastando;
- botão “X” sem nome acessível;
- fechamento envia foco para o topo da tela;
- mudança de altura da sheet move o foco para item inesperado.

## Validação

Testar abertura, navegação interna, ação principal, cancelamento e retorno do foco com teclado e leitor de tela, incluindo rotação ou redimensionamento quando aplicável.