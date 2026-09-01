# Automação de testes de acessibilidade

## Contrato

Automação deve funcionar como rede de proteção para detectar regressões objetivas e recorrentes, sem ser tratada como prova suficiente de conformidade. Resultado automatizado complementa, mas não substitui, validação manual com teclado, leitores de tela, ampliação, preferências do sistema e análise de contexto.

## Regras

- automatizar verificações determinísticas e repetíveis sempre que houver ferramenta adequada;
- não concluir que uma interface é acessível apenas porque a suíte automatizada passou;
- registrar ferramenta, versão e regra quando um achado automatizado for usado como evidência;
- evitar bloquear entrega por falso positivo conhecido sem triagem técnica;
- manter exceções documentadas, justificadas e revisáveis;
- combinar testes estáticos, testes de componente e testes de jornada quando aplicável;
- priorizar regressões em componentes canônicos e jornadas críticas;
- atualizar a suíte quando o contrato do Design System mudar.

## O que a automação costuma detectar bem

- ausência de nome acessível em controles simples;
- relações semânticas inválidas ou ausentes em casos determinísticos;
- uso incorreto de alguns papéis e atributos;
- contraste calculável em combinações estáticas;
- foco programático ausente em cenários especificamente testados;
- regressões em estados e propriedades expostas pelo componente.

## O que não deve ser delegado apenas à automação

- qualidade e clareza do nome acessível;
- ordem de foco realmente compreensível na jornada;
- experiência de leitor de tela em conteúdo dinâmico;
- acessibilidade cognitiva e carga de memória;
- equivalência de gestos e interação por toque;
- pertinência de texto alternativo;
- usabilidade com ampliação, zoom e reflow em contexto real.

## Exemplo conforme

A CI verifica automaticamente nomes, papéis, estados e violações determinísticas em componentes. O release de uma jornada crítica também passa por teste manual com teclado e leitor de tela.

## Exemplo não conforme

A equipe executa uma ferramenta automática, recebe zero violações e registra a funcionalidade como acessível sem qualquer teste manual.

## Por que falha

Ferramentas automatizadas cobrem apenas parte das barreiras possíveis. Uma interface pode passar na suíte e ainda ter foco imprevisível, rótulos ambíguos, mensagens inaudíveis ou gestos impossíveis de executar com tecnologia assistiva.

## Critérios de teste

- suíte automatizada cobre regras objetivas relevantes;
- resultados são triados antes de virarem bug ou bloqueio;
- versão da ferramenta é rastreável;
- exceções possuem justificativa;
- jornadas críticas recebem validação manual complementar;
- mudanças no DS provocam revisão dos testes relacionados.
