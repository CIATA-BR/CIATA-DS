# Matriz de validação multiplataforma — CMP-0007 Alert / Status

## Objetivo

Definir evidência mínima para validar Alert/Status sem promover implementações experimentais para estável antes de testes manuais reais.

## Evidência por execução

Registrar plataforma, versão, recurso de tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns

| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| AST-01 | Conteúdo | Mensagem e título são compreensíveis e específicos. |
| AST-02 | Status | Atualização não urgente é anunciada sem interromper indevidamente. |
| AST-03 | Alert | Mensagem realmente urgente recebe prioridade compatível com a plataforma. |
| AST-04 | Anúncio único | A mesma mensagem não é duplicada por regiões concorrentes. |
| AST-05 | Foco | Inserir ou atualizar a mensagem não rouba foco. |
| AST-06 | Variantes | Info, sucesso, aviso e erro não dependem apenas de cor ou ícone. |
| AST-07 | Persistência | Informação crítica permanece disponível tempo suficiente. |
| AST-08 | Dismiss | Quando existir, fechamento possui nome, teclado/touch e retorno de foco coerente. |
| AST-09 | Tema | Conteúdo permanece legível em claro, escuro e sistema. |
| AST-10 | Alto contraste | Mensagem e distinções essenciais permanecem perceptíveis. |
| AST-11 | Escala | Texto ampliado não corta título ou mensagem. |
| AST-12 | Conteúdo acionável | Erros orientam correção em vez de mensagens vagas. |

## Web e Laravel/PHP

Executar com JAWS e NVDA em navegadores suportados, além de teclado, zoom e forced colors.

Verificar especificamente:

- `role="status"`/`aria-live="polite"` para atualizações não urgentes;
- `role="alert"`/`aria-live="assertive"` somente quando necessário;
- `aria-atomic` sem repetição excessiva;
- nenhuma mudança automática de foco;
- significado independente de cor;
- conteúdo dinâmico realmente inserido/atualizado após a região existir, quando o cenário exigir anúncio.

## Python / wxPython

Executar no Windows com leitor de tela suportado. Verificar conteúdo persistente, leitura por navegação, ausência de mudança de foco e integração do callback `on_announce` com a estratégia real do aplicativo. O callback isolado não constitui evidência de anúncio por recurso de tecnologia assistiva.

## Android / Jetpack Compose

Executar com TalkBack. Verificar `LiveRegionMode.Polite` e `Assertive`, atualização de conteúdo, ausência de foco forçado, escala de fonte/display e ausência de anúncios duplicados.

## iOS / SwiftUI

Executar com VoiceOver. Verificar `accessibilityLiveRegion` polite/assertive, atualização dinâmica, ausência de mudança de foco, Dynamic Type e comportamento em claro/escuro.

## Flutter

Executar em Android + TalkBack e iOS + VoiceOver. Verificar `Semantics(liveRegion: true)`, atualização dinâmica, ausência de foco forçado e registrar explicitamente como cada plataforma trata prioridade, pois a implementação atual não presume equivalência assertive/polite.

## Dismiss

A implementação Web/Laravel atual não inclui botão de fechamento para evitar controle sem comportamento real. Quando dismiss for implementado em qualquer plataforma, adicionar cenários específicos de nome, ativação, persistência da informação e retorno de foco.

## Promoção de status

Uma implementação só pode passar de `experimental` para `stable` quando:

1. todos os cenários aplicáveis tiverem evidência registrada;
2. não houver falha crítica aberta de anúncio, foco, conteúdo ou compreensão;
3. prioridade agressiva não estiver sendo usada para mensagens rotineiras;
4. divergências da especificação estiverem corrigidas ou justificadas;
5. validação manual com recurso de tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste e não promove automaticamente nenhuma plataforma para estável.
