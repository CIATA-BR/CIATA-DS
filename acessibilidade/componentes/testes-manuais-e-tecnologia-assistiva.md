# Testes manuais e tecnologia assistiva

## Contrato

Teste manual deve validar comportamento real da interface com os mecanismos de interação relevantes para a plataforma. A seleção de tecnologias assistivas deve considerar risco, público, componente e jornada, sem reduzir a validação a uma única ferramenta.

## Regras

- testar teclado ou mecanismo equivalente quando aplicável;
- validar com leitor de tela principal da plataforma em jornadas críticas;
- incluir foco, nome, função, estado, valor e feedback dinâmico;
- testar aumento de texto, zoom, reflow ou escala de fonte conforme a plataforma;
- verificar operação sem gesto complexo exclusivo;
- validar mensagens, erros, confirmações e retorno de foco;
- registrar ambiente suficiente para reproduzir o resultado;
- retestar o comportamento corrigido no contexto da jornada, não apenas o componente isolado.

## Matriz mínima sugerida

### Web

- navegação completa por teclado;
- leitor de tela representativo no navegador suportado;
- zoom/reflow e contraste;
- conteúdo dinâmico e gerenciamento de foco.

### Android

- TalkBack ou leitor de tela suportado;
- navegação por toque e foco de acessibilidade;
- escala de fonte e display;
- gestos alternativos quando necessário.

### iOS

- VoiceOver;
- ordem de foco e rotor quando relevante;
- Dynamic Type;
- redução de movimento e demais preferências relacionadas.

## Exemplo conforme

Um modal passa no teste automatizado e depois é validado manualmente: foco entra no conteúdo esperado, permanece no contexto modal, Escape ou ação equivalente fecha e o foco retorna ao acionador.

## Exemplo não conforme

A equipe confirma apenas que o modal possui `role="dialog"` e `aria-modal="true"`, sem verificar entrada, contenção ou retorno de foco.

## Por que falha

Sem teste de interação real, é possível validar a semântica isolada e ainda entregar uma jornada impraticável para quem usa tecnologia assistiva.

## Critérios de teste

- ambiente de teste está registrado;
- comportamento esperado está descrito antes da execução;
- resultado observado é reproduzível;
- teste cobre entrada, operação, feedback e saída do componente;
- correções são retestadas na jornada completa;
- divergências entre tecnologias assistivas relevantes são documentadas.
