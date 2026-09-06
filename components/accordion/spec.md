# CMP-0014 — Accordion

## Status
Rascunho.

## Propósito
Organizar blocos de conteúdo expansíveis e recolhíveis sem esconder contexto essencial, preservando nome, estado, foco, leitura e ativação previsíveis em todas as plataformas.

## Princípios
- Usar accordion para conteúdo relacionado que possa ser revelado sob demanda; não usar para navegação entre páginas.
- O acionador deve ser um controle nativo, preferencialmente botão, com estado expandido/recolhido programaticamente exposto.
- O título do item deve permanecer visível independentemente do estado.
- Não depender apenas de ícone, rotação ou cor para comunicar expansão.
- Expandir/recolher não deve mover foco arbitrariamente para o painel.
- Não esconder informação crítica atrás de um item recolhido quando ela precisa ser percebida imediatamente.

## Propriedades conceituais
- `items` — coleção ordenada de cabeçalho, conteúdo e estado;
- `expanded` — estado por item;
- `onToggle` — alteração controlada;
- `allowMultiple` — permite múltiplos itens expandidos quando aplicável;
- `allowCollapseAll` — define se todos podem permanecer recolhidos;
- `disabled` — somente para item realmente indisponível.

## Semântica
Na Web, o título deve conter um `button` real. O botão expõe `aria-expanded` e referencia o painel por `aria-controls` quando necessário. O painel pode usar `region` + `aria-labelledby` quando o conteúdo justificar uma região navegável; não criar regiões em excesso para accordions grandes.

## Teclado e foco
- Tab e Shift+Tab percorrem os botões na ordem natural.
- Enter e Espaço alternam o item por comportamento nativo do botão.
- Não exigir setas para operar um accordion comum; setas opcionais só devem ser adicionadas quando o padrão adotado for documentado e testado.
- O foco permanece no botão acionador após expandir/recolher, salvo necessidade funcional explícita.
- Se conteúdo recolhido contém foco por alguma mudança externa, recuperar foco para o cabeçalho correspondente antes de ocultá-lo.

## Conteúdo oculto
Conteúdo recolhido deve sair da renderização/árvore acessível de forma coerente com a plataforma. Não manter controles invisíveis focáveis.

## Um ou vários itens abertos
A política deve ser previsível. Quando apenas um item puder ficar aberto, abrir outro fecha o anterior sem alterar foco indevidamente. Se todos puderem fechar, nenhum item deve ser anunciado como obrigatório sem ser.

## Tamanho alvo
Botões de cabeçalho seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt.

## Tema, reflow e movimento
Respeitar claro, escuro, sistema, forced/high contrast, zoom, text scaling e redução de movimento. Ícones de chevron podem acompanhar o estado visualmente, mas o estado semântico não depende da animação.

## Exemplos conformes
- botão `Detalhes da cobrança` com `aria-expanded="false"` que revela painel associado;
- foco permanece no cabeçalho ao expandir;
- item recolhido remove seus controles da ordem de foco;
- estado expandido indicado semanticamente e também visualmente.

## Exemplos não conformes
- `div` clicável como cabeçalho sem semântica de botão;
- estado indicado apenas por seta girada;
- controles do painel recolhido continuam recebendo Tab;
- foco enviado automaticamente para o primeiro campo do painel a cada expansão;
- cabeçalho recebe nome `Detalhes, botão` quando o recurso de tecnologia assistiva já anuncia o papel;
- recolher item enquanto um descendente possui foco sem recuperação previsível.

## Matriz mínima
Verificar nome, botão nativo, estado expandido, relação cabeçalho-painel, foco, teclado, conteúdo oculto, múltiplos itens, disabled, alvo, tema, alto contraste, zoom/text scaling, reduced motion e recursos de tecnologia assistiva.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com recurso de tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
