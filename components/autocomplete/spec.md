# CMP-0022 — Autocomplete

## Status
Rascunho.

## Propósito
Permitir entrada de texto assistida por sugestões previsíveis e acessíveis, preservando edição livre quando o produto permitir e evitando dependência de pistas visuais.

## Princípios
- O campo deve possuir nome claro e persistente.
- Sugestões complementam a entrada; não devem transformar silenciosamente o valor sem ação da pessoa usuária.
- Lista de sugestões, item ativo, estado expandido e seleção precisam ser expostos programaticamente quando aplicáveis.
- Teclado, toque e leitores de tela devem conseguir abrir, navegar, escolher e fechar sugestões.
- Não anunciar a lista inteira a cada caractere; comunicar mudanças significativas de forma moderada.
- Carregamento, erro e ausência de sugestões precisam ser perceptíveis sem mover foco arbitrariamente.
- Search e Autocomplete são contratos distintos: sugestões navegáveis com seleção pertencem ao Autocomplete e exigem estado/semântica próprios.

## Propriedades conceituais
- `label` — nome do campo;
- `value` — texto atual;
- `onValueChange` — alteração do texto;
- `options` — sugestões atuais;
- `onSelect` — seleção de uma sugestão;
- `loading` — carregamento de sugestões;
- `disabled` e `readonly` — estados do campo;
- `allowFreeText` — permite valor fora das sugestões;
- `noResultsText` e `errorText` — feedbacks associados;
- `browserAutocomplete` — política de autofill/histórico do navegador, independente das sugestões do componente Web.

## Semântica Web
Quando houver combobox customizado, seguir o padrão de combobox/listbox: campo com nome acessível, estado expandido, relação com a lista e item ativo programaticamente identificável. Preferir controles nativos ou padrões de plataforma quando disponíveis.

Não aplicar `role="combobox"` sem implementar comportamento de teclado, relação com a lista e estado coerentes. Não inserir palavras como `combobox` ou `opção` no nome acessível apenas para simular papel.

`autocomplete` do HTML controla autofill/histórico do navegador e não substitui `aria-autocomplete`. A política do navegador deve ser configurável pelo produto.

## Teclado e foco
- Tab/Shift+Tab seguem ordem natural e não são reinventados como navegação interna.
- Setas podem mover a opção ativa quando a lista estiver aberta, conforme padrão da plataforma.
- Enter confirma a opção ativa quando aplicável.
- Escape fecha sugestões sem apagar silenciosamente o texto.
- Digitação permanece no campo; foco DOM/virtual não deve saltar para cada sugestão apenas para indicar item ativo.
- Fechar a lista mantém foco lógico no campo, salvo navegação intencional para outro controle.
- Navegação por setas com lista vazia não pode produzir estado inválido nem interceptar teclas sem necessidade.
- Em listas longas, a opção ativa deve permanecer perceptível visualmente sem mover o foco real do campo.
- Com `disabled` ou `readonly`, não abrir nem selecionar sugestões de forma enganosa.

## Seleção e valor
- Seleção deve resultar em valor previsível e comunicar a mudança.
- Quando texto livre não for permitido, erro/validação deve explicar a necessidade de escolher opção válida.
- Não substituir o texto por sugestão destacada apenas ao navegar com setas sem confirmação explícita, a menos que o padrão nativo da plataforma defina isso claramente.
- Opções com rótulos duplicados precisam manter identidade estável no framework; se valores de domínio forem distintos, rótulo e valor devem ser modelados separadamente.

## Sugestões assíncronas
- Aplicar debounce/throttle quando consultas ocorrerem durante a digitação.
- Cancelar respostas obsoletas sem tratá-las como erro visível.
- Loading não deve remover foco nem impedir correção do termo sem necessidade.
- Estado vazio deve informar ausência de sugestões sem transformar a lista em armadilha de foco.
- Respostas fora de ordem devem ser descartadas quando já existir uma consulta mais recente.
- Atualizações assíncronas da coleção precisam fechar ou recalcular o estado expandido quando não houver mais opções válidas.

## Entrada, composição e ponteiro
- Eventos de composição/IME não devem confirmar sugestão antes do término da composição.
- Seleção por toque, caneta ou mouse deve preservar o foco lógico e produzir o mesmo valor da seleção por teclado.
- Pointer events devem ser tratados de forma compatível com mouse e toque quando a implementação Web depender de evitar blur prematuro.

## Integração por plataforma
- wxPython: validar exposição do nome programático e comportamento real do `wx.ComboBox` com JAWS/NVDA; entrada livre versus seleção obrigatória deve ser decisão explícita do host.
- Android: `DropdownMenu` é adaptação experimental; ancoragem, ordem de leitura e foco com TalkBack precisam de evidência antes de promoção.
- iOS: sugestões como botões em fluxo são adaptação experimental; foco VoiceOver, retorno ao campo e listas longas precisam ser testados.
- Flutter: o `TextEditingController` externo usado apenas como valor inicial não deve ser assumido como controlador real do campo interno; ownership de controller/focus precisa ser definido antes de estabilidade.

## Tema, contraste e escala
Respeitar claro, escuro, sistema, forced/high contrast, zoom e text scaling. Item ativo/selecionado não pode depender apenas de cor.

## Alvo mínimo
Ações interativas seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt.

## Exemplos conformes
- campo `Cidade` anuncia que possui sugestões e permite navegar/selecionar sem sair arbitrariamente do campo;
- ao digitar `sant`, sugestões são atualizadas sem anunciar todas repetidamente;
- `Nenhuma cidade encontrada` é informado de forma moderada e o campo continua editável;
- Escape fecha a lista e mantém o texto digitado;
- lista vazia ignora setas sem gerar `aria-activedescendant` inválido;
- resposta antiga para `sa` não substitui sugestões mais recentes de `santa`.

## Exemplos não conformes
- `div` com `role="combobox"` sem suporte real a teclado;
- foco pula para o primeiro resultado a cada caractere;
- item ativo indicado somente por fundo azul;
- Enter seleciona opção diferente da anunciada como ativa;
- lista fecha e apaga o termo ao pressionar Escape;
- todas as sugestões são despejadas em live region a cada atualização;
- setas em lista vazia calculam índice inválido;
- `readonly` continua abrindo a lista ou permitindo seleção;
- resposta assíncrona obsoleta sobrescreve sugestões atuais.

## Matriz mínima
Verificar nome, papel/estado expandido, relação campo-lista, item ativo, abertura/fechamento, teclado, foco, seleção, texto livre, loading, erro, estado vazio, atualizações assíncronas, IME, touch/pointer, duplicidades, browser autofill, múltiplas instâncias, alvo, contraste, escala e tecnologias assistivas.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
