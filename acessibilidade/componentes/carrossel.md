# Carrossel

## Contrato

Carrossel apresenta uma sequência de conteúdos sem exigir acompanhamento visual contínuo, gesto de swipe ou rotação automática para acessar informações e ações.

## Regras

- fornecer nome contextual para a região quando isso ajudar a navegação;
- expor controles anterior e próximo com nomes claros;
- informar posição atual de forma concisa, por exemplo `2 de 5`;
- não mover foco automaticamente quando o slide muda;
- conteúdo fora da tela não deve permanecer indevidamente focável;
- rotação automática deve poder ser pausada ou parada;
- interação da pessoa deve interromper rotação automática quando apropriado;
- swipe não pode ser a única forma de navegar;
- respeitar preferências de redução de movimento;
- evitar anunciar cada rotação automática em região viva.

## Exemplo conforme

`Destaques, região. Slide 2 de 5. Curso de tecnologia assistiva.`

Controles: `Destaque anterior, botão`, `Próximo destaque, botão` e `Pausar rotação, botão` quando houver avanço automático.

## Comportamento esperado

A pessoa pode navegar na própria velocidade, sem perder foco, sem receber anúncios contínuos e sem depender de gesto horizontal preciso.

## Exemplo não conforme

Banner troca a cada cinco segundos, move o foco para o novo slide e oferece navegação apenas por swipe ou pequenos pontos visuais.

## Por que falha

A pessoa perde contexto, pode ter a leitura interrompida e não possui mecanismo equivalente de controle.

## Critérios de teste

- anterior/próximo são operáveis por teclado e tecnologia assistiva;
- slide atual e posição são compreensíveis;
- mudança de slide não rouba foco;
- rotação automática pode ser interrompida;
- slides ocultos não poluem a ordem de foco;
- não há dependência exclusiva de swipe;
- redução de movimento é respeitada quando aplicável.

Veja também [Animação e redução de movimento](animacao-e-reducao-de-movimento.md), [Foco e contexto](../receitas/foco-e-contexto.md) e [Gestos e drag-and-drop](../receitas/gestos-e-drag-and-drop.md).