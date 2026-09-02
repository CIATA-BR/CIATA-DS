# TextField — iOS / SwiftUI

Implementação experimental do `CMP-0002 — TextField / Campo de texto` para iOS com SwiftUI.

## Princípios

- usa `TextField`, `SecureField` e `TextEditor` nativos;
- mantém label visual persistente;
- não usa placeholder como substituto da label;
- diferencia `disabled` de `readOnly`;
- preserva Dynamic Type e comportamentos nativos de edição;
- expõe `textContentType`, `keyboardType` e `submitLabel`;
- mantém ajuda e erro fora do valor digitado;
- não anuncia validação a cada caractere por padrão;
- não impõe máscaras automáticas no componente base.

## Somente leitura

SwiftUI não oferece um equivalente direto ao `readonly` do HTML para `TextField`. Para não representar somente leitura como indisponibilidade, `readOnly` renderiza o valor como conteúdo não editável, mantendo `disabled` reservado para controles realmente indisponíveis.

Esse comportamento deve ser validado com VoiceOver para confirmar leitura previsível do rótulo, valor e estado.

## Senha

Campos de senha usam `SecureField` por padrão. A ação `Mostrar`/`Ocultar` é um `Button` textual nativo, com nome acessível explícito.

## Erros

`errorText` tem precedência visual sobre `helpText`. O texto de erro também entra como hint acessível do campo, mas o componente não força anúncios automáticos durante digitação. O aplicativo deve anunciar erros em eventos relevantes, como saída do campo, envio do formulário ou retorno do servidor.

## Máscaras

CPF, telefone, CEP e datas não são formatados automaticamente pelo componente base. Qualquer máscara deve preservar cursor, seleção, colagem, ditado e leitura por VoiceOver.

## Validação mínima

Validar em dispositivo real:

- VoiceOver;
- Dynamic Type nos maiores tamanhos suportados;
- teclado externo quando aplicável;
- claro/escuro;
- senha e Mostrar/Ocultar;
- multiline;
- `textContentType` e AutoFill;
- `readOnly` versus `disabled`;
- erro e ajuda;
- seleção, copiar/colar e ditado.

Status: experimental.
