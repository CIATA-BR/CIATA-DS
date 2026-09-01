# Guia de preenchimento de VPAT® / ACR

Este guia padroniza como a CIATA transforma evidências de acessibilidade em um Accessibility Conformance Report (ACR) baseado no VPAT® da ITI.

## 1. Comece pelo escopo, não pela tabela

Antes de classificar qualquer critério, registre:

- versão exata do produto;
- plataformas incluídas;
- jornadas e áreas avaliadas;
- conteúdo de terceiros;
- exceções de escopo;
- ambientes e tecnologias assistivas usados;
- edição do VPAT® de destino.

Sem esse contexto, um nível de conformidade isolado não é auditável.

## 2. Use a edição correta do VPAT®

A ITI mantém quatro edições principais do VPAT® 2.5Rev:

- WCAG;
- Revised Section 508;
- EN 301 549 (EU);
- International (INT), combinando múltiplos referenciais.

Para produtos digitais CIATA avaliados apenas contra WCAG, use a WCAG Edition como padrão. Use outra edição quando houver obrigação contratual, regulatória ou de mercado que a justifique.

## 3. Fonte normativa

Para WCAG 2.2, consulte primeiro a [base canônica do CIATA](../wcag-2.2/README.md) para organização, interpretação interna e rastreabilidade. Em caso de dúvida, prevalece o texto normativo do W3C.

Não copie explicações divergentes para o ACR. O relatório deve apontar a conformidade do produto, não criar uma segunda interpretação paralela da norma.

## 4. Como escolher o nível de conformidade

### Supports

Use quando a funcionalidade relevante atende ao critério e não há defeito conhecido no escopo avaliado que impeça essa conformidade.

Não use `Supports` apenas porque:

- uma ferramenta automatizada não encontrou erro;
- uma única tela foi testada;
- o componente funciona em apenas uma plataforma enquanto falha em outra incluída no relatório;
- existe workaround que exige conhecimento incomum do usuário;
- a equipe pretende corrigir a falha em breve.

### Partially Supports

Use quando há conformidade em parte do produto, mas existe pelo menos uma exceção relevante e reproduzível.

A observação deve indicar claramente:

- onde a exceção ocorre;
- comportamento esperado e observado;
- plataforma ou componente afetado;
- impacto para o usuário;
- referência de defeito ou evidência.

### Does Not Support

Use quando o requisito não é atendido na funcionalidade relevante ou quando as exceções são amplas o suficiente para que a funcionalidade não possa ser considerada parcialmente conforme de maneira útil.

Não suavize uma falha sistêmica usando `Partially Supports` apenas por preferência editorial.

### Not Applicable

Use somente quando o critério realmente não se aplica ao produto ou ao escopo explicitamente definido. Registre o motivo.

Exemplo: um produto sem conteúdo de áudio pré-gravado pode ter critérios específicos de mídia marcados como não aplicáveis, desde que não exista esse conteúdo em nenhuma jornada incluída.

### Not Evaluated

Use apenas nos contextos em que o próprio VPAT® permite esse nível, como critérios WCAG AAA incluídos opcionalmente. Não use `Not Evaluated` para fugir da avaliação de critérios A ou AA incluídos no escopo.

## 5. Evidência mínima esperada

Para cada classificação que não seja trivialmente `Not Applicable`, mantenha evidência suficiente para reproduzir a conclusão. Conforme o critério, isso pode incluir:

- fluxo e passo exato;
- componente ou tela;
- resultado observado;
- tecnologia assistiva;
- navegador ou app;
- sistema operacional;
- versão;
- dispositivo ou método de entrada;
- captura, vídeo, log ou descrição estruturada;
- issue ou bug relacionado;
- teste manual aplicado;
- resultado de ferramenta automatizada como evidência complementar.

O ACR publicado não precisa carregar todo o material bruto, mas deve ser possível rastrear internamente a conclusão até a evidência.

## 6. Automação não fecha critério sozinha

Ferramentas automatizadas são úteis para detectar classes específicas de problemas, mas não conseguem confirmar integralmente requisitos como:

- qualidade de nomes acessíveis;
- ordem lógica de foco;
- previsibilidade de foco;
- adequação de alternativas textuais;
- clareza de instruções e erros;
- operação real com leitor de tela;
- comportamento de gestos e equivalentes acessíveis;
- acessibilidade cognitiva contextual.

