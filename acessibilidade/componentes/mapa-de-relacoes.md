# Mapa de relações entre padrões

Este documento funciona como atalho de navegação entre componentes, receitas e padrões transversais que costumam ser usados em conjunto. Ele não substitui os contratos específicos; serve para reduzir interpretação isolada e acelerar revisão, implementação e auditoria.

## Controles de seleção e formulário

- [Combobox e select](combobox-select.md) → [Formulários e erros](../receitas/formularios-e-erros.md) → [Foco e contexto](../receitas/foco-e-contexto.md)
- [Campo de texto](campo-de-texto.md) → [Formulários e erros](../receitas/formularios-e-erros.md) → [Mensagens dinâmicas](../receitas/mensagens-dinamicas.md)
- [Autocomplete e sugestões](autocomplete-e-sugestoes.md) → [Combobox e select](combobox-select.md) → [Foco e contexto](../receitas/foco-e-contexto.md)

## Camadas e contexto

- [Modal e dialog](modal-e-dialog.md) → [Modais e bottom sheets](../receitas/modais-e-bottom-sheets.md) → [Foco e contexto](../receitas/foco-e-contexto.md)
- [Popover e conteúdo flutuante](popover-e-conteudo-flutuante.md) → [Tooltip](tooltip.md) / [Menu](menu.md) / [Modal e dialog](modal-e-dialog.md)
- [Toast e alert](toast-e-alert.md) → [Mensagens dinâmicas](../receitas/mensagens-dinamicas.md) → [Erro e sucesso](erro-e-sucesso.md)

## Dados e visualização

- [Tabelas](tabelas.md) → leitura estruturada de dados
- [Data grid e tabelas interativas](data-grid-e-tabelas-interativas.md) → interação matricial, edição, seleção ou virtualização
- [Gráficos e visualização de dados](graficos-e-visualizacao-de-dados.md) → [Mídia e conteúdo visual](../receitas/midia-e-conteudo-visual.md) → [Zoom, reflow e texto](../receitas/zoom-reflow-e-texto.md)
- [Mapas e conteúdo espacial](mapas-e-conteudo-espacial.md) → [Mídia e conteúdo visual](../receitas/midia-e-conteudo-visual.md) → [Gestos e drag and drop](../receitas/gestos-e-drag-and-drop.md)

## Movimento, ajuste e manipulação

- [Slider e stepper](slider-e-stepper.md) → controle de valor contínuo ou incremental
- [Stepper e progresso de etapas](stepper-e-progresso-de-etapas.md) → navegação por etapas de jornada
- [Drag and drop](drag-and-drop.md) → [Gestos e drag and drop](../receitas/gestos-e-drag-and-drop.md)
- [Animação e redução de movimento](animacao-e-reducao-de-movimento.md) → [Redução de movimento e efeitos](reducao-de-movimento-e-efeitos.md)

## Autenticação e segurança

- [Recuperação de senha](recuperacao-de-senha.md) → [Autenticação acessível](../receitas/autenticacao-acessivel.md) → [Formulários e erros](../receitas/formularios-e-erros.md)
- [OTP e verificação](otp-e-verificacao.md) → [Autenticação acessível](../receitas/autenticacao-acessivel.md) → [Conteúdo sensível a tempo](conteudo-sensivel-a-tempo.md)
- [Confirmação destrutiva e prevenção de erro](confirmacao-destrutiva-e-prevencao-de-erro.md) → [Modal e dialog](modal-e-dialog.md) → [Mensagens de erro, sucesso e orientação](mensagens-de-erro-sucesso-e-orientacao.md)

## Teste, evidência e release

- [Testes e automação de acessibilidade](testes-e-automacao-de-acessibilidade.md) → [Evidências de auditoria](../evidencias-de-auditoria.md)
- [Regressão de acessibilidade e CI](regressao-de-acessibilidade-e-ci.md) → [Gate de acessibilidade para release](gate-de-acessibilidade-para-release.md)
- [Rastreabilidade de achados, correções e reteste](rastreabilidade-de-achados-correcoes-e-reteste.md) → [Conformidade contínua e monitoramento](conformidade-continua-e-monitoramento.md)

## Como usar

Ao revisar um componente ou jornada, comece pelo contrato específico e percorra apenas as relações que forem aplicáveis ao contexto. O objetivo é ampliar a cobertura sem transformar toda implementação em leitura obrigatória de toda a base documental.
