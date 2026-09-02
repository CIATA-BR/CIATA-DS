# RFC-0002 — Tokens de espaçamento, dimensão, tipografia e tema

## Status

Rascunho — proposta revisada para decisão da equipe mantenedora.

## Resumo em linguagem simples

O CIATA-DS hoje define cores e parte da tipografia, mas ainda deixa lacunas importantes para quem precisa construir uma interface completa. Cada projeto consumidor acaba definindo localmente espaçamentos, raios de borda, dimensões mínimas de interação, tamanhos de texto e comportamento de tema claro/escuro.

Esta RFC propõe quatro frentes complementares:

1. escala de espaçamento;
2. dimensões e geometria de componentes, incluindo raios de borda e alvo mínimo de interação;
3. escala tipográfica com intenção semântica e adaptação por plataforma;
4. arquitetura de tema claro, escuro e sistema baseada nos mesmos tokens semânticos.

Os valores partem de uso real no projeto CIATA - Games em web, desktop e mobile. Essa experiência é evidência empírica inicial, não validação suficiente por si só: a adoção no CIATA-DS depende dos critérios de aceite e das verificações próprias desta RFC.

## Problema

`tokens/cores.css` e `tokens/tipografia.css` cobrem cor e parte da tipografia, mas não definem de forma canônica:

1. uma escala de espaçamento para margens, preenchimentos e `gap`;
2. raios de borda e dimensões mínimas de interação;
3. uma escala de tamanhos tipográficos;
4. uma arquitetura de tema que suporte claro, escuro e preferência do sistema sem obrigar componentes a conhecer o tema ativo.

Sem esses tokens, cada projeto consumidor do CIATA-DS resolve esses pontos por conta própria, com valores e comportamentos que podem divergir entre produtos.

Isso já ocorreu no projeto CIATA - Games, que consumiu os tokens oficiais de cor e tipografia e precisou criar localmente valores adicionais para web, desktop wxPython e mobile Expo/React Native. Essas decisões foram registradas como candidatas ao CIATA-DS para evitar que uma derivação local se transforme silenciosamente em padrão institucional.

Pessoas afetadas incluem qualquer equipe que implemente interfaces a partir do CIATA-DS e, em especial, pessoas que dependem de ampliação, escalabilidade tipográfica, áreas de interação confortáveis ou temas de baixo brilho e contraste controlado.

## Contexto

A pasta `tokens/` já registra cores e tipografia oficiais e publica representações em múltiplos formatos, incluindo `ciata.tokens.json`, CSS, Android, Swift, SCSS, Flutter e Tailwind.

A presente RFC não publica tokens. Ela define a decisão arquitetural e os critérios que deverão orientar PRs posteriores de implementação.

## Princípios da proposta

- componentes devem consumir intenção semântica, não valores específicos de tema;
- claro, escuro e sistema são estados de preferência de apresentação, não variantes de componentes;
- a preferência explícita da pessoa deve prevalecer sobre a preferência do sistema;
- valores-base podem ser compartilhados, mas cada plataforma deve exportá-los em unidades e mecanismos apropriados;
- WCAG define mínimos de conformidade; o CIATA pode adotar padrões internos mais robustos;
- experiência de um produto consumidor é insumo para decisão, não substituto de validação do Design System.

## Proposta

### 1. Espaçamento

Adicionar uma escala primitiva baseada em múltiplos de 4, cobrindo de espaços compactos a separação entre seções.

Exemplo para CSS:

```css
:root {
  --ciata-espaco-1: 0.25rem; /* 4px com base 16px */
  --ciata-espaco-2: 0.5rem;  /* 8px */
  --ciata-espaco-3: 0.75rem; /* 12px */
  --ciata-espaco-4: 1rem;    /* 16px */
  --ciata-espaco-5: 1.5rem;  /* 24px */
  --ciata-espaco-6: 2rem;    /* 32px */
  --ciata-espaco-7: 3rem;    /* 48px */
}
```

A escala primitiva pode receber aliases semânticos em evolução posterior, por exemplo espaço entre conteúdo de componente, entre grupos e entre seções. Os aliases não substituem a escala base.

### 2. Dimensões e geometria

Raios de borda e dimensões de interação pertencem à mesma frente de geometria, mas permanecem semanticamente separados.

Exemplo para CSS:

```css
:root {
  --ciata-raio-pequeno: 0.375rem; /* 6px */
  --ciata-raio-medio: 0.625rem;   /* 10px */
  --ciata-raio-grande: 0.875rem;  /* 14px */
  --ciata-raio-total: 999px;      /* pílula/circular */

  --ciata-alvo-interacao-minimo: 2.75rem; /* 44px com base 16px */
}
```

