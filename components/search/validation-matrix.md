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
| SRC-04 | Limpar | Controle dedicado possui nome claro e preserva foco lógico. |
| SRC-05 | Teclado | Tab/Shift+Tab e Enter seguem comportamento previsível. |
| SRC-06 | Foco | Atualização de resultados não move foco arbitrariamente. |
| SRC-07 | Loading | Estado de carregamento é perceptível sem bloquear edição desnecessariamente. |
| SRC-08 | Erro | Falha é específica, persistente e não depende apenas de cor. |
| SRC-09 | Estado vazio | Ausência de resultados é informada e permite ajustar o termo. |
| SRC-10 | Contagem | Quantidade conhecida pode ser anunciada sem despejar toda a lista em live region. |
| SRC-11 | Incremental | Debounce/throttle evita requisições e anúncios excessivos. |
| SRC-12 | Anúncios | Leitor de tela recebe mudanças significativas sem interrupção a cada tecla. |
| SRC-13 | Disabled/readonly | Estados permanecem semanticamente distintos. |
| SRC-14 | Alvo | Controles interativos respeitam alvo mínimo da plataforma. |
| SRC-15 | Tema | Campo, ações, foco e estados permanecem perceptíveis em claro/escuro/sistema. |
| SRC-16 | Alto contraste | Foco, bordas e ações permanecem distinguíveis. |
| SRC-17 | Escala | Zoom/text scaling não corta campo, ações ou mensagens essenciais. |

## Web e Laravel/PHP
Executar com JAWS e NVDA, teclado, zoom 200%/400% e forced colors. Verificar `role="search"`, `label`, `input type="search"`, Enter/botão Buscar, erro associado, status moderado e foco estável durante atualização dos resultados.

## Python / wxPython
Executar no Windows com leitor de tela suportado. Verificar `wx.SearchCtrl`, rótulo, Enter/botão nativo, limpar, retorno de foco e ausência de anúncios excessivos no host.

## Android / Jetpack Compose
Executar com TalkBack. Verificar `OutlinedTextField`, label, IME Search, enabled/readOnly, escala de fonte/display e permanência do foco durante atualização dos resultados.

## iOS / SwiftUI
Executar com VoiceOver. Verificar `TextField`, nome, `submitLabel(.search)`, envio, Dynamic Type e preservação de contexto durante atualização.

## Flutter
Executar em Android + TalkBack e iOS + VoiceOver. Verificar `TextField`, `TextInputAction.search`, nome, enabled/readOnly, text scaling e ausência de semântica duplicada.

## Promoção de status
Uma implementação só pode passar de `experimental` para `stable` quando todos os cenários aplicáveis tiverem evidência registrada, não houver falha crítica de nome/foco/envio/feedback e validação manual com tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste.
