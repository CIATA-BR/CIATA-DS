# CMP-0002 — TextField / Campo de texto

## Status

Rascunho.

## Propósito

Permitir entrada, edição e revisão de texto pela pessoa usuária.

Use TextField para valores textuais ou textuais estruturados que possam ser digitados, colados, ditados, preenchidos por gerenciadores de senha ou fornecidos por recursos de preenchimento automático.

Não use TextField para escolhas fechadas quando Radio, Checkbox, Select/Combobox ou outro controle especializado representar melhor a intenção.

## Princípio de implementação

A implementação deve preferir o controle de entrada nativo da plataforma e preservar nome, papel, valor, estado, foco, seleção de texto e edição expostos às APIs de acessibilidade.

Não substituir campos nativos por `div`, canvas, painel clicável ou controles desenhados do zero quando a plataforma já oferecer um campo de texto adequado.

## Variações funcionais iniciais

- `text` — texto livre;
- `email` — endereço de e-mail;
- `tel` — telefone;
- `url` — endereço web;
- `password` — senha;
- `search` — busca;
- `numericText` — conteúdo textual restrito a caracteres numéricos quando número matemático não for a intenção;
- `multiline` — texto com múltiplas linhas.

A escolha da variação deve refletir a finalidade real do dado, influenciar teclado/autofill quando a plataforma suportar e não alterar a semântica para algo incorreto.

## Propriedades conceituais

- `label` — rótulo visível e persistente do campo;
- `value` — valor atual;
- `type` — finalidade/tipo funcional do campo;
- `placeholder` — exemplo ou pista opcional, nunca substituto do label;
- `helpText` — instrução ou descrição complementar;
- `errorText` — mensagem de erro associada ao campo;
- `required` — indica obrigatoriedade;
- `disabled` — impede interação porque o campo não está disponível;
- `readOnly` — permite leitura/seleção quando adequado, mas não edição;
- `autocomplete` — finalidade semântica para preenchimento automático quando disponível;
- `inputMode` — sugestão de teclado/entrada quando disponível;
- `maxLength` — limite máximo quando existir requisito real;
- `onChange` — notificação de alteração de valor;
- `onBlur` — evento de saída de foco quando necessário;
- `onSubmit` — ação de envio/conclusão quando aplicável.

Os nomes concretos podem variar por linguagem e framework.

## Label

Todo campo deve possuir nome acessível claro e, salvo exceções justificadas por padrão nativo equivalente, um rótulo visual persistente.

O label deve continuar disponível quando:

- o campo recebe foco;
- há valor preenchido;
- ocorre erro;
- o placeholder desaparece;
- a interface está ampliada;
- a pessoa usa leitor de tela ou reconhecimento de voz.

Não usar placeholder como único rótulo.

Exemplos adequados:

- `E-mail`;
- `CPF`;
- `Telefone`;
- `Senha`;
- `Buscar obras`;
- `Descrição da experiência profissional`.

## Placeholder

Placeholder serve apenas como exemplo breve ou dica de formato.

Exemplos:

- label `Data de nascimento`, placeholder `DD/MM/AAAA`;
- label `E-mail`, placeholder `nome@exemplo.org.br`.

O placeholder:

- não substitui o label;
- não deve conter instrução essencial;
- deve possuir contraste suficiente quando apresentado visualmente;
- deve desaparecer sem causar perda de contexto;
- não deve ser usado como mecanismo de validação.

## Help text e descrição

Instruções complementares devem ser associadas programaticamente ao campo quando a plataforma suportar.

Exemplos:

- `A senha deve ter pelo menos 12 caracteres.`;
- `Informe apenas números.`;
- `Você poderá alterar este dado depois.`.

Evitar repetir no help text exatamente o mesmo conteúdo do label.

## Required e opcional

A obrigatoriedade deve ser perceptível visualmente e programaticamente.

Não depender apenas de asterisco, cor ou posição.

Quando a maioria dos campos for obrigatória, pode ser mais claro identificar explicitamente os poucos campos opcionais, desde que a regra geral esteja informada no início do formulário.

A indicação `obrigatório` ou `opcional` não deve ser inserida de forma que cause anúncios duplicados desnecessários se a plataforma já comunica o estado.

## Erros e validação

O campo com erro deve:

- ter o erro associado programaticamente quando possível;
- expor estado inválido pela API nativa adequada;
- apresentar mensagem textual clara;
- não depender apenas de cor, ícone ou borda;
- manter o valor digitado, salvo quando houver justificativa funcional;
- permitir correção sem perda arbitrária de foco;
- informar como corrigir quando isso não for evidente.

Exemplos adequados:

- `CPF inválido. Confira os 11 dígitos.`;
- `Informe um e-mail válido, como nome@exemplo.com.`;
- `A senha deve conter pelo menos 12 caracteres.`.

Evitar mensagens genéricas como `Campo inválido` quando for possível explicar o problema.

### Momento da validação

