# Guia de validação multiplataforma de acessibilidade

- **Versão:** 1.0
- **Status:** Proposto
- **Relacionamentos:** ACCESSIBILITY.md, SPEC-0005, CHECK-0001, PB-0005, ADR-0003
- **Issue de origem:** #18

## Objetivo

Definir como os produtos CIATA devem validar foco, estado, teclado, leitores de tela e Braille em experiências web, nativas, híbridas e multiplataforma.

Este guia complementa os critérios WCAG aplicáveis. Ele não transforma documentos informativos ou recursos experimentais em requisitos normativos.

## 1. Escopo por jornadas completas

A avaliação deve seguir a estrutura do WCAG-EM 2.0:

1. definir o produto, a versão, o ambiente e o objetivo da avaliação;
2. identificar visualizações comuns, funções essenciais e tecnologias utilizadas;
3. selecionar amostra representativa de telas, estados e conteúdos;
4. executar processos completos, inclusive erros, interrupções e retomadas;
5. registrar resultados, limitações e combinações de tecnologia assistiva utilizadas.

Uma tela isolada aprovada não comprova que a jornada está acessível. Cadastro, autenticação, busca, upload, pagamento, conversa, gravação e conversão devem ser testados do início ao resultado final quando fizerem parte do escopo.

### Linha de base de suporte

Antes da execução, registrar as combinações que sustentam a avaliação. Exemplos:

- web no Windows: JAWS com Edge e NVDA com Firefox ou Chrome;
- web no macOS ou iOS: VoiceOver com Safari;
- Android: TalkBack, gestos acessíveis e teclado físico;
- iOS: VoiceOver, gestos acessíveis e teclado externo quando aplicável;
- Braille: leitor de tela, modelo da linha, tipo de conexão e tabela Braille;
- tecnologias adicionais, como Jieshuo, Switch Access, Voice Access e ampliação, conforme público e risco.

Uma combinação adicional não substitui o leitor de tela principal da plataforma. Versões de sistema, navegador, aplicativo e tecnologia assistiva devem constar nas evidências.

## 2. Redimensionamento, orientação e persistência de foco

Interfaces não devem depender de orientação fixa, proporção específica ou impossibilidade de redimensionamento.

Ao girar, redimensionar, dividir a tela, alternar janelas ou recriar uma visualização, o produto deve preservar, conforme aplicável:

- dados já digitados e seleções realizadas;
- etapa atual e resultado de operações em andamento;
- gravação, upload, captura ou conversão sem duplicação;
- posição de rolagem ou leitura;
- foco no elemento lógico equivalente, quando ele continuar disponível;
- mensagens necessárias para compreender a retomada.

Não se deve forçar o foco apenas para reproduzir a posição anterior. Primeiro é necessário confirmar que o destino ainda existe, está visível, habilitado e continua sendo o ponto lógico da tarefa.

### Android 17 e API 37

Em telas com menor dimensão igual ou superior a 600 dp, aplicativos direcionados ao Android 17/API 37 não podem depender de bloqueios de orientação, proporção ou redimensionamento. A plataforma pode ignorar essas restrições e recriar a `Activity`.

Antes de elevar o `targetSdkVersion` para 37:

- testar retrato, paisagem, tela dividida, janela redimensionável e modo desktop;
- validar restauração de estado após recriação da `Activity` e do processo;
- confirmar que TalkBack não retorna indevidamente ao início;
- confirmar que teclado físico mantém ordem, operação e foco;
- verificar se diálogos, menus, folhas inferiores e gravações devolvem o foco ao acionador correto;
- eliminar componentes fora da área visível ou da árvore de acessibilidade.

Estado de interface deve usar os mecanismos de persistência recomendados pelo framework, sem depender apenas da instância atual da tela.

## 3. Entrada de texto e eventos de acessibilidade

Controles nativos são preferíveis porque preservam integração com teclado, método de entrada e tecnologia assistiva.

No Android 17, campos `TextView` padrão informam automaticamente tipos mais específicos de alteração de texto. Implementações com `InputConnection` próprio devem avaliar as APIs `TextAttribute` e `AccessibilityEvent.setTextChangeTypes()` ao emitir `TYPE_VIEW_TEXT_CHANGED`.

