# Matriz de validação multiplataforma — CMP-0004 Radio

## Objetivo

Definir a evidência mínima necessária para validar cada implementação experimental do Radio sem presumir equivalência entre plataformas nem promover componentes para estável sem teste manual real.

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
| RAD-01 | Grupo | O nome do grupo é perceptível e programaticamente determinável quando a plataforma oferecer essa semântica. |
| RAD-02 | Nome e papel | Cada opção anuncia rótulo e papel/controle equivalente sem duplicar palavras de papel no nome. |
| RAD-03 | Não selecionado | Estado não selecionado é programaticamente identificável. |
| RAD-04 | Selecionado | Ao escolher uma opção, o estado selecionado é percebido pelo recurso de tecnologia assistiva. |
| RAD-05 | Exclusividade | Selecionar uma opção remove a seleção anterior no mesmo grupo. |
| RAD-06 | Foco | A seleção não causa perda arbitrária de foco. |
| RAD-07 | Teclado | Em Web/desktop, Tab, setas e Espaço seguem o comportamento nativo aplicável. |
| RAD-08 | Touch | Em mobile, gesto simples seleciona a opção e a área de interação é adequada. |
| RAD-09 | Rótulo | O rótulo visível está associado à opção e participa do acionamento quando a plataforma permite. |
| RAD-10 | Disabled | Opção indisponível é perceptível e programaticamente determinável quando suportado. |
| RAD-11 | Obrigatório | Obrigatoriedade do grupo é compreensível sem depender apenas de símbolo, cor ou posição. |
| RAD-12 | Ajuda | Ajuda é compreendida no contexto do grupo/opção correspondente. |
| RAD-13 | Erro | Erro pertence ao grupo, explica a correção e não é repetido de forma confusa em cada opção. |
| RAD-14 | Estado inicial | Ausência de seleção inicial é preservada quando a decisão precisa ser explícita. |
| RAD-15 | Tema | Estados permanecem distinguíveis em claro, escuro e sistema quando suportados. |
| RAD-16 | Alto contraste | Controle, foco e seleção permanecem utilizáveis em forced colors ou equivalente. |
| RAD-17 | Escala | Texto ampliado/reflow não corta legenda, opções, ajuda ou erro. |
| RAD-18 | Conteúdo | As opções permanecem mutuamente exclusivas e semanticamente não sobrepostas. |

## Web

Executar ao menos com:

- Windows + JAWS + navegador suportado;
- Windows + NVDA + navegador suportado;
- somente teclado;
- zoom de 200% e, quando aplicável, 400%;
- modo de alto contraste/forced colors.

Verificar especificamente:

- `fieldset` e `legend`;
- `input[type="radio"]` nativo;
- mesmo `name` para o grupo;
- associação por `label`;
- seleção exclusiva por setas/teclado;
- required, disabled, ajuda, erro e foco visível.

## Laravel/PHP

Além da matriz Web:

- validar renderização do componente Blade com opções vindas do servidor;
- confirmar persistência da seleção após erro de validação quando essa for a regra do formulário;
- confirmar IDs únicos por grupo e opção;
- confirmar que valores e rótulos não quebram a semântica nativa;
- confirmar que erro e ajuda pertencem ao grupo e não são duplicados por opção.

## Python / wxPython

Executar ao menos no Windows com leitor de tela suportado.

Verificar:

- exposição de `wx.RadioButton` como controle nativo;
- exclusividade via grupo nativo;
- navegação por Tab/setas conforme comportamento da plataforma;
- seleção inicial e ausência de seleção quando aplicável;
- disabled;
- ajuda e erro;
- callback de status sem anúncios repetitivos ou movimentação arbitrária de foco.

## Android / Jetpack Compose

Executar com TalkBack em versão suportada do Android.

Verificar:

- `selectableGroup` como grupo semântico;
- `Role.RadioButton` e estado selecionado;
- acionamento da linha e do indicador como uma única intenção;
- exclusividade da seleção;
- disabled por grupo/opção;
- erro exposto pela semântica do Compose;
- escala de fonte/display;
- target nativo de interação;
- navegação sequencial do TalkBack.

## iOS / SwiftUI

Executar com VoiceOver em versão suportada do iOS.

Verificar:

- `Picker` inline como equivalente nativo de escolha mutuamente exclusiva;
- anúncio de legenda, opções e seleção sem duplicação artificial de papel;
- acionamento pelo gesto padrão do VoiceOver;
- exclusividade da escolha;
- disabled por grupo/opção quando suportado;
- ajuda e erro acessíveis;
- Dynamic Type;
- target mínimo de 44 × 44 pt;
- tema claro/escuro.

## Flutter

Executar ao menos em Android + TalkBack e iOS + VoiceOver.

Verificar:

- semântica do `RadioGroup` e `RadioListTile`;
- seleção exclusiva;
- disabled por grupo/opção;
- área de acionamento incluindo o rótulo;
- ajuda e erro;
- text scaling;
- tema claro/escuro;
- ordem de foco.

## Promoção de status

Uma implementação só pode passar de `experimental` para `stable` quando:

1. todos os cenários aplicáveis desta matriz tiverem evidência registrada;
2. não houver falha crítica aberta de nome, papel, grupo, estado, foco, acionamento ou compreensão;
3. comportamento divergente da especificação canônica estiver corrigido ou explicitamente justificado;
4. a validação manual com recurso de tecnologia assistiva relevante tiver ocorrido de fato.

A conclusão desta documentação não constitui evidência de teste e não promove automaticamente nenhuma plataforma para estável.
