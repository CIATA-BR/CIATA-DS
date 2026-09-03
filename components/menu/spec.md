# CMP-0015 — Menu

## Status
Rascunho.

## Propósito
Apresentar um conjunto compacto de ações ou opções relacionadas, com abertura, fechamento, foco, navegação e estados previsíveis, sem confundir menu de ações com navegação comum de página.

## Princípios
- Usar Menu para ações/opções compactas; navegação persistente entre páginas deve preferir links/listas de navegação.
- O acionador deve ser um controle nativo com nome claro e estado de abertura exposto quando aplicável.
- O menu deve possuir contexto/nome compreensível quando necessário.
- Itens devem usar papéis coerentes com a ação; não transformar tudo em links ou tudo em botões por conveniência.
- Não depender apenas de posição, ícone ou cor para comunicar item ativo, marcado ou indisponível.
- Fechar o menu deve restaurar foco de maneira previsível ao acionador quando apropriado.

## Propriedades conceituais
- `triggerLabel` — nome do acionador;
- `items` — coleção ordenada de ações/opções;
- `open` — estado controlado de abertura;
- `onOpenChange` — abertura/fechamento;
- `placement` — preferência visual, sem alterar semântica;
- `disabled` — item indisponível;
- `checked` — para itens de escolha quando o padrão suportar;
- `submenu` — somente quando realmente necessário e suportado pela plataforma.

## Semântica
Na Web, aplicar `role="menu"` e `role="menuitem"` apenas quando o comportamento de menu de aplicação for realmente implementado. Para uma simples lista de links de navegação, usar navegação/lista/links nativos. O acionador pode expor `aria-haspopup="menu"` e `aria-expanded`; quando o menu estiver aberto, manter relação compreensível entre acionador e conteúdo.

## Teclado e foco
- Enter/Espaço no acionador abre o menu por comportamento nativo do botão.
- Ao abrir um menu de aplicação, foco entra no item apropriado; setas percorrem itens conforme a orientação/padrão.
- Home/End podem mover para primeiro/último item quando suportado.
- Escape fecha o menu e devolve foco ao acionador.
- Tab não deve ser reinventado como navegação interna quando o padrão exige setas; ao sair do menu, o comportamento deve ser previsível.
- Itens disabled não podem ser ativados; a estratégia de foco deve seguir o padrão nativo/adotado e ser validada.

## Abertura e fechamento
O menu pode fechar ao escolher uma ação, pressionar Escape, acionar novamente o gatilho ou interagir fora, conforme a plataforma. Fechamentos automáticos não devem causar perda de foco nem descartar estado necessário.

## Submenus
Evitar submenus profundos. Quando existirem, devem comunicar disponibilidade, abertura, direção e foco sem exigir hover. Touch e leitor de tela precisam de caminho equivalente.

## Alvos e espaçamento
Itens e acionador seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt. Separadores visuais não recebem foco.

## Tema, reflow e movimento
Respeitar claro, escuro, sistema, forced/high contrast, zoom, text scaling e redução de movimento. Posicionamento visual pode mudar para caber na viewport sem alterar ordem lógica.

## Exemplos conformes
- botão `Mais ações` abre menu, move foco ao primeiro item e Escape fecha retornando foco ao botão;
- lista de navegação permanece lista de links, sem `role="menu"` artificial;
- item marcado expõe estado programaticamente e não apenas por ícone;
- menu reposicionado para caber na tela mantém a mesma ordem de leitura e foco.

## Exemplos não conformes
- `div` clicável como acionador sem semântica de botão;
- lista comum de links convertida em `menu/menuitem` sem implementar teclado correspondente;
- menu que abre apenas com hover;
- Escape fecha mas foco se perde no `body`;
- item disabled continua ativável;
- submenu inacessível por teclado ou touch;
- nomes como `Excluir, item de menu` quando a tecnologia assistiva já anuncia o papel.

## Matriz mínima
Verificar acionador, estado aberto, menu/item, link versus ação, foco inicial, setas, Home/End, Escape, fechamento, retorno de foco, disabled, checked, submenu, clique/toque externo, alvo, contraste, zoom/text scaling e tecnologias assistivas.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
