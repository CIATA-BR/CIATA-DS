# Evidências de auditoria de acessibilidade

Este documento define o padrão mínimo para registrar evidências de auditoria, defeitos e retestes de acessibilidade no CIATA Design System.

O objetivo é permitir que outra pessoa consiga compreender, reproduzir, corrigir e validar o problema sem depender de conhecimento informal do avaliador original.

## Princípios

- Evidência deve demonstrar comportamento observável, não apenas opinião.
- O registro precisa ser reproduzível.
- O ambiente de teste deve ser identificável.
- O impacto funcional deve ser descrito antes da referência normativa.
- Automação pode apoiar a evidência, mas não substitui a demonstração funcional quando o problema depende de interação humana ou tecnologia assistiva.
- Dados pessoais, credenciais, tokens, informações médicas ou outros dados sensíveis não devem ser incluídos nas evidências.

## Campos mínimos por defeito

Cada defeito deve registrar, sempre que aplicável:

1. **Ativo ou fluxo afetado**
   - URL, tela, componente, arquivo, versão ou caminho relevante.
2. **Pré-condições**
   - estado de autenticação, permissões, dados de teste, configuração ou etapa anterior necessária.
3. **Ambiente**
   - sistema operacional e versão;
   - navegador ou aplicativo e versão;
   - dispositivo ou categoria de dispositivo, quando relevante.
4. **Tecnologia assistiva ou método de interação**
   - nome e versão do leitor de tela, ampliador, controle por voz, Switch Access ou outro recurso;
   - teclado físico, toque, gesto, mouse ou outro método utilizado;
   - para linha Braille, registrar modelo, conexão, tabela Braille e leitor de tela quando isso influenciar o resultado.
5. **Passos para reproduzir**
   - sequência objetiva e numerada;
   - evitar passos ambíguos como “tente navegar normalmente”.
6. **Resultado atual**
   - comportamento observado;
   - incluir fala efetivamente anunciada pelo leitor de tela quando relevante.
7. **Resultado esperado**
   - comportamento funcional e semântico esperado.
8. **Impacto na jornada**
   - explicar o que a pessoa deixa de fazer, precisa contornar ou passa a executar com maior esforço ou risco.
9. **Severidade**
   - usar o padrão definido em [Severidade de bugs de acessibilidade](severidade-de-bugs.md).
10. **Referencial relacionado**
   - WCAG 2.2, EN 301 549, Revised Section 508 ou outro requisito aplicável, quando identificável.
11. **Evidência complementar**
   - captura de tela, gravação, vídeo, log, árvore de acessibilidade ou descrição textual, conforme necessário.
12. **Workaround**
   - registrar se existe alternativa e se ela mantém autonomia, segurança e equivalência funcional.

## Evidência com leitores de tela

Quando o problema envolve leitor de tela, registrar a interação em termos funcionais e não apenas o nome do componente visual.

Exemplo adequado:

> Ao navegar por Tab até o botão “Continuar”, o JAWS 2025 anuncia apenas “Continuar” sem anunciar o papel de botão. Pressionar Espaço não executa a ação; Enter funciona.

Quando relevante, registrar:

- comando usado para chegar ao elemento;
- fala anunciada;
- papel, nome, estado ou valor esperado;
- comportamento de foco antes e depois da ação;
- diferença entre navegação sequencial, exploração por toque, rotor, atalhos ou listas de elementos.

Transcrições devem ser curtas e conter apenas o trecho necessário para demonstrar o defeito.

## Evidência visual

Capturas de tela podem apoiar problemas de contraste, foco visível, layout, ampliação, truncamento e conteúdo visual, mas não devem ser a única evidência de um problema que dependa de comportamento semântico ou interação.

Ao usar imagem, indicar claramente:

- qual elemento deve ser observado;
- estado da interface;
- escala, zoom ou tamanho de texto quando relevantes.

## Evidência de automação

Resultados de axe, Accessibility Scanner, Accessibility Insights, Lighthouse ou ferramentas equivalentes devem registrar:

- ferramenta e versão, quando disponível;
- regra acionada;
- elemento ou componente afetado;
- confirmação manual quando necessária.

Um resultado automatizado isolado não deve ser tratado como defeito confirmado se houver possibilidade relevante de falso positivo.

Da mesma forma, ausência de alerta automatizado não comprova conformidade.

## Reteste

Um defeito só deve ser considerado validado após reteste no ambiente relevante.

O registro de reteste deve conter:

- versão/build/commit testado;
- data do reteste;
- ambiente e tecnologia assistiva utilizados;
- resultado: **Corrigido**, **Parcialmente corrigido**, **Não corrigido** ou **Não reproduzido**;
- breve descrição do comportamento observado após a correção;
- indicação de regressões encontradas, se houver.

### Corrigido

O resultado esperado é atingido no fluxo originalmente afetado e não há regressão diretamente relacionada identificada no reteste.

### Parcialmente corrigido

Parte do problema foi resolvida, mas ainda existe barreira funcional ou semântica relevante. O issue não deve ser encerrado como corrigido.

### Não corrigido

O comportamento problemático permanece reproduzível.

### Não reproduzido

O problema não foi observado no ambiente de reteste. Isso não equivale automaticamente a “corrigido”; diferenças de ambiente, dados ou tecnologia assistiva devem ser investigadas quando houver dúvida.

## Evidência de reteste recomendada

Quando possível, manter no mesmo issue:

- evidência original;
- referência ao PR/commit que implementou a correção;
- evidência de reteste;
- conclusão final.

Isso preserva a cadeia de rastreabilidade entre descoberta, correção e validação.

## Múltiplas plataformas e tecnologias assistivas

Não é necessário reproduzir todo defeito em todas as combinações possíveis. A cobertura deve ser proporcional ao risco e ao escopo do produto.

Quando o comportamento variar entre plataformas ou tecnologias assistivas, registrar resultados separadamente. Não generalizar uma evidência obtida em uma combinação para outra combinação sem justificativa técnica.

## Evidência suficiente

Uma evidência é considerada suficiente quando permite responder claramente:

1. Onde ocorre?
2. Em qual ambiente ocorre?
3. Como reproduzir?
4. O que acontece?
5. O que deveria acontecer?
6. Qual é o impacto para a pessoa usuária?
7. Como sabemos que a correção foi validada?
