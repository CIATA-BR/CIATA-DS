# Animação e redução de movimento

## Contrato

Movimento não deve ser necessário para compreender ou operar a interface e deve respeitar preferências de redução de movimento quando possível.

## Regras

- não depender de animação para comunicar informação essencial;
- evitar movimento contínuo, parallax ou transições intensas sem necessidade funcional;
- respeitar preferências do sistema para reduzir movimento;
- oferecer pausa, interrupção ou alternativa quando animação persistente puder distrair ou causar desconforto;
- preservar foco e contexto durante transições;
- não mover automaticamente o foco apenas porque uma animação terminou.

## Web

Respeitar `prefers-reduced-motion` e reduzir ou remover efeitos não essenciais. A alteração visual não deve modificar a ordem semântica ou de foco.

## Android e iOS

Considerar configurações do sistema relacionadas a redução de movimento/animações e evitar efeitos que dificultem acompanhamento com tecnologia assistiva.

## Exemplo conforme

Carrossel com transição discreta que pode ser pausada e que reduz a animação quando a preferência do sistema solicita menos movimento.

### Comportamento esperado

A pessoa recebe a mesma informação e mantém controle da navegação independentemente da presença da animação.

## Exemplo não conforme

Conteúdo desliza automaticamente entre telas, não pode ser pausado e exige acompanhar visualmente o movimento para entender onde a ação terminou.

### Por que falha

A pessoa pode perder contexto, foco ou informação e não consegue adaptar a experiência às suas necessidades.

## Critérios de teste

- redução de movimento é respeitada;
- animação não carrega informação exclusiva;
- foco não é perdido durante transições;
- movimento persistente pode ser interrompido quando aplicável;
- conteúdo permanece compreensível sem animação.