Um resultado automatizado "sem violações" nunca deve ser convertido diretamente em `Supports` sem análise compatível com o critério.

## 7. Múltiplas plataformas

Quando o mesmo produto existe em Web, Android e iOS, registre diferenças reais.

Exemplo conceitual:

- Web: suporta o requisito;
- Android: suporta o requisito;
- iOS: uma ação não possui nome acessível adequado.

O relatório não deve resumir isso simplesmente como "Supports". A classificação e as observações devem preservar a exceção de iOS de forma compatível com a estrutura da edição oficial utilizada.

## 8. Tecnologias assistivas

Não declare compatibilidade genérica com "leitores de tela". Identifique combinações efetivamente testadas quando elas sustentarem a evidência.

A matriz de referência da CIATA inclui, conforme aplicável:

- JAWS e NVDA no Windows;
- VoiceOver no iOS e macOS;
- TalkBack no Android;
- Jieshuo como cobertura adicional no Android;
- Narrador quando pertinente;
- linhas Braille, registrando modelo, conexão, tabela e leitor de tela;
- teclado físico;
- Switch Access ou mecanismos equivalentes;
- ampliação, zoom, texto ampliado, alto contraste e cores forçadas.

Não é necessário testar toda combinação existente para cada critério. O conjunto deve ser proporcional ao produto, às plataformas suportadas e ao risco da funcionalidade.

## 9. Como escrever Remarks and Explanations

Prefira linguagem factual e verificável.

### Fraco

"A maioria dos botões funciona com leitor de tela."

### Melhor

"Partially Supports. Na versão Android avaliada, os controles principais possuem nome e papel acessíveis. No fluxo de envio de anexos, o botão que remove o arquivo selecionado é anunciado apenas como 'botão', sem nome acessível. Issue: A11Y-123."

### Fraco

"O site é compatível com teclado."

### Melhor

"Supports. As jornadas de autenticação, busca, seleção de resultado e conclusão da ação foram executadas somente por teclado, com foco visível e sequência operacional consistente nos ambientes registrados nesta avaliação."

Não faça afirmações mais amplas do que a evidência permite.

## 10. Defeitos conhecidos e severidade

A severidade interna do bug e o nível VPAT® resolvem problemas diferentes.

- **Severidade** prioriza impacto e correção.
- **Conformance Level** registra se o requisito normativo é atendido.

Assim, um bug classificado internamente como baixo ainda pode resultar em `Partially Supports`. Da mesma forma, um bug de alto impacto deve ser relacionado aos critérios que ele efetivamente viola, sem transformar automaticamente todos os critérios próximos em `Does Not Support`.

## 11. Correções futuras

O ACR representa a versão avaliada. Se uma correção está planejada, isso pode ser mencionado em observação separada, mas não pode elevar o nível atual.

Após a correção:

1. reexecute o teste relevante;
2. atualize a evidência;
3. revise critérios relacionados;
4. atualize o ACR somente se a versão declarada também for atualizada.

## 12. Conteúdo e componentes de terceiros

Não exclua silenciosamente dependências que fazem parte da jornada do usuário.

Para integrações externas, registre uma das situações:

- avaliada como parte do produto;
- coberta por ACR próprio do fornecedor, com validação complementar quando necessária;
- fora do escopo por motivo explícito;
- fonte conhecida de exceção de acessibilidade.

A simples existência de um VPAT® de fornecedor não comprova automaticamente que a integração final da CIATA mantém o mesmo nível de conformidade.

## 13. Revisão por pares

Antes da publicação, uma segunda pessoa deve revisar ao menos:

- correspondência entre critério e evidência;
- coerência dos níveis de conformidade;
- justificativas de `Not Applicable`;
- linguagem das observações;
- diferenças entre plataformas;
- versão do produto;
- edição correta do VPAT®;
- referências a defeitos conhecidos;
- ausência de alegações não sustentadas.

## 14. Quando atualizar o ACR

Reavalie quando ocorrer mudança material, como:

- nova versão relevante do produto;
- alteração de framework ou componente fundamental;
- mudança de fluxo crítico;
- correção de exceções documentadas;
- introdução de nova plataforma;
- mudança normativa aplicável;
- alteração importante em tecnologia assistiva ou plataforma que afete o comportamento declarado.

O ACR deve permanecer um retrato verificável de uma versão específica, não uma declaração permanente de acessibilidade do produto.