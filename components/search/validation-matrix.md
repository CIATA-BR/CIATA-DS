# Matriz de validação multiplataforma — CMP-0021 Search

## Objetivo
Definir evidência mínima para validar busca sem depender de informação visual isolada, movimentos arbitrários de foco ou anúncios excessivos.

## Evidência por execução
Registrar plataforma, versão, tecnologia assistiva, navegador/dispositivo, cenário, resultado esperado/observado, falhas e limitações.

## Cenários comuns
| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| SRC-01 | Nome | Campo de busca possui nome claro e persistente. |
| SRC-02 | Landmark | Região de busca é identificável quando aplicável e múltiplas regiões possuem nomes distintos. |
| SRC-03 | Envio | Busca explícita é acionável por teclado/toque sem depender de ícone sem nome. |
| SRC-04 | Limpar | Controle dedicado possui nome claro e preserva foco lógico; não duplica clear nativo de forma confusa. |
| SRC-05 | Teclado | Tab/Shift+Tab e Enter seguem comportamento previsível. |
| SRC-06 | Foco | Atualização de resultados não move foco arbitrariamente e não há autofocus indevido. |
| SRC-07 | Loading | Estado de carregamento é perceptível sem bloquear edição desnecessariamente. |
| SRC-08 | Erro | Falha é específica, persistente e não depende apenas de cor. |
| SRC-09 | Estado vazio | Ausência de resultados é informada e permite ajustar o termo. |
| SRC-10 | Contagem | Quantidade conhecida pode ser anunciada sem despejar toda a lista em live region. |
| SRC-11 | Incremental | Debounce/throttle evita requisições e anúncios excessivos. |
| SRC-12 | Anúncios | Leitor de tela recebe mudanças significativas sem interrupção a cada tecla. |
| SRC-13 | Disabled/readonly | Estados permanecem semanticamente distintos e não permitem envio enganoso. |
| SRC-14 | Alvo | Controles interativos respeitam alvo mínimo da plataforma. |
| SRC-15 | Tema | Campo, ações, foco e estados permanecem perceptíveis em claro/escuro/sistema. |
| SRC-16 | Alto contraste | Foco, bordas e ações permanecem distinguíveis. |
| SRC-17 | Escala | Zoom/text scaling não corta campo, ações ou mensagens essenciais. |
| SRC-18 | Termo vazio | Política para busca vazia é explícita e previsível. |
| SRC-19 | Resposta assíncrona antiga | Resposta fora de ordem é ignorada quando existe consulta mais recente. |
| SRC-20 | Erro durante requisição | Falha preserva termo atual e permite nova tentativa. |
| SRC-21 | Busca em andamento | Nova edição/envio durante request não perde foco nem produz estado incoerente. |
| SRC-22 | Ir para resultados | Quando oferecido, salto aos resultados é ação explícita; foco nunca é forçado ao primeiro item. |
| SRC-23 | Unicode/RTL | Acentos, emoji, RTL e termos longos não quebram nome, edição ou resultados. |
| SRC-24 | Autofill/histórico | Autofill/histórico do navegador não é confundido com Autocomplete do DS. |
| SRC-25 | Privacidade | Termos sensíveis não são expostos em URL/logs/referrers sem avaliação explícita. |
| SRC-26 | Segurança backend | Consulta usa parametrização/escaping e trata termo como dado não confiável. |
| SRC-27 | Múltiplas instâncias | IDs e nomes de landmarks permanecem únicos quando há mais de uma busca. |
| SRC-28 | Search vs Autocomplete | Campo de busca não assume semântica de combobox/listbox sem adotar o contrato do Autocomplete. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400% e forced colors. Verificar `role="search"`, nome de landmark quando houver múltiplas regiões, `label`, `input type="search"`, Enter/botão de envio, disabled/readonly coerentes, clear nativo versus customizado, erro associado, status moderado e foco estável. Validar também política GET/POST para termos sensíveis e parametrização no backend consumidor.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.SearchCtrl`, nome programático, Enter/botão nativo, botão cancelar/limpar, retorno de foco e ausência de anúncios excessivos no host.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `OutlinedTextField`, label, IME Search, enabled/readOnly, envio com o valor atual, placeholder opcional, escala de fonte/display e permanência do foco durante atualização dos resultados.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `TextField`, nome, `submitLabel(.search)`, envio com valor atual, capitalização configurável conforme domínio, Dynamic Type e preservação de contexto durante atualização.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `TextField`, `TextInputAction.search`, nome, enabled/readOnly, validação do label em build de release, text scaling e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `estável` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/foco/envio/feedback/privacidade/segurança e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
