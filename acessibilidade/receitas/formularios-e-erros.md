# Formulários, validação e erros

## Contrato de experiência

Formulários devem permitir identificar o propósito de cada campo, entender instruções e restrições, preencher com diferentes métodos de entrada, reconhecer erros e corrigi-los sem perda indevida de dados.

## Regras comuns

- use rótulos persistentes; placeholder não substitui rótulo;
- associe instruções e mensagens de erro ao campo correspondente;
- informe obrigatoriedade de forma programática e textual quando necessário;
- preserve valores já informados após erro de validação;
- identifique o erro e explique como corrigi-lo;
- anuncie erros e confirmações no momento apropriado sem duplicação excessiva;
- mantenha o foco no campo ou contexto lógico que precisa de ação;
- use tipos, máscaras e preenchimento automático sem impedir colagem, gerenciadores de senha ou tecnologias assistivas;
- não bloqueie caracteres apenas com base em eventos de teclado quando o mesmo dado pode chegar por voz, colagem ou preenchimento automático;
- reaproveite dados já fornecidos no mesmo processo quando aplicável.

## Web

- prefira `label` associado a `input`, `select` e `textarea`;
- use `fieldset` e `legend` para grupos quando apropriado;
- represente estado inválido com `aria-invalid` quando necessário;
- associe ajuda e erro com `aria-describedby` ou equivalente apropriado;
- não remova o foco do campo ao exibir uma mensagem de erro;
- em validação global, ofereça resumo de erros navegável que leve ao campo correspondente;
- preserve a ordem lógica de tabulação e não crie `tabindex` positivo.

## Android

- prefira componentes nativos de entrada e APIs semânticas da plataforma;
- garanta que rótulo, valor, erro, estado obrigatório e ação estejam expostos ao TalkBack;
- em Compose, use semântica apenas quando o componente nativo não fornecer o comportamento necessário;
- evite substituir toda a descrição do campo por `contentDescription` se isso eliminar valor, estado ou comportamento nativo;
- valide entrada por diferentes métodos, incluindo teclado virtual, físico, ditado, colagem e autofill quando aplicável.

## iOS

- prefira `UITextField`, `UITextView`, SwiftUI `TextField` e controles nativos;
- exponha label, value, traits e hint sem repetir informação evidente;
- ao exibir erro, preserve o contexto do campo e anuncie a mensagem de forma controlada;
- teste com VoiceOver, ditado, teclado físico, preenchimento automático e gerenciador de senhas;
- não transforme todo o formulário em um único elemento acessível.

## Verificação

- cada campo tem nome e propósito claros;
- restrições e formato são conhecidos antes do envio;
- o erro identifica o campo e como corrigir;
- dados válidos não desaparecem após falha;
- teclado, leitor de tela, voz, colagem e autofill não são bloqueados sem necessidade;
- foco e anúncio após erro são previsíveis;
- o envio repetido não causa ação irreversível duplicada.
