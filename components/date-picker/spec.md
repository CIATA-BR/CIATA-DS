# CMP-0019 — Date Picker

## Status
Rascunho.

## Propósito
Permitir seleção de uma data de forma previsível, acessível e consistente entre teclado, toque, leitores de tela e entrada textual.

## Princípios
- Preferir controles nativos da plataforma quando atenderem ao fluxo e às restrições do produto.
- Não exigir navegação por calendário visual quando entrada textual equivalente for apropriada.
- Formato exibido, valor programático e instruções devem ser claros e localizados.
- Datas indisponíveis precisam ser semanticamente desabilitadas, não apenas acinzentadas.
- Erros de data devem ser associados ao campo e anunciados sem depender de cor.
- Não usar placeholder como único rótulo ou única instrução de formato.

## Propriedades conceituais
- `label` — nome do campo;
- `value` — data selecionada;
- `onChange` — alteração de valor;
- `minDate` e `maxDate` — limites permitidos;
- `disabledDates` — datas indisponíveis;
- `locale` — localização e formato;
- `required`, `disabled`, `readonly` — estados do campo;
- `helperText` e `errorText` — ajuda e erro associados.

## Semântica e entrada
Na Web, preferir `input type="date"` quando o comportamento nativo for compatível com o requisito. O campo deve ter `label` real, `min`/`max` nativos quando aplicáveis, `required`/`disabled` reais e mensagem de erro programaticamente associada. Não substituir o valor ISO por texto ambíguo no atributo `value`.

## Teclado e foco
- O campo segue a ordem natural de Tab.
- A abertura do seletor nativo não deve provocar perda arbitrária de foco.
- Se houver calendário customizado, deve existir navegação por teclado documentada e testada, incluindo movimento entre dias, mês/ano, seleção, Escape e retorno de foco.
- Não criar armadilha de foco.

## Localização e formato
- Exibir formato conforme locale/plataforma.
- Quando entrada textual for aceita, informar o formato esperado em texto persistente ou programaticamente associado.
- O valor submetido deve permanecer não ambíguo e validável.

## Validação
- Datas fora de `minDate`/`maxDate` ou em `disabledDates` não podem ser selecionadas.
- Mensagens devem explicar o problema e, quando útil, o intervalo permitido.
- Não limpar silenciosamente uma data inválida sem feedback.

## Tema, contraste e escala
Respeitar claro, escuro, sistema, forced/high contrast, zoom, text scaling e Dynamic Type. Ícones de calendário não podem ser a única indicação de propósito.

## Alvo mínimo
Controles interativos seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt.

## Exemplos conformes
- campo rotulado `Data de nascimento`, com formato compreensível e seletor nativo;
- data fora do intervalo é indisponível e anunciada como tal;
- erro `Informe uma data entre 01/01/2020 e 31/12/2026` associado ao campo;
- usuário consegue digitar a data sem depender do calendário visual quando a plataforma permitir.

## Exemplos não conformes
- placeholder `DD/MM/AAAA` como único rótulo;
- datas indisponíveis apenas em cinza, mas ainda ativáveis;
- calendário customizado navegável apenas por mouse;
- foco desaparece ao fechar o calendário;
- valor `03/04/05` sem contexto de locale;
- erro mostrado só por borda vermelha.

## Matriz mínima
Verificar nome, valor, locale/formato, entrada textual, abertura/fechamento, foco, teclado, limites, datas indisponíveis, required/disabled/readonly, erros, alvo, contraste, escala e tecnologias assistivas.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
