# Modelo interno de Accessibility Conformance Report (ACR)

> Este documento é uma estrutura interna de trabalho do CIATA Design System. Ele não substitui nem modifica o formulário oficial VPAT® da Information Technology Industry Council (ITI). Para publicação formal de um ACR baseado em VPAT®, use a edição oficial correspondente.

## 1. Identificação do produto

- **Produto ou serviço:**
- **Versão avaliada:**
- **Data da avaliação:**
- **Data do relatório:**
- **Responsável pela avaliação:**
- **Responsável pela revisão:**
- **Escopo funcional avaliado:**
- **Plataformas incluídas:**
- **Plataformas ou fluxos excluídos e justificativa:**
- **Referencial:** WCAG 2.2 níveis A e AA, salvo indicação diferente.
- **Edição VPAT® de destino:** WCAG / 508 / EU / INT.

## 2. Descrição do produto ou serviço

Descreva de forma objetiva:

- finalidade do produto;
- principais jornadas;
- modalidades de interação relevantes;
- dependências externas que possam afetar acessibilidade;
- conteúdo de terceiros incluído ou integrado;
- limitações conhecidas do escopo de avaliação.

## 3. Métodos de avaliação

Registre os métodos efetivamente usados. Exemplos:

- inspeção manual de semântica e estrutura;
- navegação somente por teclado;
- uso com leitor de tela;
- ampliação, zoom e reflow;
- contraste e cores forçadas;
- texto ampliado e espaçamento personalizado;
- orientação e redimensionamento;
- controles por varredura ou acionamento alternativo;
- validação automatizada complementar;
- revisão de código, quando necessária para confirmar comportamento não observável apenas pela interface.

Ferramentas automatizadas devem ser registradas como apoio e nunca como única evidência para declarar conformidade global.

## 4. Ambientes de teste

Preencha uma linha por combinação materialmente relevante.

| Plataforma | Sistema operacional | Navegador/app | Tecnologia assistiva | Versão | Dispositivo/entrada | Observações |
| --- | --- | --- | --- | --- | --- | --- |
| Ex.: Web | Windows | Edge | JAWS | versão avaliada | teclado | fluxo principal |
| Ex.: Web | Windows | Firefox | NVDA | versão avaliada | teclado | cobertura complementar |
| Ex.: Android | Android | app nativo | TalkBack | versão avaliada | toque/gestos | dispositivo físico |
| Ex.: iOS | iOS | app nativo | VoiceOver | versão avaliada | toque/gestos | dispositivo físico |

## 5. Convenção de conformidade

Use somente os níveis permitidos pela edição oficial aplicável do VPAT®:

- **Supports** — a funcionalidade atende ao critério sem defeitos conhecidos que impeçam a conformidade daquele requisito.
- **Partially Supports** — parte da funcionalidade atende, mas existe uma ou mais situações em que o critério não é atendido.
- **Does Not Support** — a funcionalidade relevante não atende ao critério ou a falha é suficientemente ampla para impedir que o requisito seja considerado atendido.
- **Not Applicable** — o critério não se aplica ao produto ou ao escopo avaliado; a justificativa deve ser registrada.
- **Not Evaluated** — usar somente quando permitido pelo VPAT® aplicável, tipicamente em critérios WCAG AAA quando estes estiverem incluídos no relatório.

A escolha do nível deve ser sustentada pela evidência registrada em `Remarks and Explanations` ou em referência rastreável para a evidência detalhada.

## 6. Matriz de conformidade WCAG 2.2

A lista canônica dos critérios e suas interpretações internas está em [`../wcag-2.2/`](../wcag-2.2/README.md). Não replique textos normativos completos aqui.

Para cada critério aplicável, registre:

| Critério | Nível | Plataforma/escopo | Conformidade | Evidência / Remarks and Explanations | Referência de defeito, se houver |
| --- | --- | --- | --- | --- | --- |
| 1.1.1 | A | | | | |
| 1.2.1 | A | | | | |
| ... | ... | ... | ... | ... | ... |

### Regra para múltiplas plataformas

Quando Web, Android e iOS apresentarem resultados diferentes para o mesmo critério, não esconda a diferença em uma conclusão única. Registre o comportamento por plataforma ou por grupo funcional e explique claramente qual parte suporta e qual parte não suporta o requisito.

## 7. Padrão mínimo para Remarks and Explanations

Uma observação adequada deve responder, quando aplicável:

1. **onde** o critério foi avaliado;
2. **o que** funciona ou falha;
3. **como** isso foi verificado;
4. **qual é o impacto** da exceção;
5. **qual parte do produto** é afetada;
6. **qual evidência ou defeito** permite reproduzir o resultado.

Evite observações vagas como:

- "compatível";
- "funciona com leitor de tela";
- "a maioria atende";
- "sem problemas encontrados" sem indicar escopo ou método;
- "será corrigido" como justificativa para elevar o nível de conformidade atual.

## 8. Resumo de exceções conhecidas

| ID | Critério | Plataforma | Jornada/componente | Severidade | Estado | Evidência |
| --- | --- | --- | --- | --- | --- | --- |
| | | | | | | |

A severidade de um defeito não substitui o nível de conformidade do VPAT®. Uma falha classificada como baixa ainda pode exigir `Partially Supports` se demonstrar que o critério não é atendido em parte do produto.

## 9. Dependências e conteúdo de terceiros

Liste bibliotecas, WebViews, SDKs, widgets incorporados, provedores de autenticação, pagamentos, mapas, mídia, documentos ou outros elementos externos que estejam dentro da jornada do usuário e possam afetar a declaração de conformidade.

Para cada item, indique se:

- foi avaliado diretamente;
- está fora do escopo e por quê;
- possui ACR/VPAT próprio;
- introduz exceções conhecidas no produto final.

## 10. Revisão antes da publicação

Antes de transpor os resultados para o VPAT® oficial, confirmar:

- [ ] versão exata do produto registrada;
- [ ] escopo e exclusões explícitos;
- [ ] edição correta do VPAT® selecionada;
- [ ] todos os critérios aplicáveis classificados;
- [ ] `Not Applicable` justificado;
- [ ] `Partially Supports` e `Does Not Support` acompanhados de explicação reproduzível;
- [ ] diferenças entre plataformas preservadas;
- [ ] tecnologias assistivas e ambientes identificados;
- [ ] evidências e defeitos rastreáveis;
- [ ] nenhuma correção futura usada para representar conformidade atual;
- [ ] revisão técnica concluída;
- [ ] revisão editorial concluída;
- [ ] conteúdo transferido para o template oficial sem alterar sua estrutura ou marcas.

## 11. Controle da avaliação

- **Commit/tag/build avaliado:**
- **Data de congelamento da evidência:**
- **Próxima revisão prevista:**
- **Motivo para nova avaliação:** nova versão, mudança de plataforma, alteração relevante de componente, correção de exceção, mudança normativa ou exigência contratual.
