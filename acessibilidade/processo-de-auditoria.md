# Processo de auditoria de acessibilidade

Este documento define o processo canônico do CIATA Design System para planejar, executar, registrar, revisar e concluir auditorias de acessibilidade em produtos, fluxos, componentes, documentos e experiências digitais.

Ele organiza o uso conjunto da base WCAG 2.2, referenciais regulatórios, checklist manual, evidências de auditoria, severidade de bugs e ACR/VPAT.

## Objetivo

Produzir avaliações reproduzíveis, rastreáveis e úteis para engenharia, produto, design, QA e conformidade, sem reduzir acessibilidade a execução automática de regras ou inspeção de telas isoladas.

## 1. Definição de escopo

Antes da execução, registrar:

- produto, versão, build ou commit avaliado;
- ambiente e data da avaliação;
- plataformas incluídas;
- jornadas e funções essenciais;
- tipos de conteúdo e componentes relevantes;
- tecnologias assistivas e modos de entrada previstos;
- referenciais aplicáveis;
- itens explicitamente fora do escopo e justificativa.

Uma auditoria não deve declarar cobertura além do escopo realmente testado.

## 2. Amostragem

Quando não for viável testar cada tela ou estado individualmente, a amostra deve representar o produto e privilegiar jornadas completas.

A amostra deve incluir, quando aplicável:

- entrada ou autenticação;
- navegação global;
- funções essenciais e de maior risco;
- formulários;
- busca, filtragem e resultados;
- criação, edição, exclusão e confirmação;
- erros, estados vazios, carregamento e indisponibilidade;
- conteúdo dinâmico;
- modais, menus, diálogos e folhas inferiores;
- documentos, mídia e imagens;
- retomada após interrupção;
- diferentes tamanhos de tela, orientação e redimensionamento.

A semelhança visual entre telas não é suficiente para assumir comportamento acessível equivalente.

## 3. Linha de base de teste

A linha de base deve refletir combinações relevantes de plataforma, navegador, tecnologia assistiva, dispositivo e entrada.

Exemplos:

- Windows + navegador suportado + NVDA e/ou JAWS;
- macOS + VoiceOver;
- iOS + VoiceOver;
- Android + TalkBack, com Jieshuo como cobertura adicional quando pertinente;
- teclado físico;
- linha Braille;
- ampliação e zoom;
- contraste forçado ou alto contraste;
- acionamento alternativo.

As versões utilizadas devem ser registradas na evidência.

## 4. Preparação

Antes do teste:

1. preparar contas e dados sem informações pessoais reais;
2. identificar pré-condições e permissões necessárias;
3. confirmar versão/build em teste;
4. desativar recursos automáticos de reconhecimento que possam mascarar ausência de semântica quando isso for relevante;
5. mapear estados destrutivos ou irreversíveis;
6. preparar meios de captura de evidência;
7. definir quais critérios e referenciais serão avaliados.

## 5. Execução

A auditoria deve combinar inspeção estrutural, testes funcionais e uso de tecnologias assistivas.

### 5.1 Jornada

Executar a tarefa do estado inicial ao resultado final, observando:

- possibilidade de conclusão;
- autonomia;
- previsibilidade;
- preservação de dados;
- feedback de sucesso, erro e espera;
- esforço adicional imposto pela barreira.

### 5.2 Navegação e foco

Validar:

- ordem lógica;
- foco visível;
- foco de acessibilidade;
- retorno de foco após componentes temporários;
- ausência de armadilhas;
- persistência após atualização, rotação, redimensionamento ou recriação da interface.

### 5.3 Semântica

Validar nome, função, estado, valor, agrupamento, estrutura e relações entre elementos.

### 5.4 Leitores de tela e Braille

Validar leitura, navegação, controles, estados, mensagens dinâmicas e operação. Quando Braille for testado, registrar modelo, conexão, tabela e leitor de tela.

### 5.5 Entrada alternativa

Validar teclado, gestos acessíveis, acionamento simples e alternativas para arraste ou gestos complexos.

### 5.6 Visual e cognitivo

