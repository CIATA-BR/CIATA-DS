# Redução de movimento e efeitos

## Contrato

Preferências de redução de movimento devem ser respeitadas sem remover informação, estado ou funcionalidade necessária.

## Regras

- respeitar preferências de redução de movimento da plataforma;
- substituir animações intensas por transições simples quando possível;
- não usar movimento como único indicador de mudança;
- evitar parallax, zoom, flashes e deslocamentos desnecessários;
- preservar feedback de conclusão mesmo quando a animação é reduzida;
- não mover foco junto com animações visuais;
- permitir pausar efeitos contínuos quando aplicável.

## Web

Usar `prefers-reduced-motion` para reduzir animações e transições não essenciais. O estado final deve continuar evidente semanticamente e visualmente.

## Android

Considerar configurações de animação e redução de movimento do sistema. Evitar depender de animação para explicar navegação ou sucesso.

## iOS

Respeitar Reduce Motion e demais preferências relevantes. Substituir efeitos por alternativas menos intensas sem alterar a jornada.

## Exemplo conforme

Ao reduzir movimento, a tela troca de estado sem zoom ou parallax, mas mantém mensagem de sucesso e foco no contexto esperado.

## Exemplo não conforme

A única indicação de sucesso é uma animação rápida que desaparece quando Reduce Motion está ativo.

## Por que falha

A pessoa pode perder feedback essencial justamente ao ativar uma preferência de acessibilidade.

## Critérios de teste

- preferência do sistema é respeitada;
- informação permanece completa;
- foco não acompanha animação automaticamente;
- efeitos contínuos podem ser pausados quando aplicável;
- redução de movimento não remove feedback essencial;
- leitores de tela recebem estados equivalentes.
