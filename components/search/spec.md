# CMP-0021 — Search

## Status
Rascunho.

## Propósito
Permitir que a pessoa localize conteúdo por texto de forma previsível, acessível e eficiente, com nome claro, envio explícito, resultados compreensíveis e estados de carregamento/erro/vazio perceptíveis.

## Princípios
- Preferir campo de busca nativo com rótulo persistente ou nome acessível inequívoco.
- Busca pode ocorrer por envio explícito ou atualização incremental, mas o comportamento deve ser previsível e documentado.
- Não depender apenas de placeholder para nome ou instrução.
- Resultados, ausência de resultados, carregamento e erros devem ser perceptíveis sem mover foco arbitrariamente.
- Não anunciar cada caractere digitado ou cada atualização intermediária de forma intrusiva.
- Limpar busca deve ser uma ação explícita com nome acessível próprio quando houver controle dedicado.

## Propriedades conceituais
- `label` — nome do campo;
- `value` — termo atual;
- `onChange` — alteração do texto;
- `onSubmit` — envio da busca;
- `placeholder` — dica opcional, nunca substituto do rótulo;
- `disabled` e `readonly` — estados do campo;
- `loading` — busca em andamento;
- `resultsCount` — quantidade conhecida de resultados;
- `errorText` — erro associado;
- `clearable` — permite limpar o termo.

## Semântica
Na Web, usar `<form role="search">` ou landmark equivalente quando a busca representar funcionalidade relevante da página/site. O campo deve possuir `label` real; `input type="search"` é preferível quando adequado. Botões de enviar e limpar devem ser controles nativos e nomeados.

Se houver múltiplas regiões de busca na mesma página, cada landmark deve possuir nome distinto.

## Teclado e foco
- Tab/Shift+Tab seguem ordem natural.
- Enter envia quando o fluxo for de busca explícita.
- Escape não deve apagar o termo silenciosamente; só limpar quando esse comportamento for documentado e não conflitar com a plataforma.
- Atualizar resultados não move foco automaticamente para a lista.
- Ao limpar pelo botão dedicado, foco permanece em ponto lógico, normalmente no campo.

## Resultados e feedback
- Mudanças de resultado podem ser anunciadas por região de status moderada, por exemplo `12 resultados encontrados`, sem despejar toda a lista em live region.
- Estado vazio deve informar que não houve resultados e manter opção de ajustar o termo.
- Erros devem ser específicos, persistentes até resolvidos e associados ao fluxo.
- Loading não deve tornar o campo inutilizável sem necessidade; se a busca puder continuar sendo editada, preservar essa possibilidade.

## Busca incremental
Quando a busca ocorrer durante a digitação:
- aplicar debounce/throttle suficiente para evitar requisições e anúncios excessivos;
- não anunciar cada tecla;
- preservar o foco no campo;
- cancelamentos de requisições anteriores não devem gerar mensagens de erro para a pessoa usuária.

## Tema, contraste e escala
Respeitar claro, escuro, sistema, forced/high contrast, zoom e text scaling. Ícone de lupa ou `X` não pode ser a única fonte do nome dos controles.

## Alvo mínimo
Ações interativas seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt.

## Exemplos conformes
- campo `Buscar na biblioteca` com botão `Buscar` e região de status `8 resultados encontrados`;
- atualização incremental mantém foco no campo e anuncia apenas mudanças significativas;
- botão `Limpar busca` retorna o campo a vazio sem remover o rótulo;
- estado vazio informa `Nenhum resultado para “braille”` e mantém o campo disponível.

## Exemplos não conformes
- lupa sem nome acessível como único meio de enviar;
- placeholder `Buscar` usado como único rótulo;
- foco salta para o primeiro resultado a cada caractere;
- live region anuncia todos os resultados repetidamente;
- limpar busca apaga o texto ao pressionar Escape sem documentação e sem expectativa da plataforma;
- erro mostrado somente em vermelho.

## Matriz mínima
Verificar nome, landmark, envio, limpar, teclado, foco, loading, erro, estado vazio, contagem de resultados, busca incremental, anúncios, alvo, contraste, escala e tecnologias assistivas.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
