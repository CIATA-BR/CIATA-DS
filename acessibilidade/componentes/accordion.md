# Accordion

## Contrato

Accordion expande e recolhe seções de conteúdo relacionadas. O controle deve comunicar nome, função e estado expandido/recolhido e manter relação clara com a região controlada.

## Regras

- o cabeçalho acionável deve ser um botão real ou equivalente semântico;
- estado expandido/recolhido deve ser exposto;
- o controle deve estar associado ao painel correspondente;
- abrir ou fechar uma seção não deve deslocar foco sem necessidade;
- conteúdo recolhido não deve continuar navegável/focável como se estivesse visível;
- múltiplas seções podem estar abertas ou não conforme o contrato do componente, mas o comportamento deve ser consistente.

## Web

Preferir botão dentro de cabeçalho adequado, usando estado de expansão e relação com o painel quando necessário. Evitar cabeçalhos clicáveis implementados apenas como `div`.

## Android e iOS

O controle deve anunciar nome e estado expandido/recolhido. A expansão deve inserir o conteúdo em ordem lógica logo após o acionador ou conforme a estrutura nativa equivalente.

## Exemplo conforme

Um botão `Detalhes da cobrança` anuncia que está recolhido. Após ativação, passa a anunciar expandido e o conteúdo detalhado fica disponível logo depois.

### Comportamento esperado

A pessoa entende se há conteúdo oculto, consegue abrir/fechar a seção e continua com o foco no acionador após a mudança.

## Exemplo não conforme

Um título visual recebe clique para mostrar/ocultar conteúdo, mas permanece exposto apenas como texto e não comunica estado.

### Por que falha

A tecnologia assistiva não sabe que o elemento é acionável, não informa se há conteúdo oculto e pode deixar a pessoa sem referência sobre o que mudou.

## Critérios de teste

- acionador possui nome e função corretos;
- estado expandido/recolhido é anunciado;
- foco permanece previsível;
- conteúdo recolhido não fica indevidamente focável;
- ordem de leitura após expansão é lógica;
- o estado visual não depende apenas de ícone ou rotação de seta.
