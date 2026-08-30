# Orientação e layout adaptável

## Contrato

A interface deve permanecer operável e compreensível em diferentes orientações e configurações de exibição, exceto quando uma orientação específica for essencial à atividade.

## Regras

- não bloquear retrato ou paisagem sem necessidade essencial;
- preservar ordem lógica de leitura e foco quando o layout muda;
- não ocultar controles ou conteúdo essencial ao rotacionar ou redimensionar;
- manter alvos de interação, labels, erros e mensagens compreensíveis em telas estreitas;
- evitar que a reorganização visual crie uma ordem semântica diferente da ordem percebida;
- documentar exceções de orientação com justificativa funcional.

## Exemplo conforme

Formulário reorganiza duas colunas em uma coluna ao rotacionar ou reduzir a janela, preservando a mesma sequência de rótulos, campos e mensagens.

### Comportamento esperado

A pessoa continua a jornada sem perder contexto, foco, conteúdo preenchido ou acesso aos controles.

## Exemplo não conforme

Aplicativo força modo paisagem para uma tela comum de cadastro e, em retrato, oculta o botão de continuar.

### Por que falha

A orientação se torna uma barreira sem relação essencial com a tarefa e pode impedir o uso com dispositivos posicionados de forma fixa.

## Critérios de teste

- retrato e paisagem funcionam quando aplicáveis;
- rotação não apaga dados nem perde foco;
- ordem de leitura permanece lógica;
- controles essenciais continuam disponíveis;
- zoom, fonte ampliada e janela estreita não exigem orientação específica sem necessidade.
