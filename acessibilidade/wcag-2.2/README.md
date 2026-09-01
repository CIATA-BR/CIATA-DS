# Base canônica WCAG 2.2

Esta pasta reúne a referência estruturada adotada pelo CIATA para interpretar, implementar e testar os critérios de sucesso A e AA da WCAG 2.2.

## Escopo

- 55 critérios ativos: 31 de nível A e 24 de nível AA;
- 6 critérios introduzidos pela WCAG 2.2;
- critério 4.1.1 preservado como registro histórico, com estado explícito de removido;
- aplicações Web, Android e iOS, com orientação complementar para documentos e software não web;
- testes com JAWS, NVDA, VoiceOver, TalkBack, teclado físico e display Braille conforme o comportamento avaliado.

Os critérios AAA podem ser incorporados posteriormente, mas não fazem parte do alvo de conformidade padrão desta versão.

## Arquivos

- [`criterios.json`](criterios.json): fonte canônica legível por ferramentas, documentação e futuras automações;
- [`base-canonica-wcag-2.2-ciata.xlsx`](base-canonica-wcag-2.2-ciata.xlsx): versão acessível para consulta, revisão e execução manual;
- [`base-canonica-wcag-2.2-ciata.asset.md`](base-canonica-wcag-2.2-ciata.asset.md): passaporte e estado de validação do artefato.

## Separação obrigatória

Cada registro distingue:

1. identificação oficial do critério;
2. regra prática redigida pela CIATA;
3. comportamento assistivo afetado;
4. componentes e interfaces prioritárias;
5. teste manual mínimo e resultado esperado;
6. exemplos de falhas;
7. orientação complementar da CIATA;
8. fonte oficial do W3C.

Os resumos em português não substituem o texto normativo. Em caso de dúvida ou conflito, prevalece a [Recomendação WCAG 2.2](https://www.w3.org/TR/WCAG22/).

## Uso no ecossistema

Produtos do CIATA devem referenciar esta base em vez de manter listas divergentes. Uma implementação pode complementar os critérios com orientações específicas de plataforma, mas não pode alterar o significado normativo nem retirar requisitos aplicáveis sem decisão documentada.

Para software e documentos não web, a aplicação deve considerar também o [WCAG2ICT](https://www.w3.org/TR/wcag2ict-22/) e as orientações oficiais da plataforma.

## Manutenção

Antes de alterar `criterios.json`:

1. verificar a mudança em fonte primária oficial;
2. distinguir alteração normativa, orientação técnica e interpretação da CIATA;
3. atualizar a data `lastVerified` quando a revisão abranger toda a base;
4. executar `node scripts/validar-wcag-22.mjs`;
5. atualizar XLSX, documentação relacionada e histórico quando houver impacto;
6. submeter a mudança à revisão de acessibilidade e linguagem.

Não editar apenas a planilha. O JSON é a fonte canônica e o XLSX é uma representação derivada.
