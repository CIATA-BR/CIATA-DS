# Suporte e contato

## Objetivo

Garantir que a pessoa consiga pedir ajuda por um canal acessível quando a jornada digital não resolve o problema.

## Regras

- canais de suporte devem ser localizáveis sem depender de uma jornada que já falhou;
- telefone, e-mail, chat e formulário devem ter nomes e propósitos claros;
- não exigir um único canal quando houver alternativa razoável;
- formulários de suporte seguem os mesmos contratos de rótulo, erro, foco e confirmação do restante do produto;
- chat não deve anunciar toda atualização como urgente nem mover foco automaticamente para mensagens novas;
- anexos enviados ao suporte devem seguir o padrão de upload acessível;
- a confirmação deve informar que a solicitação foi recebida e, quando existir, fornecer protocolo em texto selecionável e copiável.

## Exemplo conforme

```html
<h2>Precisa de ajuda?</h2>
<p>Escolha como prefere falar com a equipe.</p>
<a href="mailto:suporte@example.org">Enviar e-mail ao suporte</a>
<a href="tel:+551100000000">Ligar para o suporte</a>
<button type="button">Abrir chat de suporte</button>
```

### Comportamento esperado

Cada canal comunica claramente a ação. A pessoa pode escolher o mecanismo compatível com sua necessidade e tecnologia assistiva.

## Exemplo não conforme

```html
<div class="icone-chat" onclick="abrirChat()"></div>
```

### Por que falha

O canal existe apenas como elemento visual sem nome, sem função e possivelmente sem acesso por teclado ou tecnologia assistiva.

## Validação mínima

1. localizar suporte por headings, landmarks e navegação sequencial;
2. operar todos os canais com teclado e leitor de tela;
3. testar chat sem roubo de foco ou anúncios excessivos;
4. validar formulário, anexos e confirmação de protocolo;
5. confirmar que suporte continua acessível após um erro na jornada principal.
