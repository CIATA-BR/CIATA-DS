# Modal e dialog

## Contrato

Modal/dialog representa uma camada de interação que exige atenção temporária. Deve possuir nome acessível, contexto suficiente, foco inicial previsível e retorno de foco ao acionador ao fechar.

## Regras

- mover o foco para dentro do modal quando ele abrir;
- escolher foco inicial conforme a tarefa, evitando cair automaticamente em ação destrutiva;
- manter a navegação restrita ao modal enquanto ele estiver ativo, quando modal;
- impedir que conteúdo de fundo continue operável como se estivesse disponível;
- permitir fechamento por mecanismo previsível, incluindo Escape quando a plataforma e o contexto permitirem;
- devolver o foco ao acionador ou elemento lógico equivalente ao fechar;
- comunicar título e descrição sem duplicação excessiva;
- confirmações destrutivas devem deixar consequência clara antes da ação.

## Web

Preferir `<dialog>` quando o comportamento e suporte forem adequados ou implementar semântica de dialog/modal com gerenciamento completo de foco. `aria-modal` não substitui contenção real de foco e controle do fundo.

## Android e iOS

Preferir componentes nativos de dialog/sheet quando atenderem ao caso. O foco de acessibilidade deve entrar na camada apresentada e retornar ao contexto anterior após o fechamento. Bottom sheets modais seguem o mesmo contrato de foco.

## Exemplo conforme

Ao ativar `Excluir arquivo`, abre-se um diálogo intitulado `Excluir arquivo?`, o foco entra em uma opção segura como `Cancelar` ou no título/contexto conforme o fluxo, o conteúdo de fundo deixa de ser navegável e, ao cancelar, o foco retorna a `Excluir arquivo`.

### Comportamento esperado

A pessoa percebe imediatamente que entrou em um novo contexto, navega apenas pelos controles pertinentes e, ao fechar, continua exatamente do ponto lógico anterior.

## Exemplo não conforme

Uma camada visual aparece sobre a página, mas o foco permanece atrás dela; leitor de tela continua navegando pelo conteúdo de fundo e, ao fechar, o foco volta ao topo da página.

### Por que falha

A pessoa pode não perceber que o modal abriu, pode ativar controles escondidos atrás da camada e perde a continuidade da tarefa ao fechar.

## Critérios de teste

- nome e contexto do diálogo são anunciados;
- foco inicial é coerente e seguro;
- conteúdo de fundo não permanece indevidamente operável;
- teclado/gestos não escapam do modal enquanto ativo;
- fechamento é previsível;
- foco retorna ao acionador ou equivalente lógico;
- zoom e aumento de texto não ocultam ações essenciais.
