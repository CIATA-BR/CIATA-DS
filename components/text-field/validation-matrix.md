# Matriz de validação — CMP-0002 TextField / Campo de texto

Status: Draft

Esta matriz define a evidência mínima necessária para promover cada implementação do `CMP-0002 — TextField / Campo de texto` de `experimental` para `stable`.

A promoção é por plataforma. Uma implementação pode se tornar estável sem que as demais já tenham concluído a mesma etapa, desde que o contrato canônico continue equivalente.

## Evidência mínima por execução

Registrar, no mínimo:

- plataforma e versão;
- framework/runtime e versão relevante;
- recurso de tecnologia assistiva e versão, quando aplicável;
- navegador e versão, no Web;
- cenário executado;
- resultado esperado;
- resultado observado;
- aprovado/reprovado;
- limitações conhecidas;
- link para issue, vídeo, log ou evidência adicional quando existir.

## Critérios comuns obrigatórios

### Nome, papel e finalidade

- label visual permanece presente e identificável;
- placeholder nunca é a única fonte do nome do campo;
- leitor de tela anuncia o campo com nome coerente e papel de edição adequado;
- tipo/finalidade do campo não depende apenas de instrução visual;
- campos obrigatórios são perceptíveis visual e programaticamente sem redundância confusa.

### Ajuda e erro

- ajuda é perceptível e associada ao campo;
- erro atual é perceptível visualmente e por recurso de tecnologia assistiva;
- o estado de erro não depende apenas de cor;
- atualização de erro não move foco arbitrariamente;
- validação durante digitação não produz sequência invasiva de anúncios a cada caractere;
- após envio inválido, o usuário consegue localizar o resumo/primeiro erro e corrigir o campo de forma previsível;
- ao corrigir o valor, o estado inválido deixa de ser exposto.

### Estados

- `required`, `readOnly` e `disabled` não são tratados como sinônimos;
- somente leitura continua disponível para consulta e cópia quando a plataforma permitir;
- indisponibilidade é exposta pela semântica nativa da plataforma;
- foco não é perdido ao alternar estados de forma legítima;
- valor preenchido permanece preservado quando o estado visual muda.

### Edição

- digitação, seleção, copiar, recortar e colar funcionam conforme a plataforma;
- desfazer/refazer funciona quando suportado nativamente;
- ditado não é bloqueado sem necessidade;
- teclados físicos e virtuais mantêm comportamento esperado;
- cursor/caret não salta de forma inesperada;
- o campo aceita caracteres internacionais e acentos esperados;
- IME/composição não é interrompido por transformações desnecessárias.

### Teclado, finalidade e preenchimento automático

- tipo de teclado é coerente com a finalidade quando aplicável;
- ação do teclado/IME é coerente com o fluxo;
- autocomplete/autofill usa finalidade apropriada quando disponível;
- gerenciadores de senha permanecem funcionais em campos de credencial;
- colagem não é bloqueada em senha, OTP ou outros campos sem justificativa documentada.

### Senha

- valor é ocultado por padrão quando o campo é de senha;
- Mostrar/Ocultar possui nome acessível contextual;
- alternar visibilidade não apaga valor nem move foco arbitrariamente;
- nome do campo não é substituído pelo estado Mostrar/Ocultar;
- gerenciadores de senha e AutoFill continuam utilizáveis;
- estado de senha visível não é confundido com campo indisponível.

### Multiline e comprimento

- campo multilinha permite navegação por conteúdo conforme comportamento nativo;
- quebra de linha e edição não ficam presas a gestos de ponteiro;
- limite de caracteres, quando usado, não remove silenciosamente conteúdo válido sem feedback adequado;
- contador, quando existir, não gera anúncio a cada tecla sem necessidade;
- crescimento/reflow do componente não encobre conteúdo ou controles essenciais.

### Escala, contraste e temas

- texto respeita zoom, text scaling, Dynamic Type/font scaling conforme plataforma;
- não ocorre corte de label, erro, ajuda ou valor em escalas suportadas;
- foco permanece claramente visível;
- texto, borda/estado e indicação de erro atendem aos critérios de contraste aplicáveis;
- temas claro/escuro mantêm semântica e legibilidade;
- modo de alto contraste/forced colors é validado quando a plataforma oferecer esse mecanismo.

### Máscaras

Máscaras de CPF, telefone, CEP, data e formatos semelhantes não fazem parte do widget base nesta etapa. Caso um produto consumidor aplique máscara, validar adicionalmente:

- cursor não salta inesperadamente;
- seleção e substituição parcial funcionam;
- Backspace/Delete funcionam em torno dos separadores;
- colagem de valor puro e já formatado produz resultado previsível;
- leitor de tela não repete separadores de forma destrutiva;
- ditado e teclado externo não são quebrados;
- valor submetido e valor apresentado têm regras documentadas;
- erro de formatação não é anunciado durante cada caractere.

