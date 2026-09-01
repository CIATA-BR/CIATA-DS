# Expansão de conteúdo e localização

## Objetivo

Garantir que tradução e adaptação regional não quebrem leitura, foco, reflow, controles ou hierarquia da interface.

## Regras

- projetar componentes para expansão de texto sem corte, sobreposição ou perda de função;
- evitar largura fixa para rótulos e ações quando o conteúdo pode variar entre idiomas;
- não truncar texto essencial apenas para preservar layout;
- preservar nomes acessíveis completos mesmo quando a interface visual precisar resumir conteúdo;
- validar quebra de linha, zoom, aumento de fonte e reflow após tradução;
- revisar conteúdo localizado com tecnologia assistiva, não apenas por inspeção visual;
- evitar concatenar fragmentos de frases que produzam gramática incorreta em outros idiomas.

## Exemplo conforme

```html
<button class="acao-flexivel">Continuar para configurações de privacidade</button>
```

O componente admite múltiplas linhas e crescimento sem esconder a ação ou o foco.

## Comportamento esperado

A tradução pode ocupar mais espaço sem perder texto, nome acessível, ordem de leitura ou operabilidade.

## Exemplo não conforme

```html
<button style="width:120px;white-space:nowrap;overflow:hidden">Continuar para configurações de privacidade</button>
```

## Por que falha

Idiomas diferentes podem exigir significativamente mais espaço. Cortes e sobreposições podem esconder informação essencial e tornar controles incompreensíveis.

## Testes mínimos

- expansão de texto;
- zoom e aumento de fonte;
- reflow;
- nomes acessíveis completos;
- traduções com textos longos;
- ausência de concatenação gramaticalmente frágil.
