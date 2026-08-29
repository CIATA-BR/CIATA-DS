# Mídia e conteúdo visual

## Contrato de experiência

Conteúdo visual, sonoro ou audiovisual deve comunicar a mesma informação essencial por meios alternativos adequados ao contexto. A alternativa deve preservar finalidade, sequência e informação necessária para concluir a tarefa.

## Regras comuns

- imagens informativas precisam de alternativa textual equivalente;
- imagens decorativas devem ficar fora da árvore de acessibilidade ou ser ignoradas adequadamente;
- não transmita informação apenas por cor, posição, forma, animação ou som;
- texto essencial não deve existir apenas dentro de imagem quando houver alternativa semântica viável;
- gráficos e visualizações devem oferecer os dados ou conclusões necessárias em formato textual ou estruturado;
- áudio e vídeo devem oferecer alternativas aplicáveis, como legendas, transcrição ou audiodescrição conforme o conteúdo;
- controles de mídia devem ser acessíveis por teclado e tecnologias assistivas;
- reprodução automática não deve impedir percepção ou controle da interface.

## Web

- use `alt` de acordo com função e contexto da imagem, não como descrição mecânica de pixels;
- imagens decorativas devem usar alternativa vazia ou técnica equivalente;
- `canvas`, SVG e gráficos precisam de nome, estrutura ou alternativa que exponha a informação relevante;
- vídeo deve ter controles operáveis por teclado e nomes acessíveis;
- legendas e faixas alternativas devem estar sincronizadas quando aplicáveis.

## Android

- use descrições acessíveis apenas em imagens informativas e controles gráficos;
- marque elementos puramente decorativos para não gerar ruído no TalkBack;
- não substitua texto visível por imagem sem conteúdo acessível equivalente;
- controles de player devem expor nome, função e estado;
- teste conteúdo audiovisual com TalkBack e preferências de legenda do sistema.

## iOS

- defina labels acessíveis para imagens informativas e controles gráficos;
- exclua elementos decorativos da navegação do VoiceOver;
- garanta que controles de áudio e vídeo exponham estado e ação;
- respeite preferências de legendas e recursos de mídia da plataforma;
- valide a ordem de leitura quando imagem, legenda e controles formarem um único bloco conceitual.

## Verificação

- toda informação visual essencial possui equivalente não visual;
- elementos decorativos não criam ruído;
- gráficos têm alternativa útil e acionável;
- vídeo e áudio oferecem alternativas adequadas ao conteúdo;
- controles de mídia são operáveis sem visão e sem gesto exclusivo;
- cor, forma, posição e som nunca são o único meio de transmitir informação essencial.