Validar contraste, ampliação, zoom, reflow, tamanho de texto, uso de cor, clareza de instruções, consistência e redução de dependência de memória ou interpretação ambígua.

### 5.7 Automação

Ferramentas automáticas podem apoiar a descoberta, mas:

- resultado automático positivo precisa de interpretação contextual;
- ausência de alerta não comprova conformidade;
- foco, ordem de leitura, fala, Braille, estados e jornadas exigem validação manual quando aplicáveis.

## 6. Registro de achados

Todo defeito confirmado deve seguir o [padrão de evidências](evidencias-de-auditoria.md) e o [padrão de severidade](severidade-de-bugs.md).

O registro deve conter pelo menos:

- contexto e pré-condições;
- ambiente e versões;
- passos de reprodução;
- resultado atual;
- resultado esperado;
- impacto na jornada;
- severidade justificada;
- referencial relacionado, quando identificável;
- workaround, quando houver;
- evidência suficiente para reprodução.

## 7. Severidade e decisão de aceite

A severidade canônica do CIATA usa três níveis:

- **Alto**;
- **Médio**;
- **Baixo**.

Severidade representa impacto funcional e não deve ser confundida com prioridade de negócio.

### Resultado da auditoria

A auditoria pode ser concluída como:

- **Aprovado** — não há barreiras conhecidas no escopo avaliado que impeçam o atendimento dos critérios de aceite definidos;
- **Aprovado com ressalvas** — existem barreiras conhecidas, registradas e aceitas formalmente, sem impedimento definido para a finalidade da avaliação;
- **Reprovado** — há barreira de severidade ou natureza incompatível com os critérios de aceite da entrega.

Por padrão, uma barreira de severidade **Alto** em jornada essencial impede aprovação até correção ou decisão formal de não liberação daquela funcionalidade.

A existência de bugs Médios ou Baixos não autoriza automaticamente aprovação; frequência, abrangência, risco, obrigação regulatória e acúmulo de barreiras devem ser considerados.

## 8. Reteste

Após correção, repetir o cenário original e validar efeitos colaterais relevantes.

O resultado deve ser registrado como:

- Corrigido;
- Parcialmente corrigido;
- Não corrigido;
- Não reproduzido.

`Não reproduzido` não deve ser tratado automaticamente como `Corrigido`.

## 9. Critérios mínimos de conclusão

Uma auditoria só pode ser encerrada quando:

- escopo e amostra estiverem documentados;
- jornadas críticas previstas tiverem sido executadas;
- linha de base e tecnologias estiverem registradas;
- achados confirmados tiverem evidências suficientes;
- severidades estiverem justificadas;
- retestes necessários tiverem sido realizados;
- limitações e itens não aplicáveis estiverem registrados;
- o resultado final tiver sido revisado por pessoa competente.

Sempre que possível, a revisão deve incluir participação de pessoa com deficiência ou especialista com experiência prática na tecnologia assistiva em questão.

## 10. Saídas da auditoria

Dependendo do objetivo, a auditoria pode gerar:

- issues de acessibilidade;
- relatório interno;
- evidências para aceite de release;
- backlog de correções;
- atualização de componente ou guideline do Design System;
- insumos para ACR baseado em VPAT®;
- evidências para EN 301 549, Revised Section 508 ou outro referencial aplicável.

Uma auditoria interna não deve ser convertida automaticamente em declaração pública de conformidade. A publicação de ACR deve seguir o [processo VPAT/ACR](vpat/README.md).

## 11. Documentos relacionados

- [CHECK-0001 — Revisão manual de acessibilidade](../checklists/acessibilidade/CHECK-0001-revisao-manual-de-acessibilidade.md)
- [PB-0005 — Executar validação manual de acessibilidade](../playbooks/PB-0005-validar-acessibilidade.md)
- [Evidências de auditoria](evidencias-de-auditoria.md)
- [Severidade de bugs](severidade-de-bugs.md)
- [Validação multiplataforma](validacao-multiplataforma.md)
- [Base canônica WCAG 2.2](wcag-2.2/README.md)
- [Referenciais regulatórios](referenciais/README.md)
- [VPAT e ACR](vpat/README.md)
