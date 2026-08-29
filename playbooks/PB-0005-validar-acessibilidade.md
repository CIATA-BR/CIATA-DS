# PB-0005 — Executar validação manual de acessibilidade

- **Versão:** 1.2
- **Status:** Em revisão
- **Responsável pelo processo:** QA de acessibilidade
- **Relacionamentos:** SPEC-0005, CHECK-0001, ADR-0003, guia de validação multiplataforma, processo de auditoria, evidências de auditoria, severidade de bugs

## Objetivo

Validar uma experiência com pessoas, tecnologias assistivas e cenários reais, sem confundir conformidade automática com acessibilidade concluída.

## Preparação

1. Definir produto, versão, ambiente, objetivo e limites da avaliação.
2. Explorar visualizações comuns, funções essenciais, tipos de conteúdo e tecnologias.
3. Selecionar amostra representativa e processos completos conforme o WCAG-EM 2.0.
4. Definir a linha de base de suporte com sistemas, navegadores, leitores de tela e dispositivos.
5. Registrar versões de tecnologias assistivas, navegadores, sistemas, aplicativos e builds.
6. Incluir teclado físico, linha Braille, ampliação ou acionamento alternativo conforme público e risco.
7. Identificar mudanças de contexto que possam recriar a interface: rotação, redimensionamento, tela dividida, alternância de aplicativo e retomada após interrupção.
8. Desativar recursos automáticos de reconhecimento quando puderem mascarar ausência de rótulos, descrições ou texto alternativo.
9. Preparar dados de teste sem informações pessoais reais.

## Execução

1. Concluir cada jornada crítica do estado inicial ao resultado final.
2. Navegar apenas por teclado quando aplicável.
3. Validar ordem, visibilidade, persistência e retorno do foco.
4. Verificar nomes, funções, estados, valores e mensagens anunciadas.
5. Testar leitores de tela relevantes, como NVDA, JAWS, TalkBack e VoiceOver.
6. Verificar leitura e operação com linha Braille quando disponível.
7. No mobile, repetir a jornada com teclado físico quando aplicável.
8. Girar, redimensionar, dividir a tela, alternar aplicativos e retomar a tarefa.
9. Confirmar preservação de dados, etapa, posição de leitura e operações em andamento.
10. Em Android direcionado à API 37, testar telas com menor dimensão igual ou superior a 600 dp.
11. Avaliar campos de texto customizados para anúncios corretos de composição, alteração e confirmação.
12. Testar zoom, ampliação, contraste, reflow e tamanho de texto.
13. Confirmar que cor, posição, forma, gesto ou áudio não são o único meio de comunicação.
14. Validar erros, confirmações, carregamento, conteúdo dinâmico e mudanças de contexto.
15. Conferir imagens, gráficos, anexos, documentos e multimídia.
16. Registrar evidências reproduzíveis e impacto para a pessoa usuária.

## Cuidados de interpretação

- WCAG-EM 2.0 organiza a avaliação, mas não cria critérios adicionais à WCAG.
- Recurso publicado apenas em canal experimental não define sozinho a linha de base de produção.
- Jieshuo e outras tecnologias adicionais ampliam a cobertura, mas não substituem o leitor de tela principal da plataforma.
- Aprovação de uma tela isolada não comprova acessibilidade do processo completo.
- Resultado automático não comprova comportamento correto de foco, fala ou Braille.

## Classificação

Use exclusivamente o [padrão canônico de severidade](../acessibilidade/severidade-de-bugs.md):

- **Alto:** impede a conclusão da jornada, acesso a informação essencial ou operação necessária;
- **Médio:** a jornada permanece possível, mas com dificuldade relevante, ambiguidade, risco de erro ou esforço adicional;
- **Baixo:** reduz qualidade, clareza ou completude sem comprometer materialmente a conclusão da tarefa.

Severidade representa impacto funcional e não deve ser confundida com prioridade de correção.

## Critérios de conclusão

- jornadas críticas e estados de retomada executados;
- ambiente, linha de base e tecnologias registrados;
- falhas com passos de reprodução e evidências segundo o [padrão de evidências](../acessibilidade/evidencias-de-auditoria.md);
- barreiras de severidade Alto em jornadas essenciais corrigidas ou formalmente impeditivas da liberação;
- resultado revisado por pessoa competente, preferencialmente incluindo pessoa com deficiência.

Consulte o [processo de auditoria](../acessibilidade/processo-de-auditoria.md) para o fluxo completo e o [guia de validação multiplataforma](../acessibilidade/validacao-multiplataforma.md) para requisitos de Android 17, entrada de texto, teclado e Braille.
