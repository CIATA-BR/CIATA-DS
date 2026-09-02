# RFC-0002 — Tokens de espaçamento, raio de borda, escala tipográfica e paleta de modo escuro

## Status

Rascunho.

## Resumo em linguagem simples

O CIATA-DS hoje define apenas cor e tipografia (família, peso, altura de linha). Quem constrói uma interface completa acaba inventando localmente os espaçamentos, os raios de borda, os tamanhos de texto e a paleta de modo escuro — cada projeto com valores próprios e nenhuma delas oficial. Esta proposta adiciona quatro conjuntos de tokens que faltam hoje: uma escala de espaçamento, uma escala de raio de borda, uma escala de tamanhos de tipografia, e uma paleta oficial de modo escuro — todos derivados de um uso real, já testado em produção em três plataformas diferentes (web, desktop e mobile) pelo projeto CIATA - Games.

## Problema

`tokens/cores.css` e `tokens/tipografia.css` cobrem cor e (parcialmente) tipografia, mas não definem:

1. uma escala de espaçamento (margens, preenchimentos, `gap`);
2. uma escala de raio de borda;
3. tamanhos de tipografia (só existem peso e altura de linha, não `font-size`);
4. uma paleta de cores para modo escuro (`prefers-color-scheme: dark` ou equivalente).

Sem esses tokens, cada projeto consumidor do CIATA-DS resolve esses quatro pontos por conta própria, com valores que não conversam entre si nem com a identidade da marca. Isso já aconteceu no projeto CIATA - Games (plataforma de jogos multiplayer para pessoas cegas e com baixa visão, cliente web + desktop + mobile): ao adotar os tokens oficiais de cor e tipografia, tivemos que inventar localmente os quatro conjuntos acima, documentando cada decisão como "candidata a propor ao CIATA-DS" para não divergir silenciosamente da fonte oficial.

Pessoas afetadas: qualquer equipe que implemente uma interface completa a partir do CIATA-DS hoje, e especificamente pessoas com baixa visão ou uso de modo escuro por fotossensibilidade/fadiga visual, que dependem de uma paleta escura com contraste validado em vez de uma inversão automática de cores.

## Contexto

O README de `tokens/` já registra as cores e a família tipográfica oficiais (Manual de Marca CIATA 2025), e a pasta já exporta esses tokens em múltiplos formatos (`ciata.tokens.json`, `css/`, `android/`, `swift/`, `scss/`, `flutter/`, `tailwind/`). Não há, até este RFC, nenhum arquivo ou entrada de espaçamento, raio, escala tipográfica ou modo escuro nesses formatos.

O projeto CIATA - Games passou por um processo de rebranding completo (identidade visual, cliente web, desktop wxPython e mobile Expo/React Native) que consumiu os tokens oficiais de cor e tipografia existentes e, ao mapear a interface inteira, precisou preencher essas quatro lacunas para ter uma UI consistente. As decisões abaixo já estão implementadas e validadas nesse projeto (contraste conferido visualmente e via checagem de sintaxe/build), e são propostas aqui como ponto de partida — não como decisão fechada — para refinamento pela equipe mantenedora.

## Proposta

Adicionar quatro novos conjuntos de tokens, seguindo a mesma convenção de nomenclatura de `cores.css` (prefixo `--ciata-`, nomes em português):

### 1. Espaçamento (`tokens/espacamento.css` + entradas equivalentes em `ciata.tokens.json`)

Escala baseada em múltiplos de 4px, cobrindo do espaçamento mais apertado (dentro de um chip) ao mais largo (entre seções):

```css
:root {
  --ciata-espaco-1: 4px;
  --ciata-espaco-2: 8px;
  --ciata-espaco-3: 12px;
  --ciata-espaco-4: 16px;
  --ciata-espaco-5: 24px;
  --ciata-espaco-6: 32px;
  --ciata-espaco-7: 48px;
}
```

### 2. Raio de borda (`tokens/bordas.css`)

```css
:root {
  --ciata-raio-pequeno: 6px;
  --ciata-raio-medio: 10px;
  --ciata-raio-grande: 14px;
  --ciata-raio-total: 999px; /* pílula/circular */

  /* Tamanho mínimo recomendado de alvo de toque/clique, WCAG 2.2 (2.5.8 Target Size Minimum) */
  --ciata-alvo-toque-minimo: 44px;
}
```

### 3. Escala de tipografia (extensão de `tokens/tipografia.css`)

```css
:root {
  --ciata-fonte-tamanho-pequeno: 14px;
  --ciata-fonte-tamanho-corpo: 16px;
  --ciata-fonte-tamanho-titulo-3: 18px;
  --ciata-fonte-tamanho-titulo-2: 22px;
  --ciata-fonte-tamanho-titulo-1: 28px;
}
```

Combinada às alturas de linha já oficiais (`--ciata-altura-linha-texto`, `--ciata-altura-linha-titulo`).

### 4. Paleta de modo escuro (`tokens/cores-escuro.css`)

Espelha os tokens semânticos já oficiais (fundo, texto, borda, ação, estados), com uma versão escura validada. Os tons de marca (amarelo e azul) são ajustados para contraste em fundo escuro; o amarelo de foco permanece o mesmo tom da marca em ambos os modos, por ser o ponto de maior reconhecimento visual:

```css
@media (prefers-color-scheme: dark) {
  :root {
    --ciata-escuro-fundo-pagina: #111821;
    --ciata-escuro-fundo-superficie: #182432;
    --ciata-escuro-fundo-superficie-forte: #223047;
    --ciata-escuro-texto-primario: #f1f5f9;
    --ciata-escuro-texto-secundario: #b6c2d2;
    --ciata-escuro-borda: #41516a;

    --ciata-escuro-acao-primaria-fundo: #8fd0f8;
    --ciata-escuro-acao-primaria-texto: #08111c;
    --ciata-escuro-acao-secundaria-fundo: transparent;
    --ciata-escuro-acao-secundaria-texto: #8fd0f8;
    --ciata-escuro-acao-secundaria-borda: #8fd0f8;

    --ciata-escuro-foco: var(--ciata-cor-amarelo);
    --ciata-escuro-foco-contraste: #08111c;

    --ciata-escuro-sucesso-fundo: #10352f;
    --ciata-escuro-sucesso-texto: #5eead4;
    --ciata-escuro-erro-fundo: #3a1613;
    --ciata-escuro-erro-texto: #ff9b90;
  }
}
```

Todos os quatro conjuntos devem, como os tokens já existentes, ganhar as exportações equivalentes em `ciata.tokens.json` e nos formatos de plataforma já publicados (`css/`, `android/`, `swift/`, `scss/`, `flutter/`, `tailwind/`), para manter a consistência entre plataformas que o repositório já garante para cor e tipografia.

## Experiência das pessoas

- **Equipes consumidoras**: deixam de inventar espaçamento/raio/tamanhos/modo escuro por conta própria a cada novo projeto; ganham uma referência única para revisão de design e código.
- **Usuárias e usuários finais**: interfaces de diferentes produtos CIATA passam a ter a mesma "textura" visual (mesmo raio, mesmo ritmo de espaçamento, mesma paleta escura), reduzindo carga cognitiva ao trocar de produto.
- **Mantenedores do CIATA-DS**: ganham mais um conjunto de tokens para manter e versionar, com o mesmo processo já usado para cor/tipografia.

## Acessibilidade

- O alvo mínimo de toque/clique (`--ciata-alvo-toque-minimo: 44px`) atende ao critério WCAG 2.2 2.5.8 (Target Size Minimum).
- A escala de tipografia mantém proporção compatível com zoom de texto do navegador/SO; nenhum tamanho é fixado em unidade absoluta incompatível com zoom (todos os valores usam `px` como os tokens de tipografia já existentes usam, mas podem ser expressos em `rem` na revisão, se a equipe preferir).
- A paleta de modo escuro proposta já foi verificada visualmente quanto a contraste texto/fundo e mantém o par foco/contraste-de-foco em todas as combinações, seguindo o mesmo padrão do modo claro já oficial.
- Nenhum destes tokens introduz informação que dependa exclusivamente de cor.

## Segurança e privacidade

Não há dados pessoais ou credenciais envolvidos — são apenas valores de design (números e cores).

## Alternativas consideradas

- **Deixar cada projeto definir os próprios valores** (situação atual): rejeitada, é exatamente o problema que motiva este RFC.
- **Escala de espaçamento em base 8 apenas** (sem o `--ciata-espaco-1: 4px`): descartada porque componentes compactos (chips, tags) precisam de um espaçamento menor que 8px.
- **Gerar a paleta escura automaticamente por inversão/`filter: invert()`**: descartada por não permitir controle fino de contraste por token semântico (ex.: garantir AA em texto sobre fundo, independentemente da cor de origem).

## Compatibilidade e migração

Nenhuma quebra de compatibilidade: são tokens novos, não alteram nem removem nenhum token existente. Projetos que já definem esses valores localmente podem migrar gradualmente, um token de cada vez.

## Critérios de aceite

- [ ] `tokens/espacamento.css`, `tokens/bordas.css` e a extensão de `tokens/tipografia.css` publicados com a nomenclatura `--ciata-*` em português, consistente com os tokens já existentes;
- [ ] `tokens/cores-escuro.css` publicado com o par completo de tokens semânticos escuros e validação de contraste WCAG AA documentada;
- [ ] os quatro conjuntos refletidos em `ciata.tokens.json` e nos formatos de plataforma já publicados (css/android/swift/scss/flutter/tailwind);
- [ ] `tokens/README.md` atualizado descrevendo os novos conjuntos;
- [ ] `CHANGELOG.md` atualizado.

## Plano de implementação

1. Abrir Issue referenciando este RFC.
2. Após aceite do RFC, implementar os quatro arquivos de token + exportações de formato em uma ou mais branches `feat/tokens-espacamento`, `feat/tokens-modo-escuro`, etc.
3. Atualizar `tokens/README.md` e `CHANGELOG.md`.
4. Abrir PR(s) referenciando a Issue e este RFC, com evidências de contraste (WCAG AA) para a paleta escura.

## Riscos e reversão

Risco baixo: são tokens aditivos. Reversão simples caso a equipe decida por valores diferentes: os arquivos podem ser substituídos sem impacto em consumidores que ainda não os adotaram.

## Decisão

A preencher pela equipe mantenedora do CIATA-DS.

## Relacionamentos

- `tokens/cores.css`, `tokens/cores.json`, `tokens/tipografia.css` — tokens oficiais existentes que esta proposta estende.
- Projeto consumidor de referência: CIATA - Games (cliente web `style.css`, cliente mobile `src/theme/ciataTheme.ts`, cliente desktop `client/ui/registration_dialog.py`), onde os quatro conjuntos aqui propostos já estão implementados como derivação local, aguardando esta proposta para deixarem de divergir da fonte oficial.