O token `--ciata-alvo-interacao-minimo` representa um padrão interno recomendado de 44 × 44 CSS px para controles acionáveis quando a plataforma e o contexto permitirem.

Esse valor é deliberadamente superior ao mínimo do WCAG 2.2 SC 2.5.8 Target Size (Minimum), nível AA, que estabelece 24 × 24 CSS px considerando as exceções previstas pelo critério. A referência de 44 × 44 CSS px corresponde ao SC 2.5.5 Target Size (Enhanced), nível AAA.

Portanto, o CIATA adota 44 × 44 como padrão de projeto mais robusto, sem declarar incorretamente que 44 × 44 é o mínimo exigido pelo SC 2.5.8.

### 3. Escala tipográfica

A escala deve expressar intenção visual sem confundir aparência com hierarquia semântica de HTML ou de qualquer outra plataforma.

Exemplo de nomes:

```css
:root {
  --ciata-fonte-tamanho-pequeno: 0.875rem;      /* 14px */
  --ciata-fonte-tamanho-corpo: 1rem;            /* 16px */
  --ciata-fonte-tamanho-destaque: 1.125rem;     /* 18px */
  --ciata-fonte-tamanho-titulo-medio: 1.375rem; /* 22px */
  --ciata-fonte-tamanho-titulo-grande: 1.75rem; /* 28px */
}
```

`titulo-grande`, `titulo-medio` e demais nomes são estilos visuais. Eles não determinam que um elemento seja `h1`, `h2`, `h3` nem substituem a hierarquia semântica da interface.

A implementação deve combinar esses tamanhos às alturas de linha já oficiais e respeitar os mecanismos de escalabilidade de cada plataforma:

- web: preferir unidades relativas, como `rem`, e preservar zoom/reflow;
- Android: exportar tamanho de texto em `sp` ou mecanismo equivalente escalável;
- iOS: integrar com Dynamic Type ou métricas escaláveis equivalentes;
- Flutter: respeitar o mecanismo de text scaling da plataforma e não neutralizar o fator definido pela pessoa;
- demais plataformas: usar a unidade ou API nativa que preserve ampliação e preferência tipográfica do sistema quando disponível.

O valor no JSON canônico representa intenção/base lógica. Cada exportador é responsável por traduzi-lo para a unidade adequada à plataforma.

### 4. Arquitetura de tema: claro, escuro e sistema

Os componentes não devem consumir tokens com nomes como `--ciata-escuro-*`. Eles devem continuar usando os mesmos tokens semânticos, por exemplo:

- `--ciata-fundo-pagina`;
- `--ciata-fundo-superficie`;
- `--ciata-texto-primario`;
- `--ciata-texto-secundario`;
- `--ciata-borda`;
- `--ciata-acao-primaria-fundo`;
- `--ciata-acao-primaria-texto`;
- `--ciata-foco`;
- tokens semânticos de sucesso, aviso, erro e estado desabilitado.

O tema altera os valores desses aliases semânticos, não a API consumida pelo componente.

A arquitetura deve admitir três preferências:

1. `claro` — escolha explícita da pessoa;
2. `escuro` — escolha explícita da pessoa;
3. `sistema` — acompanha `prefers-color-scheme` ou mecanismo equivalente da plataforma.

Quando existir escolha explícita `claro` ou `escuro`, ela prevalece sobre a preferência do sistema. A preferência `sistema` é a única que acompanha automaticamente mudanças do sistema operacional ou navegador.

Uma implementação CSS poderá usar um atributo estável no elemento raiz, como `data-ciata-tema="claro"`, `data-ciata-tema="escuro"` e `data-ciata-tema="sistema"`, desde que os componentes permaneçam independentes desse atributo e consumam apenas os aliases semânticos.

#### Valores escuros candidatos

Os seguintes valores são candidatos iniciais, derivados do CIATA - Games e sujeitos à validação final na implementação:

```css
/* Exemplo conceitual do tema escuro: sobrescreve aliases semânticos. */
:root[data-ciata-tema="escuro"] {
  --ciata-fundo-pagina: #111821;
  --ciata-fundo-superficie: #182432;
  --ciata-fundo-superficie-elevada: #223047;
  --ciata-texto-primario: #f1f5f9;
  --ciata-texto-secundario: #b6c2d2;
  --ciata-borda: #41516a;

  --ciata-acao-primaria-fundo: #8fd0f8;
  --ciata-acao-primaria-texto: #08111c;
  --ciata-acao-secundaria-fundo: transparent;
  --ciata-acao-secundaria-texto: #8fd0f8;
  --ciata-acao-secundaria-borda: #8fd0f8;

  --ciata-foco: #ffd000;
  --ciata-foco-contraste: #08111c;

  --ciata-sucesso-fundo: #10352f;
  --ciata-sucesso-texto: #5eead4;
  --ciata-erro-fundo: #3a1613;
  --ciata-erro-texto: #ff9b90;
}
```

