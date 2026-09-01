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

## Exemplos práticos

### Conforme

Controle de preferência com estado exposto semanticamente:

```html
<button type="button" role="switch" aria-checked="false">
  Receber notificações por e-mail
</button>
```

**Comportamento esperado:** anúncio equivalente a `Receber notificações por e-mail, switch, desligado`. Ao ativar, o estado muda para `ligado` sem mover o foco para outro elemento.

Em Android e iOS, o mesmo comportamento deve ser obtido preferencialmente com o componente nativo de switch da plataforma.

### Não conforme

```html
<div class="switch desligado">Receber notificações por e-mail</div>
```

**Por que falha:** aparência visual de switch não cria função nem estado acessível. A tecnologia assistiva pode anunciar apenas texto estático e a pessoa não consegue saber se a configuração está ligada ou desligada, nem como alterá-la.

Outro erro recorrente é usar no nome `Receber notificações desligado` e também expor estado `desligado`.

**Por que falha:** o anúncio tende a duplicar informação e o nome muda junto com o estado, tornando a identificação do controle menos estável.

## Critérios de teste

- nome, função e estado são anunciados corretamente;
- ativação altera o estado exatamente uma vez;
- foco permanece no controle após mudança;
- estado é perceptível sem cor;
- efeito imediato corresponde ao rótulo;
- teclado ou gesto equivalente funciona conforme a plataforma.
