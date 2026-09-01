# Microcopy e rótulos de interface

## Contrato

Textos curtos de interface devem indicar com clareza o que existe, o que acontecerá e, quando necessário, qual contexto será afetado. Rótulos vagos ou repetidos aumentam carga cognitiva e podem tornar jornadas ambíguas para pessoas que navegam por leitor de tela, voz, teclado ou listas de controles.

## Regras

- preferir rótulos específicos ao contexto, como `Continuar para pagamento` em vez de vários botões apenas `Continuar`;
- o nome acessível deve corresponder à ação real e permanecer estável enquanto a função não muda;
- evitar instruções que dependam de posição visual, cor, ícone ou gesto não explicado;
- não acrescentar manualmente palavras de função que a plataforma já anuncia, como `botão`, salvo necessidade real do conteúdo;
- links devem comunicar destino ou propósito quando o texto isolado puder ser ambíguo;
- ações destrutivas devem identificar claramente o objeto afetado quando houver risco de erro;
- abreviações, siglas e termos técnicos devem ser evitados ou explicados quando não forem conhecimento esperado do público.

## Exemplo conforme

- `Continuar para endereço`
- `Excluir conta de Maria`
- `Baixar relatório em PDF`

## Exemplo não conforme

- `Continuar`
- `Clique aqui`
- `OK`
- `Ícone da direita`

## Por que falha

Quando controles são lidos fora do contexto visual, nomes genéricos podem se tornar indistinguíveis. A pessoa precisa reconstruir a interface pela memória ou navegar repetidamente para descobrir a função real.

## Critérios de teste

- rótulos continuam compreensíveis quando lidos isoladamente;
- controles equivalentes possuem nomes consistentes;
- ações distintas não compartilham nomes vagos sem contexto suficiente;
- a interface não depende de orientação espacial para explicar ações;
- o texto não duplica desnecessariamente a função anunciada pela tecnologia assistiva.