A implementação final deverá completar também aviso e estado desabilitado, preservando a mesma cobertura semântica do tema claro.

## Evidência inicial de contraste

As razões abaixo foram calculadas pela fórmula de luminância relativa do WCAG a partir dos valores atuais de `tokens/cores.css` para o tema claro e dos valores candidatos desta RFC para o tema escuro.

| Par avaliado | Razão aproximada |
| --- | ---: |
| Claro — texto primário `#111820` / fundo página `#f7f9fb` | 16,93:1 |
| Claro — texto secundário `#536271` / fundo página `#f7f9fb` | 5,93:1 |
| Claro — ação primária texto `#ffffff` / fundo `#16365e` | 12,19:1 |
| Claro — ação secundária texto `#16365e` / fundo `#ffffff` | 12,19:1 |
| Claro — sucesso texto `#145c2e` / fundo `#e7f5ec` | 7,18:1 |
| Claro — erro texto `#8a1820` / fundo `#fdebec` | 8,19:1 |
| Claro — foco amarelo `#ffd000` / fundo página `#f7f9fb` | 1,39:1 |
| Claro — foco amarelo `#ffd000` / contraste `#111820` | 12,14:1 |
| Escuro — texto primário `#f1f5f9` / fundo página `#111821` | 16,29:1 |
| Escuro — texto secundário `#b6c2d2` / fundo página `#111821` | 9,89:1 |
| Escuro — ação primária texto `#08111c` / fundo `#8fd0f8` | 11,33:1 |
| Escuro — ação secundária texto `#8fd0f8` / fundo página `#111821` | 10,66:1 |
| Escuro — sucesso texto `#5eead4` / fundo `#10352f` | 9,03:1 |
| Escuro — erro texto `#ff9b90` / fundo `#3a1613` | 7,93:1 |
| Escuro — foco amarelo `#ffd000` / fundo página `#111821` | 12,13:1 |
| Escuro — foco amarelo `#ffd000` / contraste `#08111c` | 12,89:1 |

A tabela é evidência inicial, não certificação automática de conformidade de componentes.

O foco amarelo isolado não apresenta contraste suficiente contra o fundo claro para ser usado como único limite visual de foco. A implementação deve preservar o par `--ciata-foco` + `--ciata-foco-contraste` ou outro tratamento equivalente que garanta contraste perceptível do indicador de foco contra fundos adjacentes. A validação deve considerar o indicador completo, sua espessura, área e cores adjacentes, conforme os critérios aplicáveis de aparência do foco.

Todos os pares efetivamente utilizados em componentes deverão ser validados na implementação, inclusive aviso, desabilitado, bordas relevantes e estados de interação.

## Experiência das pessoas

- **Equipes consumidoras**: deixam de inventar valores fundamentais a cada projeto e passam a revisar design e implementação contra uma fonte comum.
- **Usuárias e usuários finais**: produtos CIATA ganham ritmo visual mais consistente e comportamento previsível de tema e escalabilidade.
- **Pessoas com baixa visão ou sensibilidade a brilho**: podem escolher tema claro ou escuro independentemente da configuração do sistema quando o produto oferecer a preferência explícita.
- **Mantenedores do CIATA-DS**: passam a versionar e testar uma API semântica de tokens que pode evoluir sem acoplar componentes a um tema específico.

## Acessibilidade

- O CIATA propõe 44 × 44 CSS px como padrão interno de alvo de interação, acima do mínimo de 24 × 24 CSS px do WCAG 2.2 SC 2.5.8 AA e alinhado à referência de 44 × 44 CSS px do SC 2.5.5 AAA, observadas as condições e exceções de cada critério.
- Tamanhos tipográficos devem ser exportados com mecanismos escaláveis apropriados a cada plataforma e não podem bloquear zoom, Dynamic Type, `sp`, text scaling ou mecanismos equivalentes.
- O modo escuro é uma paleta projetada e validada; não deve ser produzido por inversão automática de cores.
- A pessoa deve poder usar o tema explícito quando o produto oferecer esse controle, sem depender exclusivamente da preferência do sistema.
- Tokens semânticos de estado não tornam cor a única forma de comunicar sucesso, aviso, erro, seleção, foco ou qualquer outra informação.
- Automação de contraste apoia a validação, mas não substitui inspeção do componente final e testes de interação.

## Segurança e privacidade

Não há dados pessoais ou credenciais envolvidos. Preferências de tema podem ser persistidas localmente pelo produto consumidor, mas esta RFC não exige coleta, transmissão ou associação dessa preferência a uma identidade.