O objetivo é permitir que o leitor de tela diferencie composição, seleção de candidato e confirmação do texto, evitando anúncios genéricos, repetidos ou incorretos. O benefício inicial é especialmente relevante para entrada CJKV, mas componentes customizados devem permanecer compatíveis com a evolução da plataforma.

Não reconstruir eventos de texto manualmente quando um controle nativo ou semântica do framework puder fornecer o comportamento correto.

## 4. Teclado e foco

Em todas as plataformas aplicáveis:

- Tab e Shift+Tab percorrem controles em ordem lógica;
- Enter e Espaço acionam controles conforme a convenção da plataforma;
- Escape fecha camadas dispensáveis e devolve o foco ao acionador;
- setas são reservadas a componentes compostos que adotem esse padrão;
- nenhum gesto complexo é a única forma de concluir uma tarefa;
- mudanças dinâmicas não roubam foco nem apagam contexto;
- foco visual, foco de acessibilidade e ação ativa permanecem coerentes.

No mobile, teclado físico deve ser testado além dos gestos do leitor de tela.

## 5. Braille

A saída Braille deve preservar a mesma informação essencial oferecida por fala e conteúdo visual:

- nome acessível conciso e identificável;
- função, estado e valor disponíveis pela semântica da plataforma;
- ausência de símbolos visuais isolados como única identificação;
- abreviações compreensíveis e consistentes;
- mensagens dinâmicas acessíveis sem repetição excessiva;
- cursor e teclas de roteamento associados ao controle correto.

Registrar modelo da linha, leitor de tela, conexão USB ou Bluetooth, tabela Braille e idioma.

### Narrador e linhas HID

Versões experimentais do Windows passaram a oferecer conexão direta de linhas Braille que adotam o padrão HID, inclusive por USB durante a configuração inicial e por Bluetooth após pareamento.

Esse suporte é útil para ampliar a matriz de testes, mas ainda não deve compor sozinho a linha de base de produção enquanto permanecer em canal experimental. Validar separadamente com Narrador e, quando possível, comparar os resultados com JAWS ou NVDA.

## 6. Jornadas prioritárias do ecossistema CIATA

- **Portal institucional:** navegação estrutural, menus, busca, formulários e conteúdo dinâmico.
- **Emprega CIATA:** cadastro em fases, CEP, formação, idiomas, certificações, experiências, candidatura e retorno de erros.
- **Biblioteca Virtual:** cadastro, envio de laudo, busca, filtros, estante, download e administração.
- **Jieshuo:** autenticação, recuperação de conta, pagamentos, mensagens e estados administrativos.
- **Comunica-CIATA:** lista de conversas, mensagens não lidas, gravação por manter pressionado, modo mãos livres, envio e retomada.
- **Conversor Braille:** câmera, seleção múltipla, progresso, conversão, compartilhamento e retorno.
- **Braillando:** exercícios, entrada de resposta, áudio, progressão e retomada de estado.

Cada avaliação deve selecionar as jornadas aplicáveis, sem presumir que esta lista substitui a exploração do produto.

## 7. Evidências mínimas

Registrar:

- produto, versão, build e ambiente;
- jornada e estado inicial;
- sistema, navegador e dispositivo;
- leitor de tela e versão;
- teclado, linha Braille ou outro dispositivo;
- passos, resultado esperado e resultado obtido;
- comportamento do foco antes e depois de mudanças de contexto;
- barreiras, gravidade, correção e reteste;
- itens não aplicáveis com justificativa.

## Fontes oficiais

- [WCAG Evaluation Methodology 2.0 — W3C Group Note, 23 de julho de 2026](https://www.w3.org/TR/WCAG-EM/)
- [Android 17 — restrições de orientação e redimensionamento ignoradas](https://developer.android.com/about/versions/17/changes/ff-restrictions-ignored)
- [Android 17 — alterações de acessibilidade para entrada por teclado físico](https://developer.android.com/about/versions/17/behavior-changes-17)
- [Windows Insider — suporte experimental a linhas Braille HID](https://blogs.windows.com/windows-insider/2026/07/27/announcing-windows-11-insider-preview-build-29634-1000-for-experimental-future-platforms/)
