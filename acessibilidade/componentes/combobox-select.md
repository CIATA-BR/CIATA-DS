# Combobox e select

## Contrato

Combobox/select permite escolher um valor em uma lista. Deve expor nome, valor atual, estado expandido/recolhido e relação com a lista de opções.

## Regras

- preferir controle nativo quando atender ao caso;
- o rótulo deve permanecer disponível fora do placeholder;
- valor atual e opção selecionada devem ser perceptíveis;
- expansão e recolhimento devem ser anunciados;
- opções devem possuir ordem e foco previsíveis;
- busca interna, quando existir, deve ser operável por teclado e leitor de tela;
- Escape deve fechar sem apagar a seleção; Enter/Espaço e setas devem seguir a convenção da plataforma;
- não transformar uma lista visual em vários elementos clicáveis sem semântica de opção.

## Web

Preferir `<select>` para seleção simples. Em combobox customizado, seguir o padrão ARIA apropriado com `combobox`, controle de expansão, lista associada e opção ativa, evitando adicionar ARIA redundante a elementos nativos.

## Android e iOS

Preferir componentes nativos ou equivalentes do toolkit. O leitor de tela deve receber o nome do campo, valor atual e contexto de seleção. A abertura da lista não deve perder o foco lógico nem exigir gestos exclusivamente visuais.

## Exemplo conforme

```html
<label for="estado">Estado</label>
<select id="estado" name="estado">
  <option value="SP">São Paulo</option>
  <option value="RJ">Rio de Janeiro</option>
</select>
```

### Comportamento esperado

Ao focar o controle, a pessoa recebe informação equivalente a `Estado, São Paulo, caixa de combinação` e consegue abrir, percorrer opções e selecionar usando teclado ou tecnologia assistiva.

## Exemplo não conforme

Uma `div` visual contendo o texto `São Paulo` abre outra `div` com opções clicáveis, sem função, estado expandido ou foco por teclado.

### Por que falha

O componente pode parecer um select visualmente, mas a tecnologia assistiva não identifica sua função, seu valor ou a relação com as opções. A seleção pode ficar impossível sem mouse/toque.

## Critérios de teste

- nome, função, valor e estado são anunciados;
- abrir e fechar preserva foco previsível;
- setas/gestos equivalentes percorrem opções;
- seleção é anunciada e persiste;
- busca, quando houver, não quebra a navegação;
- zoom e aumento de texto não ocultam opções essenciais.