## Alternativas consideradas

- **Deixar cada projeto definir os próprios valores**: rejeitada, pois perpetua divergência entre produtos.
- **Escala de espaçamento apenas em base 8**: rejeitada porque componentes compactos podem precisar de incremento de 4.
- **Usar `--ciata-escuro-*` diretamente nos componentes**: rejeitada porque acopla o componente ao tema e duplica a API semântica.
- **Apenas `prefers-color-scheme` sem escolha explícita**: rejeitada porque impede que a pessoa escolha um tema diferente do sistema.
- **Gerar modo escuro por `filter: invert()` ou inversão automática**: rejeitada porque não permite controle semântico e verificável de contraste.
- **Usar 24 × 24 como padrão interno de alvo apenas por ser o mínimo AA**: não adotada como padrão preferencial; o CIATA propõe 44 × 44 quando aplicável, mantendo 24 × 24 como referência mínima do SC 2.5.8.

## Compatibilidade e migração

A proposta é aditiva em relação aos consumidores atuais. A implementação de tema deverá preservar os nomes dos tokens semânticos existentes para que componentes não precisem adotar uma API paralela de modo escuro.

Projetos que já possuem valores locais podem migrar gradualmente, desde que a migração não misture aliases locais e canônicos de forma que torne o tema imprevisível.

Alterações futuras de valor em tokens já adotados deverão seguir versionamento e análise de impacto compatíveis com a política do CIATA-DS.

## Critérios de aceite

- [ ] escala de espaçamento publicada na fonte canônica e exportada para as plataformas suportadas;
- [ ] raios de borda e alvo mínimo de interação publicados como tokens semanticamente distintos dentro da frente de dimensões e geometria;
- [ ] documentação registra corretamente 24 × 24 CSS px para SC 2.5.8 AA e 44 × 44 CSS px para SC 2.5.5 AAA, mantendo 44 × 44 como padrão interno recomendado do CIATA;
- [ ] escala tipográfica usa nomes que não confundem estilo visual com hierarquia semântica;
- [ ] exportações tipográficas respeitam mecanismos escaláveis apropriados a web, Android, iOS e Flutter;
- [ ] tema claro e tema escuro utilizam a mesma API de tokens semânticos;
- [ ] preferência de tema suporta claro, escuro e sistema, com escolha explícita prevalecendo sobre o sistema;
- [ ] cobertura semântica do tema escuro inclui fundos, textos, bordas, ações, foco, sucesso, aviso, erro e estados desabilitados equivalentes ao tema claro;
- [ ] razões de contraste relevantes são calculadas e documentadas como evidência de implementação;
- [ ] indicador de foco é validado como composição completa, e não apenas pela cor amarela isolada;
- [ ] os novos conjuntos são refletidos em `ciata.tokens.json` e nos formatos de plataforma publicados pelo repositório;
- [ ] `tokens/README.md` e `CHANGELOG.md` são atualizados na implementação.

## Plano de implementação

1. Revisar e aceitar esta RFC por meio da Issue #64 e da PR correspondente.
2. Implementar os tokens em PRs pequenos e revisáveis, preferencialmente separados por frente quando isso reduzir risco.
3. Atualizar a fonte canônica e todos os exportadores suportados.
4. Adicionar validação automatizada de estrutura e contraste onde aplicável.
5. Validar manualmente componentes representativos nos temas claro e escuro, incluindo foco, estados, zoom/escalabilidade e preferência explícita de tema.
6. Atualizar `tokens/README.md` e `CHANGELOG.md`.

## Riscos e reversão

O risco de introdução dos novos tokens é baixo enquanto nenhum consumidor depender deles. Após adoção, mudanças de valor podem alterar layout, densidade, leitura e contraste, portanto deixam de ser consideradas reversão trivial.

A arquitetura com aliases semânticos reduz esse risco: ajustes de paleta podem ocorrer na camada de tema sem exigir alterações em todos os componentes consumidores.

## Decisão

A preencher pela equipe mantenedora do CIATA-DS.

Sugestão de registro após revisão: **Aceita com os critérios de implementação e acessibilidade definidos nesta RFC**.

## Relacionamentos

- Issue #64 — discussão e rastreabilidade desta proposta;
- `tokens/cores.css`, `tokens/cores.json`, `tokens/tipografia.css` — tokens oficiais existentes que a proposta complementa;
- WCAG 2.2 SC 2.5.8 Target Size (Minimum), nível AA;
- WCAG 2.2 SC 2.5.5 Target Size (Enhanced), nível AAA;
- projeto consumidor de referência: CIATA - Games, com implementações locais em web, mobile e desktop usadas como evidência empírica inicial.
