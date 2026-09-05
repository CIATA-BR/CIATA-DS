# Fila de validação e promoção dos componentes

## Objetivo

Organizar a passagem dos componentes de `experimental` para `estável` sem antecipar evidência que ainda não existe. A ordem prioriza menor complexidade semântica, maior uso transversal e menor dependência de interação composta.

## Regra de promoção

Um componente só pode ser promovido quando a matriz aplicável tiver evidência manual registrada para as plataformas declaradas como suportadas, sem falha crítica aberta de nome, papel, estado, foco, acionamento, teclado, feedback ou target size.

A promoção pode ocorrer por plataforma quando a própria matriz do componente permitir. O status global não deve esconder limitações específicas de plataforma.

## Lote 1 — controles fundamentais

1. `CMP-0001 — Button / Botão`
2. `CMP-0002 — TextField / Campo de texto`
3. `CMP-0003 — Checkbox / Caixa de seleção`
4. `CMP-0004 — Radio / Botão de opção`
5. `CMP-0006 — Link / Link de navegação`

Motivo: componentes nativos, altamente reutilizados e com menor custo de validação cruzada. Servem também como base para validar tokens, foco, target size e convenções de evidência.

## Lote 2 — seleção e feedback

1. `CMP-0005 — Select / Combobox`
2. `CMP-0007 — Alert / Status`
3. `CMP-0009 — Loading / Progress`
4. `CMP-0012 — Toast`
5. `CMP-0019 — Date Picker / Seletor de data`

Motivo: exigem validação adicional de estados, anúncios, seleção e comportamento nativo por plataforma.

## Lote 3 — navegação e composição

1. `CMP-0011 — Pagination / Paginação`
2. `CMP-0013 — Tabs / Abas`
3. `CMP-0014 — Accordion / Acordeão`
4. `CMP-0015 — Menu`
5. `CMP-0016 — Breadcrumb / Trilha de navegação`
6. `CMP-0010 — Card interativo`

Motivo: dependem de ordem de foco, navegação interna, relacionamento entre elementos e maior variedade de contexto de uso.

## Lote 4 — overlays e fluxos complexos

1. `CMP-0008 — Modal / Dialog`
2. `CMP-0017 — Tooltip`
3. `CMP-0018 — Bottom Sheet`
4. `CMP-0020 — File Upload / Envio de arquivo`
5. `CMP-0021 — Search / Busca`
6. `CMP-0022 — Autocomplete`

Motivo: concentram maior risco de divergência entre plataformas, foco dinâmico, estados assíncronos, overlays, arquivos, sugestões e integração com tecnologias assistivas.

## Evidência mínima por plataforma

Registrar, para cada cenário obrigatório:

- componente e plataforma;
- versão do sistema/framework;
- navegador ou dispositivo quando aplicável;
- tecnologia assistiva e versão;
- cenário executado;
- resultado esperado e observado;
- `pass`, `fail`, `blocked` ou `not-applicable`;
- issue/PR vinculada quando houver falha;
- limitação conhecida;
- produto real ou harness usado.

## Ordem operacional

Para cada componente da fila:

1. conferir especificação e matriz atuais;
2. revisar novamente todas as plataformas no mesmo lote;
3. corrigir divergências de código/documentação antes do teste manual;
4. executar e registrar evidência manual;
5. corrigir falhas encontradas;
6. promover somente as plataformas elegíveis;
7. atualizar catálogo e documentação de status;
8. avançar para o próximo componente.

## Estado atual

- `CMP-0002` a `CMP-0022`: catálogo em `experimental`.
- `CMP-0001`: permanece `rascunho` no catálogo enquanto os critérios formais da especificação não forem fechados; sua matriz já trata as implementações de plataforma como experimentais em validação.
- Nenhum componente deve ser marcado como `estável` apenas por revisão de código ou existência de matriz.
