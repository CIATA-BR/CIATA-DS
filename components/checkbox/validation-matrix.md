# Matriz de validação multiplataforma — CMP-0003 Checkbox

## Objetivo

Definir a evidência mínima necessária para validar cada implementação experimental do Checkbox sem presumir equivalência entre plataformas nem promover componentes para estável sem teste manual real.

## Evidência por execução

Registrar:

- plataforma, versão do sistema e framework;
- recurso de tecnologia assistiva e versão;
- dispositivo ou navegador relevante;
- cenário executado;
- resultado esperado e observado;
- falhas, limitações e evidências adicionais.

## Cenários comuns

| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| CHK-01 | Nome e papel | Leitor de tela anuncia rótulo e papel/controle equivalente sem duplicar palavras de papel no nome. |
| CHK-02 | Desmarcado | Estado inicial desmarcado é programaticamente identificável. |
| CHK-03 | Marcado | Acionamento altera para marcado e o recurso de tecnologia assistiva percebe a mudança. |
| CHK-04 | Alternância | Novo acionamento retorna ao estado desmarcado sem perda arbitrária de foco. |
| CHK-05 | Teclado | Em Web/desktop, foco e ativação seguem o comportamento nativo, incluindo Espaço quando aplicável. |
| CHK-06 | Touch | Em mobile, gesto simples ativa o controle e a área interativa é adequada. |
| CHK-07 | Rótulo | Rótulo visível pertence ao controle e, quando a plataforma permite, sua área participa do acionamento. |
| CHK-08 | Disabled | Estado indisponível é perceptível e programaticamente determinável quando suportado. |
| CHK-09 | Obrigatório | Obrigatoriedade é comunicada sem depender apenas de símbolo, cor ou posição. |
| CHK-10 | Ajuda | Texto de ajuda pode ser compreendido no contexto do controle. |
| CHK-11 | Erro | Erro é perceptível, associado ao controle/grupo e não depende apenas de cor. |
| CHK-12 | Mixed | Quando suportado, estado misto representa seleção parcial real e é anunciado adequadamente. |
| CHK-13 | Grupo | Conjunto relacionado possui contexto de grupo sem substituir os rótulos individuais. |
| CHK-14 | Foco | Indicador de foco permanece visível e não é removido por estética. |
| CHK-15 | Tema | Estados continuam distinguíveis em claro, escuro e sistema quando suportados. |
| CHK-16 | Alto contraste | Controle, foco e estados permanecem utilizáveis em forced colors ou equivalente. |
| CHK-17 | Escala | Texto ampliado/reflow não corta rótulo, ajuda ou erro nem sobrepõe controles. |
| CHK-18 | Consentimento | Opções sensíveis permanecem explicitamente compreensíveis e não dependem de pré-seleção. |

## Web

Executar ao menos com:

- Windows + JAWS + navegador suportado;
- Windows + NVDA + navegador suportado;
- somente teclado;
- zoom de 200% e, quando aplicável, 400%;
- modo de alto contraste/forced colors.

Verificar especificamente o `input[type="checkbox"]` nativo, associação por `label`, `required`, `disabled`, erro, foco e uso do rótulo como área de ativação.

## Laravel/PHP

Além da matriz Web:

- validar renderização do componente Blade com valores vindos do servidor;
- confirmar persistência de checked após erro de validação quando essa for a regra do formulário;
- confirmar IDs únicos de ajuda/erro;
- confirmar que atributos adicionais não quebram semântica nativa.

## Python / wxPython

Executar ao menos no Windows com leitor de tela suportado.

Verificar:

- exposição do `wx.CheckBox` como controle nativo;
- estados checked/unchecked;
- three-state quando habilitado;
- disabled;
- navegação por Tab e ativação nativa;
- comportamento de ajuda/erro;
- callback de status sem anúncios repetitivos ou movimentação de foco.

## Android / Jetpack Compose

Executar com TalkBack em versão suportada do Android.

Verificar:

- anúncio de rótulo, papel e estado;
- acionamento da linha associada e do próprio checkbox como uma única intenção;
- checked/unchecked;
- disabled;
- erro exposto pela semântica do Compose;
- escala de fonte e display;
- target nativo de interação;
- navegação por foco sequencial.

## iOS / SwiftUI

Executar com VoiceOver em versão suportada do iOS.

Verificar:

- `Toggle` como equivalente nativo da seleção booleana;
- anúncio de nome e estado sem duplicação artificial de papel;
- acionamento por gesto padrão do VoiceOver;
- disabled;
- ajuda/erro acessíveis;
- Dynamic Type;
- target mínimo de 44 x 44 pt;
- tema claro/escuro.

## Flutter

Executar ao menos em Android + TalkBack e iOS + VoiceOver.

Verificar:

- semântica do `CheckboxListTile`;
- checked/unchecked e tristate quando habilitado;
- disabled;
- área de acionamento incluindo o rótulo;
- ajuda e erro;
- text scaling;
- tema claro/escuro;
- ordem de foco.

## Promoção de status

Uma implementação só pode passar de `experimental` para `stable` quando:

1. todos os cenários aplicáveis desta matriz tiverem evidência registrada;
2. não houver falha crítica aberta de nome, papel, estado, foco, acionamento ou compreensão;
3. comportamento divergente da especificação canônica estiver corrigido ou explicitamente justificado;
4. a validação manual com recurso de tecnologia assistiva relevante tiver ocorrido de fato.

A conclusão desta documentação não constitui evidência de teste e não promove automaticamente nenhuma plataforma para estável.
