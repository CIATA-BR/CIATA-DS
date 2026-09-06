# Matriz de validação multiplataforma — CMP-0006 Link

## Objetivo

Definir a evidência mínima necessária para validar cada implementação experimental do Link sem presumir equivalência entre plataformas nem promover para estável sem teste manual real.

## Evidência por execução

Registrar plataforma, versão, recurso de tecnologia assistiva, navegador/dispositivo, cenário executado, resultado esperado/observado, falhas e limitações.

## Cenários comuns

| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| LNK-01 | Nome e papel | O texto identifica o destino e o papel de link é anunciado sem duplicação artificial. |
| LNK-02 | Destino | Ativação navega para o destino correto. |
| LNK-03 | Teclado | Foco e ativação seguem o comportamento nativo aplicável. |
| LNK-04 | Foco visível | O link focado é perceptível sem depender apenas de cor. |
| LNK-05 | Identificação | Link em conteúdo é reconhecível como interativo sem depender só de cor. |
| LNK-06 | Novo contexto | Abertura em novo contexto é comunicada quando puder surpreender. |
| LNK-07 | Externo | Destino externo mantém contexto suficiente para decisão. |
| LNK-08 | Download | Tipo/tamanho são informados quando relevantes. |
| LNK-09 | Visited | Estado visited, quando suportado, não prejudica contraste nem expõe informação sensível. |
| LNK-10 | Touch | Ativação por gesto simples possui target adequado quando aplicável. |
| LNK-11 | Tema | Link permanece perceptível em claro, escuro e sistema. |
| LNK-12 | Alto contraste | Link e foco permanecem distinguíveis em forced colors ou equivalente. |
| LNK-13 | Escala | Texto ampliado/reflow não corta ou sobrepõe o link. |
| LNK-14 | Link versus ação | Navegação usa Link; ações permanecem em controles de botão apropriados. |

## Web e Laravel/PHP

Executar ao menos com JAWS e NVDA em navegadores suportados, somente teclado, zoom de 200%/400% quando aplicável e forced colors.

Verificar especificamente:

- `<a href>` nativo;
- nome útil fora do contexto;
- foco visível;
- Enter para ativação;
- indicação textual de novo contexto/download quando aplicável;
- `target="_blank"` acompanhado de `rel="noopener noreferrer"`;
- ausência de links falsos baseados em `div`/JavaScript.

## Python / wxPython

Executar no Windows com leitor de tela suportado e verificar `wx.adv.HyperlinkCtrl`, anúncio de nome/papel, navegação, foco, ativação e aviso de novo contexto.

## Android / Jetpack Compose

Executar com TalkBack. Verificar `LinkAnnotation.Url`, anúncio de link e nome, ativação, foco, sublinhado/identificação e comportamento com escala de fonte/display.

## iOS / SwiftUI

Executar com VoiceOver. Verificar `Link` nativo, nome, papel, destino, gesto padrão, Dynamic Type, tema e target mínimo de 44 × 44 pt quando o link for apresentado como controle isolado.

## Flutter

Executar em Android + TalkBack e iOS + VoiceOver. Verificar `Semantics(link: true)`, nome, ativação, foco, sublinhado, text scaling e target adequado. Confirmar que o callback consumidor realiza navegação real e não transforma o componente em ação genérica.

## Promoção de status

Uma implementação só pode passar de `experimental` para `stable` quando:

1. todos os cenários aplicáveis tiverem evidência registrada;
2. não houver falha crítica aberta de nome, papel, destino, foco, acionamento ou compreensão;
3. divergências da especificação estiverem corrigidas ou justificadas;
4. validação manual com recurso de tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste e não promove automaticamente nenhuma plataforma para estável.
