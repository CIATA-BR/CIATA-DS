# Critérios comuns de aceite de componentes

Este documento define critérios de aceite compartilhados pelos componentes canônicos de acessibilidade.

## Semântica

- nome acessível corresponde à finalidade do controle;
- função corresponde ao comportamento real;
- estado e valor são expostos quando aplicáveis;
- informações anunciadas não são duplicadas sem necessidade;
- componentes nativos são preferidos quando atendem ao caso de uso.

## Operação

- componente é alcançável pelos mecanismos de entrada previstos;
- interação por teclado segue convenções da plataforma;
- gesto de leitor de tela produz efeito equivalente ao toque visual;
- nenhuma ação essencial depende apenas de gesto complexo;
- estado desabilitado impede ação sem remover informação necessária.

## Foco

- foco visual e foco de acessibilidade permanecem coerentes;
- foco é perceptível;
- ativação não desloca foco sem motivo funcional;
- após atualização de estado, a pessoa usuária continua no contexto lógico adequado.

## Percepção

- estado não depende apenas de cor;
- texto, ícone e indicador de foco possuem contraste adequado;
- aumento de texto, zoom ou configuração de fonte não remove conteúdo essencial;
- alvo de interação permanece utilizável.

## Tecnologia assistiva

Validar, conforme a plataforma:

- Web: teclado e pelo menos um leitor de tela da linha de base definida;
- Android: TalkBack e, quando aplicável, teclado físico/controle alternativo;
- iOS: VoiceOver e, quando aplicável, teclado físico/controle alternativo;
- Braille: quando o componente ou produto depender de leitura/edição detalhada e houver cobertura prevista na auditoria.

## Resultado

Um componente só pode ser considerado apto ao Design System quando os critérios aplicáveis forem reproduzíveis e estiverem cobertos pelo processo de auditoria e reteste do CIATA.
