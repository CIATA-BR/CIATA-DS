# Switch

## Contrato

Switch representa um estado binário ligado/desligado que normalmente produz efeito imediato. Não deve ser usado quando a mudança depende de confirmação posterior por botão `Salvar` ou `Aplicar`.

## Regras

- expor nome, função e estado ligado/desligado;
- o rótulo deve descrever a configuração controlada, não repetir o estado;
- mudança de estado deve ser perceptível visualmente e por tecnologia assistiva;
- não depender apenas de cor ou posição do indicador;
- preservar convenções nativas de ativação;
- se a mudança tiver efeito destrutivo ou de alto risco, considerar confirmação separada em vez de switch simples;
- evitar usar switch para escolhas com mais de dois estados.

## Web

Preferir controle nativo quando disponível no design adotado; em implementação customizada, utilizar semântica e estado apropriados, garantindo operação por teclado e foco visível.

## Android

Preferir Switch/SwitchCompat ou equivalente do toolkit. Garantir que label e estado sejam expostos pelo sistema de semântica, sem concatenar manualmente `ligado`/`desligado` quando o leitor de tela já anuncia o estado.

## iOS

Preferir UISwitch ou equivalente nativo. O VoiceOver deve anunciar o nome da configuração, a função do controle e seu estado sem duplicação desnecessária.

## Critérios de teste

- nome, função e estado são anunciados corretamente;
- ativação altera o estado exatamente uma vez;
- foco permanece no controle após mudança;
- estado é perceptível sem cor;
- efeito imediato corresponde ao rótulo;
- teclado ou gesto equivalente funciona conforme a plataforma.
