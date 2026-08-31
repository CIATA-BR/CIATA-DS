# Tema, contraste e aparência

## Contrato

Preferências de aparência devem melhorar conforto e legibilidade sem alterar a semântica, esconder informação ou introduzir contraste insuficiente.

## Regras

- respeitar preferências do sistema quando aplicável;
- manter contraste mínimo em todos os temas suportados;
- não depender de cor, luminosidade ou tema para comunicar estado;
- preservar foco visível em claro, escuro e alto contraste;
- evitar imagens, ícones e ilustrações que desapareçam em temas alternativos;
- garantir que customizações do usuário não removam informação essencial;
- oferecer restauração simples ao padrão.

## Web

Testar temas com `prefers-color-scheme`, modos de contraste e combinações reais de navegador/SO. Não presumir que inversão de cores automática preserve todos os estados.

## Android

Respeitar tema do sistema e configurações de contraste quando disponíveis. Validar TalkBack em temas claro/escuro e com fontes ampliadas.

## iOS

Respeitar Dark Mode, Increase Contrast e demais preferências relevantes. Não codificar cores de forma que percam sentido em aparências alternativas.

## Exemplo conforme

Um aviso de erro usa texto, ícone e semântica de erro, mantendo contraste adequado em tema claro e escuro.

## Exemplo não conforme

O estado de erro é indicado apenas por borda vermelha que perde contraste no modo escuro.

## Por que falha

A mudança de aparência altera a percepção do estado e pode tornar o erro invisível para parte das pessoas usuárias.

## Critérios de teste

- contraste validado em todos os temas;
- foco permanece perceptível;
- estados não dependem apenas de cor;
- preferência do sistema é respeitada quando aplicável;
- retorno ao padrão é simples;
- leitor de tela recebe a mesma semântica independentemente do tema.
