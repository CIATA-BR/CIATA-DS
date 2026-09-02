# Button — Flutter

Implementação experimental do `CMP-0001 — Button / Botão` para Flutter.

## Princípios

- usa controles nativos do Material (`ElevatedButton`, `OutlinedButton` e `TextButton`);
- preserva integração com Semantics, leitor de tela, teclado e foco da plataforma;
- não substitui os controles por `GestureDetector`, `InkWell` ou container customizado;
- mantém `loading` separado de `disabled`;
- preserva o rótulo original durante loading;
- bloqueia acionamentos repetidos durante loading sem representar processamento como indisponibilidade;
- adota alvo mínimo lógico de 44 × 44;
- respeita escalabilidade de texto do Flutter;
- usa `ThemeData.colorScheme.error/onError` para a variante destrutiva;
- mantém botões somente com ícone fora desta primeira API.

## Variantes

- `CiataButtonVariant.primary` → `ElevatedButton`;
- `CiataButtonVariant.secondary` → `OutlinedButton`;
- `CiataButtonVariant.danger` → `ElevatedButton` com cores semânticas de erro do tema;
- `CiataButtonVariant.ghost` → `TextButton`.

## Loading

Durante `loading=true`, o componente:

- mantém o botão semanticamente habilitado;
- ignora novos acionamentos;
- mantém o texto da ação;
- apresenta `CircularProgressIndicator` excluído da árvore semântica;
- expõe o estado pelo valor de `Semantics`.

`loading` não deve ser implementado simplesmente como `onPressed: null`, pois isso comunica indisponibilidade em vez de processamento.

## Disabled

`disabled=true` usa o comportamento nativo da plataforma por meio de `onPressed: null`.

## Semântica

A camada externa de `Semantics` comunica:

- papel de botão;
- nome acessível igual ao rótulo visível;
- estado habilitado/desabilitado;
- estado de processamento quando aplicável.

A semântica interna é excluída para evitar anúncios duplicados.

## Tokens

Esta versão experimental usa `ThemeData` e `ColorScheme` como ponte provisória. A aparência deverá consumir os tokens CIATA quando a exportação Flutter dos novos tokens estiver publicada, sem alterar a API pública do componente.

## Validação mínima antes de estabilidade

- TalkBack no Android;
- VoiceOver no iOS;
- teclado e foco quando aplicável;
- aumento de texto/text scaling;
- temas claro e escuro;
- disabled;
- loading;
- prevenção de acionamento duplicado;
- contraste e estados visuais;
- target size.

## Status

Experimental. Não deve ser promovido para estável antes das evidências manuais exigidas pelo contrato canônico.
