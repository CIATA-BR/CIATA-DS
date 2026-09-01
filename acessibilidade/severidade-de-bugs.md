# Classificação de severidade de bugs de acessibilidade

Este documento define o padrão do CIATA Design System para classificar o impacto de barreiras de acessibilidade encontradas em produtos digitais, componentes, documentos e fluxos.

A severidade deve refletir principalmente o **impacto real na jornada da pessoa usuária**, e não apenas o número do critério WCAG envolvido, a facilidade de correção ou a frequência do defeito.

## Princípio central

Um mesmo critério normativo pode gerar severidades diferentes dependendo do contexto. A pergunta principal é:

> Esta barreira impede, dificulta de forma relevante ou apenas reduz a qualidade da experiência sem impedir a conclusão da jornada?

## Alto

Classificar como **Alto** quando a barreira impede a pessoa usuária de concluir uma tarefa, acessar informação essencial ou operar uma função necessária sem assistência externa ou workaround desproporcional.

Exemplos:

- componente essencial não recebe foco por teclado ou leitor de tela;
- botão ou ação obrigatória não é acionável com tecnologia assistiva;
- conteúdo essencial apresentado apenas de forma gráfica e sem alternativa equivalente;
- operação disponível somente por gesto complexo, arrastar ou outra interação sem alternativa acessível;
- foco fica preso ou é perdido de forma que a jornada não pode continuar;
- modal, bottom sheet ou diálogo bloqueia a interface sem oferecer navegação ou fechamento acessível;
- erro de formulário essencial não é identificável ou não pode ser corrigido com tecnologia assistiva;
- autenticação, pagamento, cadastro, envio ou outra etapa crítica fica impossível de concluir;
- informação necessária para decisão ou segurança não é percebida por pessoas que usam determinada tecnologia assistiva.

### Regra prática

Se uma pessoa usuária razoavelmente dependeria de ajuda de outra pessoa para concluir a tarefa por causa da barreira, a severidade tende a ser Alta.

## Médio

Classificar como **Médio** quando a jornada continua possível, mas com dificuldade relevante, perda de eficiência, ambiguidade ou esforço adicional evitável.

Exemplos:

- label existe, mas não está corretamente associada ou concatenada ao controle;
- ordem de leitura ou foco é confusa, embora ainda permita concluir a tarefa;
- hierarquia de cabeçalhos está incorreta e prejudica a navegação estrutural;
- estado de um controle não é anunciado corretamente, mas pode ser inferido por outro meio;
- mensagens de status não são anunciadas automaticamente, exigindo exploração manual;
- área clicável é inadequada, mas existe alternativa de interação;
- componente exige mais passos do que o necessário com leitor de tela ou teclado;
- texto, instrução ou nome acessível é ambíguo, embora a função ainda seja utilizável.

### Regra prática

Se a pessoa consegue concluir a jornada sozinha, mas com atrito considerável ou risco de erro, a severidade tende a ser Média.

## Baixo

Classificar como **Baixo** quando a barreira reduz qualidade, clareza ou completude da experiência, mas não compromete de forma relevante a conclusão da tarefa principal.

Exemplos:

- descrição de imagem omite detalhe interessante, mas não necessário para compreender ou agir;
- redundância de anúncio que não cria ambiguidade nem bloqueio;
- pequena inconsistência de texto acessível sem impacto funcional;
- problema estrutural localizado em conteúdo secundário;
- informação complementar não é anunciada da melhor forma, mas o conteúdo essencial permanece disponível.

### Regra prática

Se a correção melhora a experiência, mas a ausência dela não muda materialmente a capacidade de concluir a jornada, a severidade tende a ser Baixa.

## Severidade não é prioridade

Severidade e prioridade devem ser tratadas separadamente.

- **Severidade** mede o impacto da barreira na pessoa usuária.
- **Prioridade** considera também alcance, frequência, criticidade de negócio, exposição regulatória, risco e esforço de correção.

Um bug Baixo muito frequente pode receber prioridade alta. Um bug Alto em uma função rara continua sendo severidade Alta, ainda que sua prioridade de entrega seja discutida separadamente.

## Evidências mínimas

Todo bug deve registrar, quando aplicável:

- plataforma e versão;
- navegador ou aplicativo e versão;
- tecnologia assistiva e versão;
- dispositivo ou tipo de entrada;
- passos para reprodução;
- resultado atual;
- resultado esperado;
- impacto observado na jornada;
- severidade atribuída e justificativa;
- critério WCAG ou outro referencial relacionado, quando identificável;
- evidências adicionais como vídeo, áudio, captura, log ou descrição técnica.

## Critérios normativos e severidade

A severidade não deve ser inferida automaticamente pelo nível A, AA ou AAA da WCAG. O nível de conformidade do critério e o impacto funcional do defeito são dimensões diferentes.

Também não se deve reduzir a severidade apenas porque existe workaround. O workaround deve ser avaliado quanto a descoberta, esforço, autonomia, segurança e equivalência funcional.

## Casos com múltiplas deficiências ou tecnologias

Quando o mesmo defeito apresenta impactos diferentes conforme a tecnologia assistiva, deve-se registrar o pior impacto reproduzível relevante e detalhar as diferenças no campo de evidências.

Exemplo: um componente pode ser apenas inconveniente com teclado, mas completamente inoperável com leitor de tela. Nesse caso, a severidade deve considerar a barreira impeditiva.

## Reavaliação

Após a correção, o bug deve ser retestado no ambiente em que foi identificado e, quando o componente for compartilhado, em plataformas ou tecnologias adicionais relevantes. A severidade original deve permanecer no histórico; o status muda, não a classificação histórica do impacto encontrado.
