# Áudio e vídeo

## Contrato

Conteúdo em áudio ou vídeo deve preservar informação, operação e contexto para pessoas que não ouvem, não enxergam ou não conseguem acompanhar uma modalidade sensorial específica.

## Regras

- não transmitir informação essencial exclusivamente por som, imagem, cor, posição ou movimento;
- fornecer controles acessíveis para reproduzir, pausar, avançar, retroceder, volume e tela cheia quando aplicável;
- evitar reprodução automática com áudio; quando existir, oferecer interrupção imediata e previsível;
- preservar foco e contexto ao abrir ou fechar o player;
- não depender de hover ou gesto complexo para revelar controles essenciais;
- conteúdos com fala ou informação sonora relevante devem possuir alternativa textual ou legendada adequada;
- conteúdos com informação visual essencial devem possuir alternativa equivalente, incluindo audiodescrição quando aplicável.

## Web

Preferir controles nativos ou players cuja semântica, foco e operação por teclado estejam comprovados. Controles customizados devem expor nome, função, estado e valor.

## Android e iOS

Usar APIs nativas de mídia e controles compatíveis com leitor de tela, comandos do sistema e configurações de acessibilidade. Não esconder controles essenciais da árvore de acessibilidade.

## Exemplo conforme

Vídeo institucional com controles operáveis por teclado e leitor de tela, legendas sincronizadas, transcrição disponível e audiodescrição quando informação visual não é dita na faixa principal.

### Comportamento esperado

A pessoa consegue iniciar, pausar e navegar no conteúdo; entende falas, sons relevantes e informação visual essencial por uma modalidade alternativa equivalente.

## Exemplo não conforme

Vídeo inicia automaticamente com áudio, possui controles apenas visuais e transmite uma instrução importante somente por uma animação na tela.

### Por que falha

A pessoa pode não conseguir interromper o áudio, operar o player ou perceber a informação essencial.

## Critérios de teste

- controles são alcançáveis, nomeados e operáveis;
- foco permanece previsível;
- reprodução automática pode ser interrompida;
- informação sonora e visual essencial possui alternativa equivalente;
- player funciona com leitor de tela e teclado/gestos equivalentes;
- zoom, tamanho de texto e orientação não ocultam controles essenciais.