## Web e Laravel

Validar ao menos com:

- Chrome + JAWS no Windows;
- Chrome ou Edge + NVDA no Windows;
- Firefox + NVDA no Windows;
- teclado sem leitor de tela;
- zoom de 200% e 400% quando aplicável ao fluxo;
- forced colors/alto contraste do Windows.

Cenários específicos:

- `<label>` associado ao `input`/`textarea`;
- `aria-describedby` para ajuda e erro;
- `aria-invalid` somente quando o erro está ativo;
- `aria-errormessage`, quando usado, como complemento e não única associação crítica;
- navegação Tab/Shift+Tab previsível;
- formulário inválido não causa loop de foco;
- autofill e autocomplete;
- inputmode em mobile web quando aplicável;
- Mostrar/Ocultar senha operável por teclado e leitor de tela;
- reflow sem sobreposição.

## Python / wxPython

Validar ao menos com:

- Windows + JAWS;
- Windows + NVDA;
- teclado sem leitor de tela;
- escalabilidade/DPI do Windows;
- alto contraste do Windows.

Cenários específicos:

- `wx.TextCtrl` mantém papel e edição nativos;
- label é anunciado de forma coerente no contexto do aplicativo;
- `readonly` permite consulta sem ser exposto como indisponível;
- `disabled` segue semântica nativa;
- callback `on_status` é integrado a um mecanismo realmente perceptível no consumidor;
- senha, multilinha, seleção e colagem;
- retorno de foco após validação ou diálogos do fluxo;
- integração de referência no CIATA-Game deve registrar versão de wxPython, Windows e leitor de tela usados.

## Android / Jetpack Compose

Validar ao menos com:

- Android em dispositivo real + TalkBack;
- navegação por toque e swipe;
- teclado virtual;
- teclado físico quando disponível;
- font scaling elevado;
- temas claro/escuro.

Cenários específicos:

- `OutlinedTextField` mantém semântica nativa;
- label e supporting text são anunciados de forma útil;
- `isError` e mensagem de erro não geram anúncio excessivo;
- `readOnly` permanece distinto de `enabled=false`;
- `KeyboardOptions` gera teclado/IME apropriado;
- ação Mostrar/Ocultar é alcançável e contextual;
- alternar senha não perde posição no fluxo;
- multiline funciona com TalkBack sem prender navegação;
- autofill/credenciais quando configurados no produto consumidor.

## iOS / SwiftUI

Validar ao menos com:

- iPhone real + VoiceOver;
- gestos de exploração e swipe;
- Dynamic Type nas faixas suportadas, incluindo tamanhos de acessibilidade;
- teclado virtual;
- teclado externo quando disponível;
- temas claro/escuro.

Cenários específicos:

- `TextField`, `SecureField` e `TextEditor` preservam comportamento nativo;
- label permanece disponível ao VoiceOver;
- `textContentType` e AutoFill funcionam conforme finalidade;
- estado somente leitura, implementado como conteúdo não editável, continua consultável e distinguível de indisponível;
- erro e ajuda são compreensíveis sem anúncios repetitivos;
- Mostrar/Ocultar senha não apaga conteúdo nem desorganiza foco;
- Dynamic Type não corta label, valor, erro ou ação auxiliar;
- multiline funciona com rotor/navegação de texto esperada.

## Flutter

Validar ao menos com:

- Android real + TalkBack;
- iOS real + VoiceOver;
- text scaling elevado;
- teclado virtual;
- teclado físico quando aplicável;
- temas claro/escuro.

Cenários específicos:

- `TextFormField` preserva semântica nativa do framework/plataforma;
- `labelText`, `helperText` e `errorText` formam anúncio compreensível;
- `readOnly` permanece distinto de `enabled=false`;
- `autofillHints`, `keyboardType` e `textInputAction` funcionam conforme configuração;
- Mostrar/Ocultar senha é alcançável e mantém valor/foco;
- multiline e text scaling não causam corte ou sobreposição;
- validação do `Form` não gera anúncios repetidos durante digitação.

## Critérios para promoção a stable

Uma implementação pode ser promovida para `stable` quando:

1. todos os cenários comuns aplicáveis forem aprovados;
2. todos os cenários específicos da plataforma forem aprovados;
3. houver evidência manual com os recursos de tecnologia assistiva obrigatórios da plataforma;
4. não houver defeito aberto de severidade alta no componente;
5. defeitos médios ou baixos remanescentes estiverem documentados com impacto e plano de correção;
6. contraste e escalabilidade tiverem evidência verificável;
7. estados de erro, senha, readonly, disabled e multiline tiverem sido exercitados;
8. o README da plataforma registrar a evidência ou apontar para seu local canônico;
9. limitações conhecidas estiverem documentadas sem transformar comportamento não testado em promessa de suporte.

Automação pode complementar regressão estrutural e semântica, mas não substitui testes manuais com recursos de tecnologia assistiva.
