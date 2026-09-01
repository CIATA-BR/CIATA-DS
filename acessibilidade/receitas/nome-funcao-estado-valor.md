# Receita — Nome, função, estado e valor

## Objetivo

Garantir que controles e elementos interativos exponham informação suficiente para que a pessoa usuária compreenda o que são, o que fazem, em que estado estão e, quando aplicável, qual valor possuem.

## Regra comum

Um controle acessível deve comunicar, conforme o caso:

- nome;
- função;
- estado;
- valor;
- relação com outros elementos;
- instrução adicional somente quando necessária.

O nome deve ser curto, estável e descrever a finalidade. Não repetir informação que a plataforma já anuncia automaticamente.

## Web

- usar elementos HTML nativos sempre que possível;
- associar rótulos por `label`/`for`, conteúdo textual ou nome acessível equivalente;
- usar ARIA somente quando a semântica nativa não for suficiente;
- refletir estados como expandido, selecionado, pressionado, inválido e desabilitado com atributos compatíveis com o papel do componente;
- evitar `aria-label` quando texto visível adequado já pode fornecer o nome acessível;
- garantir coerência entre nome visível e nome acessível, especialmente para comandos por voz.

## Android

- preferir componentes nativos e semântica padrão da plataforma;
- fornecer descrição somente quando o texto visível não produzir nome acessível adequado;
- expor estado selecionado, marcado, expandido, desabilitado e valor por APIs de acessibilidade compatíveis com o componente;
- evitar concatenar manualmente palavras como “botão” quando o papel já é anunciado pelo TalkBack;
- em componentes customizados, garantir nó acessível, ação, papel e estado equivalentes ao controle nativo correspondente.

## iOS

- preferir controles UIKit/SwiftUI nativos quando possível;
- definir label, traits, value e hint apenas conforme necessário;
- usar `accessibilityValue` para estado ou valor variável quando ele não estiver exposto pela semântica padrão;
- evitar inserir no label termos que o VoiceOver já anuncia pela trait;
- em controles customizados, garantir traits e ações coerentes com a operação visual.

## Exemplo de contrato

Um card que executa pagamento não deve ser anunciado apenas como “Março”. O nome deve carregar a finalidade e a informação essencial, por exemplo: “Pagar fatura de março no valor de R$ 120,00”, enquanto a plataforma anuncia o papel do controle.

## Falhas comuns

- nome ausente ou genérico;
- label desconectada do controle;
- estado visual não exposto à tecnologia assistiva;
- nome acessível diferente do texto visível sem necessidade;
- papel duplicado no nome;
- componentes customizados sem ação equivalente;
- valores dinâmicos que mudam visualmente mas não são expostos.

## Validação

Verificar com leitor de tela e, quando aplicável, linha Braille se nome, função, estado e valor são compreensíveis sem depender de contexto visual externo.
