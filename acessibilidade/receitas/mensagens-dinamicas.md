# Receita — Mensagens dinâmicas e feedback

## Objetivo

Garantir que alterações relevantes de estado sejam percebidas sem roubar foco, duplicar fala ou interromper desnecessariamente a pessoa usuária.

## Regra comum

Mensagens dinâmicas devem ser classificadas antes da implementação:

- **informativas:** confirmam estado ou progresso sem exigir ação imediata;
- **importantes:** alteram significativamente a compreensão da tarefa;
- **críticas:** exigem ação ou indicam falha que impede a continuação.

A técnica de anúncio deve ser proporcional à importância. Nem toda alteração merece anúncio automático.

## Web

- usar regiões vivas somente para conteúdo dinâmico que precise ser anunciado sem mudança de foco;
- preferir `aria-live="polite"` para atualizações não urgentes;
- reservar anúncios assertivos para situações realmente críticas;
- não inserir o mesmo texto simultaneamente em várias regiões vivas;
- mensagens de erro associadas a campos devem também estar programaticamente relacionadas ao controle;
- carregamento contínuo, contadores e streaming não devem disparar fala a cada pequena atualização.

## Android

- usar anúncios de acessibilidade somente quando a mudança não for naturalmente comunicada pelo componente;
- priorizar APIs semânticas e estados do componente antes de chamadas de anúncio explícito;
- evitar múltiplos anúncios consecutivos para a mesma ação;
- mensagens de erro devem identificar o campo ou ação afetada e explicar a correção quando possível;
- progresso frequente deve ser agrupado ou anunciado em marcos úteis, evitando fala contínua.

## iOS

- usar notificações de anúncio com parcimônia;
- preferir mudança semântica de estado ou valor quando o VoiceOver puder perceber naturalmente a atualização;
- evitar sequência de `announcement` que interrompa fala anterior sem necessidade;
- erros críticos podem exigir anúncio imediato, mas o foco deve permanecer em ponto lógico para correção;
- progresso repetitivo deve ser agregado em mudanças significativas.

## Falhas comuns

- toast visual sem equivalente acessível;
- anúncio que rouba foco;
- mesma mensagem falada duas ou três vezes;
- erro anunciado sem identificar onde corrigir;
- streaming gerando fala interminável;
- uso de anúncio para compensar controle sem estado acessível.

## Validação

Confirmar com leitor de tela que a mensagem é percebida no momento adequado, que não desloca o foco sem motivo e que não interfere de forma excessiva com a leitura corrente.