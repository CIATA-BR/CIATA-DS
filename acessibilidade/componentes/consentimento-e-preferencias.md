# Consentimento e preferências

## Objetivo

Consentimentos, preferências e escolhas de privacidade devem ser compreensíveis, reversíveis e operáveis sem depender de cor, posição, memória ou leitura visual rápida.

## Regras

- apresentar finalidade e consequência em linguagem direta;
- separar escolhas realmente distintas em controles distintos;
- não pré-selecionar opções opcionais quando isso puder induzir consentimento não intencional;
- não usar contraste reduzido, ordem enganosa ou rótulos ambíguos para favorecer uma escolha;
- permitir revisar e alterar preferências posteriormente;
- expor nome, função e estado de cada opção;
- não esconder a opção de recusar em menus ou etapas desproporcionais;
- quando houver várias categorias, fornecer agrupamento e contexto compreensíveis.

## Exemplo conforme

Grupo **Preferências de comunicação**:

- checkbox **Receber novidades por e-mail**, desmarcado;
- checkbox **Receber novidades por WhatsApp**, desmarcado;
- botão **Salvar preferências**.

### Comportamento esperado

O leitor de tela anuncia o nome do grupo, cada opção e seu estado. A pessoa consegue aceitar uma categoria sem aceitar outra e pode alterar a decisão depois.

## Exemplo não conforme

Um único switch chamado **Aceito tudo**, ligado por padrão, controla marketing, compartilhamento de dados e notificações. A opção de recusar aparece apenas como texto visual de baixo contraste no rodapé.

### Por que falha

Mistura finalidades diferentes, induz escolha não intencional, reduz controle e pode tornar a recusa inacessível ou difícil de localizar.

## Testes mínimos

1. verificar nome, função, estado e agrupamento de cada opção;
2. testar fluxo aceitando somente parte das categorias;
3. testar recusa de todas as opções opcionais;
4. confirmar que a decisão pode ser revisada depois;
5. validar que nenhuma escolha depende apenas de cor, posição ou hierarquia visual.