Não anunciar erro a cada caractere digitado quando o valor ainda está naturalmente incompleto.

Preferir validação em momento previsível, por exemplo:

- ao sair do campo;
- ao tentar avançar/enviar;
- após completar um formato conhecido;
- em tempo real apenas quando o feedback trouxer benefício claro e não gerar interrupção excessiva.

## Resumo de erros

Em formulários extensos, ao falhar o envio, deve ser considerado um resumo de erros no início da região relevante, com foco gerenciado de forma previsível e links/ações para os campos quando a plataforma permitir.

Mover o foco diretamente para o primeiro campo inválido pode ser adequado em fluxos simples, mas não deve ocorrer de maneira inesperada enquanto a pessoa ainda está digitando.

## Máscaras

Máscaras de CPF, telefone, CEP, datas e similares devem melhorar a compreensão sem prejudicar edição, colagem, ditado, seleção de texto ou leitura por recurso de tecnologia assistiva.

Regras:

- aceitar, quando seguro, entrada com e sem pontuação;
- não exigir que a pessoa digite caracteres de formatação que podem ser inseridos automaticamente;
- não mover o cursor de forma imprevisível;
- não apagar conteúdo válido durante edição parcial;
- não anunciar toda a máscara repetidamente a cada tecla;
- permitir colar valores;
- armazenar ou normalizar o dado separadamente quando necessário sem alterar arbitrariamente o valor percebido pela pessoa.

A máscara visual não substitui a informação de formato em label/help text quando essa instrução for necessária.

## Input purpose, teclado e autocomplete

Quando a plataforma suportar, declarar a finalidade do dado e o tipo de teclado adequado.

Exemplos:

- e-mail → teclado de e-mail e autocomplete de e-mail;
- telefone → teclado telefônico e autocomplete de telefone;
- nome → autocomplete de nome;
- endereço → tokens nativos de endereço;
- senha atual → finalidade de senha atual;
- nova senha → finalidade de nova senha.

Não desabilitar autocomplete, colagem ou gerenciadores de senha sem motivo forte e documentado.

## Password

Campos de senha devem utilizar o controle seguro nativo da plataforma.

Devem permitir:

- colagem, salvo impedimento de segurança tecnicamente comprovado;
- gerenciadores de senha;
- autocomplete adequado;
- revelação temporária da senha quando o produto oferecer essa função.

O controle `Mostrar senha` é uma ação separada e deve possuir nome e estado acessíveis, por exemplo `Mostrar senha` / `Ocultar senha`, sem depender apenas de ícone de olho.

Não anunciar o conteúdo da senha em texto claro por região live ou mensagem de status.

## Readonly e disabled

`readOnly` e `disabled` têm significados diferentes.

### readOnly

Use quando o valor precisa ser consultado, copiado ou selecionado, mas não editado naquele contexto.

O campo deve permanecer compreensível e, quando a plataforma permitir, acessível à navegação e seleção.

### disabled

Use quando o campo realmente não está disponível.

Não usar disabled apenas para impedir edição de um valor que ainda precisa ser lido; nesse caso, readonly costuma representar melhor a intenção.

A interface deve explicar como habilitar o campo quando isso não for evidente.

## Foco

O indicador de foco deve:

- ser claramente visível;
- não depender apenas de cor;
- possuir contraste suficiente contra superfícies adjacentes;
- permanecer identificável em temas claro e escuro;
- não ser removido por razões estéticas.

O foco não deve saltar automaticamente entre campos durante digitação, inclusive em máscaras ou códigos segmentados, salvo padrão especializado validado com recurso de tecnologia assistiva.

## Teclado

Em Web e desktop:

- `Tab`/navegação equivalente deve alcançar o campo quando interativo;
- teclas de edição, seleção, copiar, recortar e colar devem manter comportamento nativo;
- atalhos do sistema não devem ser bloqueados sem necessidade;
- `Enter` não deve enviar formulários inesperadamente em campos multiline;
- o componente não deve capturar setas ou caracteres que pertencem à edição de texto sem justificativa.

## Touch e área de interação

O próprio campo e ações auxiliares interativas devem respeitar a dimensão mínima de interação do CIATA-DS ou padrão nativo superior da plataforma.

Ícones decorativos internos não devem criar alvos de toque fictícios.

Ações como limpar texto, mostrar senha ou abrir seletor devem ter alvo e nome acessível próprios.

## Conteúdo prefixado/sufixado

Prefixos e sufixos visuais, como `R$`, `kg` ou domínio de e-mail, devem ser expostos de forma que o significado completo do valor permaneça disponível para recursos de tecnologia assistiva.

Não inserir texto decorativo no valor editável se isso prejudicar edição ou serialização.

## Contador de caracteres

Quando houver `maxLength` relevante:

- o limite deve ser informado antes ou durante a edição;
- o contador não deve anunciar a cada tecla de forma excessiva;
- avisos próximos do limite podem ser apresentados de maneira não intrusiva;
- ultrapassar o limite não deve causar perda silenciosa de caracteres sem explicação.

