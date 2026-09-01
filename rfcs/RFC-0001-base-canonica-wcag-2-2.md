# RFC-0001 — Base canônica WCAG 2.2 do CIATA

## Status

Em discussão.

## Resumo em linguagem simples

O CIATA passará a manter uma única base WCAG 2.2, estruturada para pessoas e ferramentas. Ela reunirá critérios A e AA, exemplos de barreiras, testes manuais, tecnologias assistivas e produtos prioritários sem confundir o texto oficial com orientações internas.

## Problema

A referência anterior foi criada para a WCAG 2.1 em uma única tabela extensa. Ela possui conteúdo prático valioso, mas mistura requisito, orientação de plataforma, exemplo de falha e observação editorial. Isso dificulta atualização, navegação por leitor de tela, reutilização no design system e rastreabilidade entre produtos.

Listas locais em cada projeto também podem divergir com o tempo e produzir critérios de aceite incompatíveis.

## Contexto

A WCAG 2.2 acrescentou critérios sobre foco não obscurecido, arraste, tamanho de alvo, ajuda consistente, entrada redundante e autenticação acessível. Também removeu o critério 4.1.1 do alvo WCAG 2.2.

O CIATA-DS já define acessibilidade como requisito de origem, validação por jornadas completas e uma matriz multiplataforma. A base canônica inicia a fase de consolidação do Accessibility System e prepara o repositório para documentação, checklists, VPAT e normas correlatas.

## Proposta

1. Adotar `acessibilidade/wcag-2.2/criterios.json` como fonte canônica.
2. Publicar um XLSX acessível derivado para consulta e execução manual.
3. Manter o escopo padrão nos níveis A e AA.
4. Preservar 4.1.1 apenas como histórico, sem contá-lo entre os 55 critérios ativos.
5. Separar texto oficial, regra prática CIATA, falhas, testes, orientação e fontes.
6. Relacionar critérios a componentes, tecnologias assistivas e interfaces do ecossistema.
7. Validar automaticamente a integridade estrutural da base.
8. Fazer produtos consumidores referenciarem o CIATA-DS em vez de duplicar a lista.

## Experiência das pessoas

Pessoas que auditam terão procedimentos mais claros e registros comparáveis. Desenvolvedores poderão localizar critérios por componente e produto. Pessoas que usam leitor de tela terão uma planilha com abas menores, cabeçalhos claros e menos células excessivamente extensas.

## Acessibilidade

- O JSON permite gerar diferentes apresentações sem duplicar conteúdo.
- O XLSX evita células mescladas, identifica o estado por texto e não depende de cor.
- Testes incluem JAWS, NVDA, VoiceOver, TalkBack, teclado e Braille quando pertinentes.
- Requisitos normativos ficam separados de orientações Web, Android e iOS.
- O foco é avaliado em ordem, visibilidade, não obstrução, persistência e retorno ao acionador.

## Segurança e privacidade

A base não contém dados pessoais, credenciais ou evidências de usuários. Evidências futuras devem evitar dados reais de cadastro, documentos, laudos, conversas e pagamentos.

## Alternativas consideradas

### Manter apenas o XLSX

Rejeitada porque dificulta automação, geração de documentação, revisão em Pull Request e consumo por outros projetos.

### Manter uma lista em cada produto

Rejeitada porque cria divergência e aumenta o custo de atualização.

### Copiar integralmente o texto normativo

Rejeitada porque mistura responsabilidades, dificulta atualização e não acrescenta a interpretação prática necessária. A base mantém referências diretas ao W3C.

## Compatibilidade e migração

Não há quebra imediata nos produtos. A migração ocorrerá gradualmente:

1. adotar a base em novos checklists e auditorias;
2. relacionar padrões e componentes existentes aos critérios;
3. substituir listas locais por links ou dados derivados;
4. registrar requisitos legais e VPAT em uma camada própria, sem alterar o significado dos critérios WCAG.

## Critérios de aceite

- [x] 55 critérios A e AA ativos registrados;
- [x] 31 critérios A e 24 critérios AA;
- [x] 6 critérios novos da WCAG 2.2 identificados;
- [x] 4.1.1 identificado como histórico e removido;
- [x] cada critério possui fonte oficial, regra prática, teste, falhas e interfaces;
- [x] JSON validado automaticamente;
- [x] XLSX inspecionado e sem erros de fórmula;
- [ ] revisão humana de acessibilidade concluída;
- [ ] revisão de linguagem concluída;
- [ ] decisão final registrada nesta RFC.

## Plano de implementação

1. Incluir JSON, XLSX, documentação e passaporte.
2. Atualizar SPEC-0005, CHECK-0001, índices, roadmap e changelog.
3. Validar a estrutura por script.
4. Revisar o conteúdo com acessibilidade e linguagem.
5. Após aceite, gerar documentação navegável por critério e iniciar o mapeamento VPAT.

## Riscos e reversão

O principal risco é uma interpretação CIATA ser confundida com o requisito normativo. A mitigação é a separação de campos e o link oficial por critério.

Em caso de problema, o XLSX pode ser retirado sem remover o JSON ou o histórico. Mudanças de significado devem ser revertidas por commit e registradas na RFC.

## Decisão

A preencher ao final da discussão.

## Relacionamentos

- SPEC-0005 — Acessibilidade;
- CHECK-0001 — Revisão manual de acessibilidade;
- PB-0005 — Executar validação manual de acessibilidade;
- ADR-0003 — Acessibilidade desde a concepção;
- CIATA-DOC-0001 — Base canônica WCAG 2.2 CIATA.
