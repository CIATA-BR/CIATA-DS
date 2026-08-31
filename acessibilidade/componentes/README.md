# Componentes canônicos de acessibilidade

Esta área define o contrato mínimo de acessibilidade dos componentes do CIATA Design System. O objetivo é garantir que a mesma intenção de interação seja preservada em Web, Android e iOS, respeitando as convenções nativas de cada plataforma.

Os documentos desta pasta complementam as [receitas de acessibilidade](../receitas/README.md), a [base canônica WCAG 2.2](../wcag-2.2/README.md) e o [processo de auditoria](../processo-de-auditoria.md).

Consulte também os [critérios de aceite dos componentes](criterios-de-aceite.md) para transformar esses contratos em validações objetivas de entrega.

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

## Conteúdo e comunicação

- [Imagens e ícones](imagens-e-icones.md)
- [Estados vazios e confirmações](estados-vazios-e-confirmacoes.md)
- [Instruções e linguagem cognitiva](instrucoes-e-linguagem-cognitiva.md)
- [Conteúdo sensível a tempo](conteudo-sensivel-a-tempo.md)

Esses padrões definem como informação, orientação e feedback devem permanecer compreensíveis sem depender de visão, memória, percepção contínua de mudanças ou conhecimento prévio da interface.

## Mídia, movimento e interação sensorial

- [Áudio e vídeo](audio-e-video.md)
- [Legendas, transcrições e audiodescrição](legendas-transcricoes-e-audiodescricao.md)
- [Animação e redução de movimento](animacao-e-reducao-de-movimento.md)
- [Orientação e layout adaptável](orientacao-e-layout-adaptavel.md)
- [Gestos complexos e movimento do dispositivo](gestos-complexos-e-movimento-do-dispositivo.md)

Esses padrões garantem equivalência entre modalidades sensoriais, adaptação a preferências do sistema e alternativas para interações que exigem movimento, precisão ou acompanhamento visual contínuo.

## Entrada de dados e manipulação avançada

- [Autocomplete e sugestões](autocomplete-e-sugestoes.md)
- [Upload de arquivos](upload-de-arquivos.md)
- [Date e time picker](date-time-picker.md)
- [Slider e stepper](slider-e-stepper.md)
- [Drag and drop](drag-and-drop.md)

Esses padrões cobrem controles que combinam edição, seleção, progresso ou manipulação espacial. Nenhum deles deve depender exclusivamente de gesto preciso, arraste, acompanhamento visual contínuo ou mudança inesperada de foco.

## Autenticação, segurança e fluxos críticos

- [Sessão expirada e tempo limite](sessao-expirada-e-tempo-limite.md)
- [OTP e verificação](otp-e-verificacao.md)
- [Recuperação de senha](recuperacao-de-senha.md)
- [Confirmação destrutiva e prevenção de erro](confirmacao-destrutiva-e-prevencao-de-erro.md)

Esses padrões tratam jornadas em que barreiras de acessibilidade podem impedir acesso à conta, causar perda de dados ou provocar ações irreversíveis. Segurança e acessibilidade devem ser projetadas em conjunto: mecanismos de proteção não devem depender desnecessariamente de memória, transcrição visual, precisão motora ou interação incompatível com tecnologia assistiva.

## Privacidade, consentimento e permissões

- [Permissões do dispositivo](permissoes-do-dispositivo.md)
- [Consentimento e preferências](consentimento-e-preferencias.md)
- [Privacidade e dados sensíveis](privacidade-e-dados-sensiveis.md)
- [Exportação, exclusão e revogação](exportacao-exclusao-e-revogacao.md)

Esses padrões cobrem escolhas que afetam privacidade, uso de dados e acesso a recursos do dispositivo. A interface deve explicar finalidade e consequência, preservar controle real da pessoa e evitar que mecanismos de proteção ou consentimento dependam de percepção visual, memória ou navegação desproporcionalmente complexa.

## Ajuda, suporte e recuperação de contexto

- [Ajuda contextual e documentação](ajuda-contextual-e-documentacao.md)
- [Suporte e contato](suporte-e-contato.md)
- [Retomada de jornada e recuperação de contexto](retomada-de-jornada-e-recuperacao-de-contexto.md)
- [Feedback do usuário e relato de problema](feedback-do-usuario-e-relato-de-problema.md)

Esses padrões garantem que a pessoa consiga compreender a interface, pedir ajuda, relatar barreiras e retomar tarefas sem perder dados ou contexto desnecessariamente.

## Continuidade, robustez e tolerância a falhas

- [Offline e conectividade](offline-e-conectividade.md)
- [Retry e recuperação após erro](retry-e-recuperacao-apos-erro.md)
- [Preservação de dados e rascunhos](preservacao-de-dados-e-rascunhos.md)
- [Conflitos de estado e sincronização](conflitos-de-estado-e-sincronizacao.md)

Esses padrões tratam interrupções técnicas e estados concorrentes sem transformar falhas de rede, sincronização ou persistência em perda de contexto, trabalho ou autonomia para pessoas que usam tecnologia assistiva.

## Internacionalização, localização e conteúdo adaptável

- [Idioma e pronúncia](idioma-e-pronuncia.md)
- [Datas, números, moedas e unidades](datas-numeros-moedas-e-unidades.md)
- [RTL, direção e ordem de leitura](rtl-direcao-e-ordem-de-leitura.md)
- [Expansão de conteúdo e localização](expansao-de-conteudo-e-localizacao.md)

Esses padrões garantem que tradução, formatos regionais e direção de escrita não alterem indevidamente semântica, ordem de leitura, foco, pronúncia ou operabilidade. Localização deve ser validada também com tecnologia assistiva e não apenas por inspeção visual.

## Dados complexos e visualizações

- [Gráficos e visualização de dados](graficos-e-visualizacao-de-dados.md)
- [Data grid e tabelas interativas](data-grid-e-tabelas-interativas.md)
- [Mapas e conteúdo espacial](mapas-e-conteudo-espacial.md)
- [Dashboards e KPIs](dashboards-e-kpis.md)

Esses padrões garantem que relações espaciais, tendências, indicadores e grandes conjuntos de dados tenham estrutura, contexto e alternativas equivalentes para pessoas que não acessam a representação visual diretamente.

## Colaboração e comunicação em tempo real

- [Chat e mensagens em tempo real](chat-e-mensagens-em-tempo-real.md)
- [Menções, presença e status](mencoes-presenca-e-status.md)
- [Notificações e atividade ao vivo](notificacoes-e-atividade-ao-vivo.md)
- [Comentários, reações e colaboração](comentarios-reacoes-e-colaboracao.md)

Esses padrões preservam autoria, contexto, estado e controle da pessoa durante atualizações ao vivo. Mudanças remotas devem ser percebidas sem transformar leitores de tela em um fluxo contínuo de interrupções nem deslocar foco automaticamente.

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

Para definição de pronto e aceite de implementação, use também os [critérios de aceite dos componentes](criterios-de-aceite.md).
