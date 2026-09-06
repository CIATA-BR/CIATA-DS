# Matriz de validação multiplataforma — CMP-0005 Select / Combobox

## Objetivo

Definir a evidência mínima para validar implementações experimentais do Select e orientar futuras implementações de Combobox pesquisável sem presumir equivalência entre plataformas.

## Evidência por execução

Registrar:

- plataforma, sistema e framework;
- recurso de tecnologia assistiva e versão;
- dispositivo ou navegador;
- cenário executado;
- resultado esperado e observado;
- falhas, limitações e evidências adicionais.

## Cenários comuns

| ID | Cenário | Critério de aceite |
| --- | --- | --- |
| SEL-01 | Label e papel | Rótulo e papel/controle equivalente são anunciados sem duplicação artificial. |
| SEL-02 | Valor | Valor atual é perceptível e programaticamente determinável. |
| SEL-03 | Sem seleção | Ausência de seleção é compreensível quando permitida. |
| SEL-04 | Seleção | Escolher uma opção atualiza o valor sem perda arbitrária de foco. |
| SEL-05 | Teclado | Navegação e confirmação seguem o comportamento nativo aplicável. |
| SEL-06 | Touch | Gesto simples abre e seleciona opções com target adequado. |
| SEL-07 | Disabled | Controle indisponível é perceptível e programaticamente determinável quando suportado. |
| SEL-08 | Opção disabled | Opções indisponíveis não podem ser selecionadas e continuam compreensíveis. |
| SEL-09 | Obrigatório | Obrigatoriedade é comunicada sem depender apenas de símbolo, cor ou posição. |
| SEL-10 | Ajuda | Ajuda é compreendida no contexto do controle. |
| SEL-11 | Erro | Erro explica a correção e está associado ao controle. |
| SEL-12 | Foco | Indicador de foco permanece visível. |
| SEL-13 | Tema | Controle permanece utilizável em claro, escuro e sistema. |
| SEL-14 | Alto contraste | Controle, foco e valor permanecem distinguíveis em forced colors ou equivalente. |
| SEL-15 | Escala | Texto ampliado não corta label, valor, opções, ajuda ou erro. |
| CMB-01 | Estado expandido | Combobox pesquisável expõe aberto/fechado programaticamente. |
| CMB-02 | Opção ativa | Opção ativa é comunicada sem mover foco arbitrariamente. |
| CMB-03 | Filtragem | Digitação filtra resultados sem anúncios excessivos. |
| CMB-04 | Resultado vazio | Ausência de resultados é informada de forma perceptível. |
| CMB-05 | Escape | Fechar a lista preserva valor confirmado conforme o contrato. |
| CMB-06 | Loading remoto | Loading é distinguível de lista vazia e erro. |

## Web e Laravel/PHP

Executar ao menos com JAWS e NVDA em navegadores suportados, somente teclado, zoom de 200%/400% quando aplicável e forced colors.

Para o Select atual verificar especificamente:

- `<select>` nativo e `label` associado;
- required, disabled, opções disabled;
- persistência de valor após erro de validação;
- ajuda e erro por relações programáticas;
- foco visível e comportamento nativo de teclado.

Combobox pesquisável customizado só deve ser adicionado quando houver necessidade concreta e então deve cumprir também os cenários `CMB-*`.

## Python / wxPython

Executar no Windows com leitor de tela suportado e verificar `wx.Choice`, valor atual, abertura, navegação por teclado, disabled, ajuda, erro e callback de status sem movimentação arbitrária de foco.

## Android / Jetpack Compose

Executar com TalkBack. Verificar `ExposedDropdownMenuBox`, anúncio de label e valor, estado de expansão percebido adequadamente, seleção, disabled por controle/opção, erro semântico, escala de fonte/display e target nativo.

## iOS / SwiftUI

Executar com VoiceOver. Verificar `Picker` nativo, anúncio de label e valor, seleção, disabled por controle/opção, ajuda/erro, Dynamic Type, target mínimo de 44 × 44 pt e temas claro/escuro.

## Flutter

Executar em Android + TalkBack e iOS + VoiceOver. Verificar `DropdownButtonFormField`, label, valor, seleção, disabled, opções disabled, ajuda/erro, text scaling, temas e ordem de foco.

## Promoção de status

Uma implementação só pode passar de `experimental` para `stable` quando:

1. todos os cenários aplicáveis tiverem evidência registrada;
2. não houver falha crítica aberta de nome, papel, valor, foco, acionamento ou compreensão;
3. divergências da especificação estiverem corrigidas ou justificadas;
4. validação manual com recurso de tecnologia assistiva relevante tiver ocorrido de fato.

A existência desta matriz não constitui evidência de teste. As implementações atuais cobrem prioritariamente Select nativo/equivalente; um Combobox pesquisável customizado exige ciclo de implementação e validação próprio quando for necessário.
