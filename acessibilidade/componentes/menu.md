# Menu

## Contrato

Menu apresenta um conjunto de ações ou comandos relacionados. Deve comunicar abertura, foco e seleção de forma previsível e não deve ser usado para qualquer lista de links apenas por aparência.

## Regras

- o acionador deve comunicar que abre um menu e seu estado aberto/fechado;
- ao abrir, o foco deve entrar de forma previsível quando o padrão exigir interação modal com o menu;
- setas, Home/End, Enter/Espaço e Escape devem seguir a convenção do componente adotado;
- Escape deve fechar e devolver foco ao acionador;
- itens desabilitados devem comunicar indisponibilidade;
- não misturar arbitrariamente navegação Tab tradicional com roving tabindex sem um padrão definido;
- em mobile, preservar equivalência com exploração por toque e gestos do leitor de tela;
- listas simples de navegação podem ser melhores que um padrão de menu quando não há necessidade de interação de menu.

## Web

Use semântica de menu apenas para interfaces que realmente seguem o padrão de menu de aplicação. Para navegação comum, prefira listas e links nativos. O botão acionador deve expor estado expandido e relação com o conteúdo quando apropriado.

## Android

Preferir menus nativos ou equivalentes do toolkit. O foco de acessibilidade deve entrar nos itens e retornar ao acionador ao fechar. Não transformar texto estático em itens clicáveis sem função exposta.

## iOS

Usar menus e ações nativos quando adequados. VoiceOver deve anunciar o acionador, as opções e seus estados de forma coerente; ao dispensar, o foco retorna ao contexto anterior.

## Exemplo conforme

```html
<button aria-haspopup="menu" aria-expanded="false">Mais opções</button>
<ul role="menu">
  <li role="menuitem" tabindex="-1">Renomear</li>
  <li role="menuitem" tabindex="-1">Excluir</li>
</ul>
```

A implementação completa controla foco, setas e Escape conforme o padrão escolhido.

## Comportamento esperado

O acionador comunica que possui menu. Ao abrir, as opções ficam navegáveis de forma previsível; ao fechar com Escape, o foco retorna a `Mais opções`.

## Exemplo não conforme

```html
<div class="menu">
  <span>Renomear</span>
  <span>Excluir</span>
</div>
```

Os itens respondem apenas a clique de mouse, sem função, foco ou navegação por teclado.

## Por que falha

A pessoa pode perceber conteúdo visualmente parecido com menu, mas os comandos não entram na ordem de foco e não são operáveis por teclado ou leitor de tela.

## Critérios de teste

- acionador anuncia relação/estado quando aplicável;
- foco entra e sai de forma previsível;
- teclado segue a convenção definida;
- Escape fecha e retorna ao acionador;
- itens desabilitados são comunicados;
- leitor de tela identifica corretamente itens e ações.