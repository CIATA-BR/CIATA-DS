# Breadcrumbs e skip links

## Contrato

Breadcrumbs informam posição dentro de uma hierarquia de navegação. Skip links permitem ignorar blocos repetitivos e chegar diretamente ao conteúdo ou a outra região essencial.

## Regras

- breadcrumbs devem estar em uma região de navegação identificável;
- a página atual deve ser distinguível sem depender apenas de aparência;
- não transformar o último item em link para a própria página sem necessidade;
- skip link deve ser o primeiro ou um dos primeiros elementos focáveis;
- ao ativar um skip link, o foco deve chegar ao destino lógico, não apenas rolar visualmente;
- skip links devem ficar visíveis quando recebem foco;
- não exigir que a pessoa atravesse menus repetidos em todas as páginas antes de alcançar o conteúdo principal.

## Web

Breadcrumbs podem usar `nav` com nome acessível e lista ordenada, marcando a página atual com `aria-current="page"`. O skip link deve apontar para um destino focável ou capaz de receber foco programaticamente de modo previsível.

## Android e iOS

Quando o padrão equivalente existir em navegação nativa, preservar a noção de hierarquia e retorno. Em telas longas ou estruturas com regiões repetitivas, oferecer mecanismos equivalentes para alcançar conteúdo essencial sem navegação excessiva.

## Exemplo conforme

```html
<a class="skip-link" href="#conteudo">Ir para o conteúdo principal</a>

<nav aria-label="Breadcrumb">
  <ol>
    <li><a href="/">Início</a></li>
    <li><a href="/conta">Minha conta</a></li>
    <li aria-current="page">Segurança</li>
  </ol>
</nav>

<main id="conteudo" tabindex="-1">
  <h1>Segurança</h1>
</main>
```

## Comportamento esperado

Ao pressionar Tab no início da página, a pessoa encontra `Ir para o conteúdo principal`. Ao ativá-lo, o foco chega ao conteúdo principal. No breadcrumb, a localização atual é percebida como `Segurança`, página atual.

## Exemplo não conforme

```html
<div>Início > Minha conta > Segurança</div>
<a href="#conteudo" style="display:none">Pular</a>
```

## Por que falha

O breadcrumb é apenas texto visual, sem relação de navegação ou indicação semântica da página atual. O skip link oculto com `display:none` não entra na ordem de foco e não pode ser utilizado por teclado.

## Critérios de teste

- skip link é alcançável por teclado e visível ao receber foco;
- ativação move o foco para o destino esperado;
- breadcrumb é identificado como navegação;
- página atual é anunciada semanticamente;
- a ordem dos itens corresponde à hierarquia real.