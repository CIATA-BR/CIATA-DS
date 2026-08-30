# Componentes canônicos de acessibilidade

Esta área define o contrato mínimo de acessibilidade dos componentes do CIATA Design System. O objetivo é garantir que a mesma intenção de interação seja preservada em Web, Android e iOS, respeitando as convenções nativas de cada plataforma.

Os documentos desta pasta complementam as [receitas de acessibilidade](../receitas/README.md), a [base canônica WCAG 2.2](../wcag-2.2/README.md) e o [processo de auditoria](../processo-de-auditoria.md).

## Regras comuns

Todo componente interativo deve:

- possuir nome acessível claro e estável;
- expor função, estado e valor quando aplicáveis;
- ser operável pelos mecanismos de entrada relevantes da plataforma;
- possuir foco perceptível e previsível;
- manter alvo de interação adequado;
- comunicar desabilitação, seleção, expansão, erro e carregamento quando aplicáveis;
- preservar equivalência entre interação visual, teclado, toque e tecnologia assistiva;
- preferir componente nativo quando ele atende ao comportamento desejado;
- evitar semântica customizada quando a semântica nativa equivalente já existe.

## Padrão de exemplos práticos

Cada componente deve incluir, sempre que possível:

1. **Exemplo conforme:** implementação ou comportamento que preserva nome, função, estado, valor, foco e operação esperados.
2. **Comportamento esperado:** o que teclado, leitor de tela e demais tecnologias assistivas devem perceber.
3. **Exemplo não conforme:** erro de implementação recorrente e plausível.
4. **Por que falha:** impacto funcional e semântico causado pela inconformidade.

Os exemplos de código Web são ilustrativos. Em Android e iOS, o mesmo contrato deve ser preservado usando os componentes e APIs nativas ou equivalentes do toolkit adotado.

O exemplo conforme não substitui teste real. Um trecho de código semanticamente correto ainda pode falhar por CSS, gerenciamento de foco, ordem de navegação, conteúdo dinâmico ou integração com o restante da interface.

## Componentes fundamentais

- [Botão](botao.md)
- [Link](link.md)
- [Campo de texto](campo-de-texto.md)
- [Checkbox e radio](checkbox-e-radio.md)
- [Switch](switch.md)

## Componentes compostos

- [Combobox e select](combobox-select.md)
- [Tabs](tabs.md)
- [Accordion](accordion.md)
- [Modal e dialog](modal-e-dialog.md)
- [Toast e alert](toast-e-alert.md)

## Estados e padrões transversais

- [Loading e progress](loading-e-progress.md)
- [Disabled e read-only](disabled-e-readonly.md)
- [Erro e sucesso](erro-e-sucesso.md)
- [Tooltip](tooltip.md)
- [Menu](menu.md)
- [Paginação](paginacao.md)
- [Tabelas](tabelas.md)

Esses padrões atravessam diferentes componentes e devem ser aplicados em conjunto com o contrato específico de cada controle. Por exemplo, um botão em carregamento continua sendo um botão; um campo somente leitura continua expondo seu rótulo e valor; uma tabela com ordenação continua exigindo controles de ordenação semanticamente corretos.

## Navegação e estrutura de página

- [Landmarks e cabeçalhos](landmarks-e-cabecalhos.md)
- [Breadcrumbs e skip links](breadcrumbs-e-skip-links.md)
- [Cards e listas](cards-e-listas.md)
- [Busca e filtros](busca-e-filtros.md)

Esses padrões organizam como componentes formam jornadas completas. A estrutura semântica, a ordem de leitura, os atalhos de navegação e o feedback de atualização devem continuar compreensíveis mesmo quando o layout visual muda.

## Validação mínima por componente

Cada componente deve ser validado, quando aplicável, com:

1. teclado ou mecanismo equivalente;
2. leitor de tela principal da plataforma;
3. foco visual e foco de acessibilidade;
4. estados normal, focado, pressionado, selecionado, desabilitado, inválido ou carregando conforme o componente;
5. aumento de texto, zoom ou configuração de fonte da plataforma;
6. contraste e percepção sem depender apenas de cor;
7. reteste após alterações de implementação.

Componentes compostos exigem atenção adicional a foco, relação entre controles e conteúdo, anúncio de mudanças de estado e retorno ao contexto anterior.
