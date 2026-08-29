# CHECK-0001 — Revisão manual de acessibilidade

- **Versão:** 1.2
- **Status:** Proposto
- **Relacionamentos:** SPEC-0005, ADR-0003, ACCESSIBILITY.md, base canônica WCAG 2.2, guia de validação multiplataforma

## Identificação da execução

- Projeto ou artefato:
- Versão ou build:
- Plataforma e dispositivo:
- Ambiente:
- Jornada completa:
- Linha de base de suporte:
- Responsável:
- Data:
- Tecnologias assistivas e versões:
- Navegador ou aplicativo:
- Teclado ou linha Braille:

## Escopo e amostra

- [ ] O escopo inclui o produto, a versão, o objetivo e os limites da avaliação.
- [ ] Funções essenciais, telas comuns, estados, conteúdos e tecnologias foram explorados.
- [ ] A amostra é representativa e inclui processos completos, não apenas telas isoladas.
- [ ] Combinações de sistema, navegador, leitor de tela, teclado e Braille foram justificadas.
- [ ] Itens não aplicáveis e limitações estão registrados.

## Navegação e foco

- [ ] Todas as funções essenciais são operáveis por teclado, gestos acessíveis ou comandos equivalentes.
- [ ] A ordem de foco segue a ordem lógica do conteúdo.
- [ ] O foco permanece visível e perceptível.
- [ ] O componente focado não fica totalmente oculto por cabeçalhos, rodapés, banners ou outras sobreposições.
- [ ] Atualizações de conteúdo não roubam o foco indevidamente.
- [ ] Modais, menus, folhas inferiores e diálogos conduzem e devolvem o foco corretamente.
- [ ] Não existem armadilhas de teclado ou gestos sem saída.
- [ ] Após retorno, atualização ou recriação da tela, o foco permanece no elemento lógico equivalente quando ele ainda existe.
- [ ] Posição de leitura e rolagem são preservadas quando necessárias para continuar a tarefa.

## Estrutura e semântica

- [ ] Títulos e cabeçalhos formam uma hierarquia coerente.
- [ ] Controles possuem nome, função, estado e valor acessíveis.
- [ ] Campos possuem rótulos persistentes e instruções claras.
- [ ] Grupos, listas, tabelas e regiões utilizam semântica adequada.
- [ ] Estados como selecionado, expandido, inválido e desabilitado são anunciados.
- [ ] Controles customizados oferecem semântica, eventos e operação equivalentes aos nativos.
- [ ] Campos de texto customizados anunciam composição, alteração e confirmação sem duplicação ou silêncio indevido.

## Leitores de tela e Braille

- [ ] O fluxo principal foi testado com leitor de tela da plataforma.
- [ ] A leitura contínua apresenta conteúdo em ordem compreensível.
- [ ] Rótulos são completos e úteis também em linha Braille.
- [ ] Função, estado e valor essenciais estão disponíveis por fala e Braille.
- [ ] Símbolos isolados não carregam informação essencial.
- [ ] Ações personalizadas possuem nomes claros e contexto suficiente.
- [ ] Mensagens dinâmicas importantes são anunciadas sem repetição excessiva.
- [ ] Cursor e teclas de roteamento da linha Braille alcançam o controle correto.
- [ ] Modelo, conexão, tabela Braille e leitor de tela estão registrados quando Braille foi testado.

## Teclado e entrada alternativa

- [ ] Tab e Shift+Tab seguem ordem lógica.
- [ ] Enter, Espaço, Escape e setas respeitam as convenções do componente e da plataforma.
- [ ] O fluxo mobile foi testado com teclado físico quando aplicável.
- [ ] Nenhum gesto complexo é a única forma de concluir uma ação.
- [ ] Toda operação de arraste não essencial possui alternativa por acionamento simples.
- [ ] Alvos de ponteiro atendem ao tamanho mínimo ou ao espaçamento exigido, considerando as exceções aplicáveis.
- [ ] O foco visual, o foco de acessibilidade e a ação ativa permanecem coerentes.

## Mobile, orientação e variação de janela

- [ ] A jornada funciona em retrato e paisagem.
- [ ] A jornada funciona após redimensionamento, tela dividida e alternância entre aplicativos.
- [ ] Dados, seleções, etapa, gravação, upload, captura ou conversão sobrevivem à recriação da interface.
- [ ] O produto não depende de bloqueios de orientação, proporção ou redimensionamento para permanecer utilizável.
- [ ] Em Android direcionado à API 37, telas com menor dimensão igual ou superior a 600 dp foram testadas.
- [ ] Elementos permanecem visíveis e presentes na árvore de acessibilidade em todos os tamanhos testados.

## Percepção visual

- [ ] Texto e componentes possuem contraste suficiente.
- [ ] Informação não depende exclusivamente de cor, posição, forma ou animação.
- [ ] O conteúdo permanece utilizável com ampliação e zoom.
- [ ] O layout suporta aumento de texto sem perda de conteúdo ou função.
- [ ] Foco, erros e estados são perceptíveis em alto contraste.

## Conteúdo e mídia

- [ ] Imagens informativas possuem alternativa textual equivalente.
- [ ] Imagens decorativas não geram ruído para tecnologias assistivas.
- [ ] Áudio e vídeo possuem alternativas adequadas ao contexto.
- [ ] Textos de links e botões descrevem sua finalidade fora do contexto visual.
- [ ] Instruções evitam depender apenas de referências visuais.

## Formulários, erros e feedback

- [ ] Erros identificam o campo e explicam como corrigir.
- [ ] Validações não apagam dados já preenchidos sem necessidade.
- [ ] Mensagens de sucesso, espera e falha são anunciadas.
- [ ] Limites de tempo possuem aviso e extensão quando aplicável.
- [ ] Autenticação não exige exclusivamente tarefas cognitivas ou visuais inacessíveis.
- [ ] Colagem, gerenciador de senhas e preenchimento automático não são bloqueados sem alternativa acessível.
- [ ] Dados já fornecidos no mesmo processo são reaproveitados ou ficam disponíveis para seleção, salvo exceção aplicável.
- [ ] Mecanismos recorrentes de ajuda permanecem na mesma ordem relativa entre as páginas do processo.
- [ ] Interrupção e retomada não repetem envio, pagamento ou outra ação irreversível.

## Resultado

- [ ] Aprovado
- [ ] Aprovado com ressalvas
- [ ] Reprovado

### Falhas críticas


### Evidências


### Observações e itens não aplicáveis
