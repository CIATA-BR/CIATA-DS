# Receita — Foco e mudanças de contexto

## Objetivo

Garantir que o foco de teclado e de acessibilidade permaneça previsível antes, durante e depois de mudanças de contexto.

## Regras comuns

- não mover foco apenas para anunciar conteúdo;
- ao abrir uma superfície modal, levar o foco para um ponto lógico dentro dela;
- ao fechar, devolver o foco ao elemento que iniciou a ação, quando ele ainda existir;
- preservar foco lógico após atualização, rotação, redimensionamento ou recriação de tela;
- não permitir que conteúdo inserido acima do foco atual desloque a pessoa usuária para uma posição inesperada;
- após ação irreversível ou navegação concluída, posicionar o foco onde a continuação da jornada faça sentido.

## Web

- manter ordem DOM coerente com a ordem visual e lógica;
- usar foco programático somente quando houver mudança de contexto que o justifique;
- em diálogos, restringir a navegação ao conteúdo modal enquanto estiver aberto e devolver o foco ao gatilho no fechamento;
- evitar `tabindex` positivo;
- usar `tabindex="-1"` para destinos programáticos não navegáveis por Tab quando necessário;
- não usar `aria-live` para compensar foco mal gerenciado.

## Android

- preservar o foco de acessibilidade ao recompor ou atualizar conteúdo sempre que o elemento lógico continuar existindo;
- em telas modais, folhas inferiores e menus, mover o foco para o conteúdo recém-apresentado sem perder o contexto do gatilho;
- ao fechar, restaurar o foco no controle que abriu a superfície, quando aplicável;
- evitar reconstruções que façam o TalkBack voltar ao topo sem necessidade;
- testar rotação, tela dividida, retomada após troca de aplicativo e recriação de Activity/Compose.

## iOS

- em apresentação modal, posicionar o VoiceOver em título, instrução principal ou primeiro controle lógico;
- ao fechar, devolver o foco ao elemento de origem quando a jornada continuar ali;
- evitar notificações de foco em sequência que provoquem saltos ou fala interrompida;
- preservar o elemento lógico equivalente após atualização de view, navegação interna e mudança de orientação;
- em SwiftUI, verificar se mudanças de identidade da view não recriam elementos de forma que o VoiceOver perca a posição.

## Falhas comuns

- foco volta para o topo após atualização;
- diálogo abre, mas o foco permanece atrás dele;
- modal fecha e o foco desaparece ou vai para elemento aleatório;
- toast ou banner rouba foco;
- streaming ou atualização de conteúdo desloca a leitura continuamente;
- foco visual e foco de acessibilidade apontam para elementos diferentes.

## Validação

Executar a jornada completa com teclado e leitor de tela, incluindo abertura e fechamento de superfícies, atualização de conteúdo, rotação/redimensionamento e retorno após interrupção.