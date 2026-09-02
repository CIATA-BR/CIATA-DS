# CMP-0006 — Link / Link de navegação

## Status

Rascunho.

## Propósito

Permitir navegação para outro recurso, página, seção ou destino. Use Link para navegação; use Button para executar ações no contexto atual.

## Princípio de implementação

Preferir o elemento nativo de link da plataforma e preservar nome acessível, papel, destino, foco, ativação e comportamento de navegação.

## Propriedades conceituais

- `label` — texto visível e nome acessível do link;
- `href` ou destino equivalente — recurso de destino;
- `external` — indica navegação externa quando necessário;
- `newWindow` — indica abertura em novo contexto quando permitida e claramente comunicada;
- `disabled` — evitar para links; quando o destino não está disponível, preferir remover o link e manter texto/contexto apropriado;
- `visited` — estado visual quando a plataforma suportar;
- `onActivate` — somente para instrumentação sem substituir a navegação nativa.

## Semântica e nome acessível

O texto deve descrever o destino ou propósito fora do contexto imediato sempre que possível. Evitar textos vagos como `clique aqui`, `saiba mais` repetido ou URLs cruas quando houver nome mais útil.

Não acrescentar a palavra `link` ao nome acessível quando a tecnologia assistiva já anuncia o papel.

## Link versus Button

- Link navega para outro destino.
- Button executa ação no contexto atual.
- Não estilizar Button como Link para navegação.
- Não usar Link com JavaScript para simular ação de botão quando um controle nativo de botão resolver.

## Destinos externos e nova janela

Quando abrir domínio externo, nova janela ou novo aplicativo, comunicar antecipadamente quando isso puder surpreender a pessoa usuária. A mensagem não deve depender apenas de ícone.

Não forçar nova janela sem necessidade. Quando houver nova janela, manter indicação textual ou programática consistente.

## Teclado e foco

Preservar comportamento nativo:

- `Tab` move foco para links operáveis;
- `Enter` ativa o link;
- foco visível não pode ser removido;
- ordem de foco deve seguir a leitura e navegação lógica;
- não criar atalhos ou interceptações que quebrem comandos de tecnologia assistiva.

## Touch e área de interação

A área acionável deve seguir o padrão interno de 44 × 44 unidades lógicas quando aplicável sem transformar grandes blocos de conteúdo em áreas de ativação ambíguas. Android pode preservar 48 dp nativos; iOS deve preservar pelo menos 44 × 44 pt.

Links inline em texto corrido podem manter a geometria do texto quando ampliar artificialmente a área prejudicaria leitura ou seleção; nesse caso, garantir espaçamento e legibilidade adequados.

## Aparência e identificação

Links precisam ser identificáveis como interativos sem depender apenas de cor. Sublinhado é a preferência para links em corpo de texto. Em navegação estrutural, outros padrões podem ser usados desde que estados e affordance sejam claros.

Estados hover, focus e visited não podem remover a identificação do link.

## Estado visited

Quando suportado, visited pode ajudar orientação. Nunca usar visited para expor informações sensíveis nem depender dele como única indicação de progresso.

## Links de download

Quando o link iniciar download, informar tipo e, quando útil, tamanho do arquivo antes da ativação. Exemplo: `Relatório anual, PDF, 2 MB`.

## Conteúdo e linguagem

- preferir nomes específicos e breves;
- evitar repetir `saiba mais` sem contexto;
- não incluir `link` no texto apenas para informar o papel;
- indicar idioma, formato, domínio externo ou novo contexto quando isso for relevante para a decisão;
- preservar significado quando o link for lido isoladamente.

## Tokens e tema

Consumir tokens canônicos de texto de ação, foco, foco-contraste, estados visited/disabled quando existirem, tipografia e espaçamento. Respeitar claro, escuro, sistema e forced colors.

## Exemplos conformes

- `Política de privacidade` como link para a política;
- `Baixar relatório anual, PDF, 2 MB` para download;
- link externo com aviso compreensível quando abrir outro contexto;
- link em corpo de texto sublinhado e com foco visível.

## Exemplos não conformes

- `clique aqui` sem contexto;
- `div` clicável simulando link;
- link usado para enviar formulário;
- remoção de `outline` sem alternativa de foco;
- nova janela sem qualquer indicação quando surpreendente;
- identificação do link somente por cor.

## Matriz mínima de testes

Cada implementação deve verificar:

- nome e papel;
- destino correto;
- navegação por teclado;
- foco visível e retorno coerente;
- identificação sem depender só de cor;
- links externos/nova janela;
- downloads;
- visited quando suportado;
- touch e target size quando aplicável;
- tema claro/escuro;
- forced colors/alto contraste;
- zoom/text scaling;
- tecnologias assistivas relevantes.

## Validação manual

Antes de ser considerada estável, cada implementação deve possuir evidência real de teste com tecnologias assistivas relevantes.

## Critérios de aceite para a especificação

- [ ] distinção Link versus Button definida;
- [ ] nome, papel e destino definidos;
- [ ] foco e teclado aprovados;
- [ ] regras de externo/nova janela/download definidas;
- [ ] identificação visual e estados definidos;
- [ ] tokens e tema definidos;
- [ ] matriz mínima de testes aprovada;
- [ ] implementações permanecem experimentais até validação manual real.

## Implementações planejadas

- Web;
- Laravel/PHP;
- Python desktop;
- Android/Jetpack Compose;
- iOS/SwiftUI;
- Flutter.