## Search

Campo de busca deve possuir label acessível, ainda que visualmente integrado a uma região de busca.

O botão para limpar busca, quando existir, deve ser um controle separado com nome acessível, como `Limpar busca`.

Sugestões/autocomplete pertencem ao padrão Combobox/Autocomplete e devem seguir contrato especializado; não transformar TextField simples em combobox incompleto.

## Multiline

Campos multiline devem:

- permitir quebra de linha nativa;
- crescer ou rolar sem esconder permanentemente conteúdo/foco;
- manter label e erro associados;
- respeitar ampliação e text scaling;
- não usar `Enter` como submissão principal sem alternativa clara.

## Semântica

O componente deve expor, conforme suporte da plataforma:

- nome;
- papel de campo editável;
- valor;
- required;
- invalid;
- disabled;
- readonly;
- descrição/help text;
- erro;
- finalidade/autocomplete quando disponível.

Não concatenar manualmente no nome acessível frases como `campo de edição` quando o leitor de tela já anuncia o papel.

## Tokens

O componente deve consumir tokens semânticos e de fundação do CIATA-DS, incluindo quando disponíveis:

- fundo e superfície;
- texto principal e secundário;
- borda padrão;
- borda/estado de erro;
- foco e foco-contraste;
- disabled;
- tipografia;
- espaçamento;
- raio;
- dimensão mínima de interação;
- temas claro/escuro.

Não copiar valores literais se houver token canônico equivalente.

## Tema e contraste

O mesmo contrato semântico deve funcionar em tema claro e escuro.

Devem ser verificados pelo menos:

- texto digitado;
- label;
- placeholder;
- help text;
- erro;
- borda/indicador do campo quando ela comunica estado;
- indicador de foco;
- disabled/readonly quando visualmente diferenciados.

Estados não devem depender exclusivamente de cor.

## Escalabilidade

O campo deve suportar:

- zoom e reflow na Web;
- font scaling no Android;
- Dynamic Type no iOS;
- text scaling no Flutter;
- escalabilidade nativa no desktop quando disponível.

Não truncar label, erro ou valor essencial apenas para manter altura fixa.

## Exemplos conformes

- label persistente `E-mail`, autocomplete adequado, erro associado `Informe um e-mail válido`;
- `CPF` com máscara tolerante, aceitando colagem com ou sem pontuação;
- senha com gerenciador de senhas e botão `Mostrar senha` com estado acessível;
- campo readonly contendo endereço calculado por CEP, ainda legível e selecionável;
- textarea com label, descrição e erro associados.

## Exemplos não conformes

- input cujo único nome é o placeholder;
- borda vermelha sem mensagem textual ou estado inválido programático;
- erro anunciado a cada tecla em um CPF ainda incompleto;
- máscara que reposiciona cursor de forma imprevisível;
- bloquear colagem em senha sem justificativa;
- campo disabled usado apenas para exibir valor que a pessoa precisa copiar;
- botão de olho sem nome acessível;
- limpar campo apenas por ícone sem nome;
- autocomplete visual implementado sem semântica de combobox;
- texto reduzido/truncado ao aumentar fonte.

## Matriz mínima de testes

Cada implementação deve verificar, quando aplicável:

- label e nome acessível;
- placeholder separado do label;
- edição, seleção, copiar/colar;
- required;
- help text;
- erro e estado invalid;
- foco e ordem de foco;
- teclado/touch;
- readonly;
- disabled;
- password e mostrar/ocultar;
- autocomplete/input purpose;
- máscara;
- multiline;
- maxLength/contador;
- contraste;
- temas claro/escuro;
- zoom/font scaling/Dynamic Type/text scaling;
- alto contraste ou equivalente;
- leitor de tela relevante da plataforma.

## Validação manual

Antes de ser considerado estável, o componente deve ser validado com recursos de tecnologia assistiva relevantes para cada plataforma suportada. A evidência deve registrar plataforma, versão, recurso de tecnologia assistiva, cenário, resultado e limitações.

Casos com máscara, senha, erro dinâmico, readonly e autocomplete exigem validação manual específica; testes automatizados isolados não são suficientes.

## Critérios de aceite para a especificação

- [ ] propósito e limites de uso acordados;
- [ ] tipos funcionais iniciais aprovados;
- [ ] label persistente definido como padrão;
- [ ] required, erro, help text, readonly e disabled definidos;
- [ ] regras para password e autocomplete aprovadas;
- [ ] regras para máscaras definidas;
- [ ] foco, teclado, touch e área de interação definidos;
- [ ] escalabilidade e contraste definidos;
- [ ] matriz mínima de testes aprovada;
- [ ] implementações de plataforma permanecem experimentais até validação própria.

## Implementações planejadas

- Web;
- Laravel/PHP;
- Python desktop;
- Android/Jetpack Compose;
- iOS/SwiftUI;
- Flutter.
