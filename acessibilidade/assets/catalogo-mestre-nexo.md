# Catálogo mestre do acervo do Nexo

Este documento é a fonte operacional para registrar, localizar, aprovar e reutilizar os assets visuais do Nexo.

A referência canônica de identidade continua sendo `imagens/institucional/Nexo_acolhedor_oficial.png`.

## Objetivos

- impedir que o acervo se torne apenas uma pasta de arquivos sem contexto;
- registrar finalidade, estado e status de aprovação de cada asset;
- facilitar reutilização entre Web, Android, iOS, apresentações e comunicação institucional;
- evitar duplicidade e deriva visual;
- manter descrição acessível e tratamento semântico associados ao asset.

## Status permitidos

- `rascunho`: asset ainda em avaliação;
- `aprovado`: identidade e finalidade validadas;
- `canonico`: referência oficial para determinada pose, estado ou contexto;
- `depreciado`: não deve ser usado em novas interfaces;
- `arquivado`: mantido apenas por histórico.

## Registro inicial

### Nexo acolhedor oficial

- Arquivo: `imagens/institucional/Nexo_acolhedor_oficial.png`
- Identidade: Nexo 1.0
- Estado: acolhedor
- Finalidade: referência canônica geral de identidade
- Status: `canonico`
- Texto embutido: marca CIATA no peito
- Fundo: transparente
- Uso recomendado: institucional, onboarding, apresentações e referência para novas gerações
- Descrição curta sugerida: Nexo, mascote robótico do CIATA, sorridente e de braços abertos.

### Nexo apresentando e apontando

- Arquivo: `imagens/institucional/Nexo_apresentando_apontando.png`
- Identidade: Nexo 1.0
- Estado: orientação
- Finalidade: apresentar conteúdo ou indicar uma ação, direção ou seção
- Status: `aprovado`
- Fundo: transparente
- Uso recomendado: onboarding, ajuda contextual e apresentação de conteúdo
- Descrição curta sugerida: Nexo sorridente, com uma mão aberta e a outra apontando para uma direção.

### Nexo expressão neutra

- Arquivo: `imagens/institucional/Nexo_expressão_neutra.png`
- Identidade: Nexo 1.0
- Estado: neutro
- Finalidade: referência de pose neutra e uso genérico
- Status: `aprovado`
- Fundo: transparente
- Uso recomendado: contexto institucional sem estado emocional específico
- Descrição curta sugerida: Nexo em pé, de frente, com expressão amigável e postura neutra.

### Nexo sucesso

- Arquivo: `imagens/institucional/Nexo_sucesso.png`
- Duplicata exata: `imagens/institucional/05_nexo_sucesso.png`
- Identidade: Nexo 1.0
- Estado: sucesso
- Finalidade: reforçar uma ação concluída ou o fim de uma jornada
- Status: `aprovado`
- Classificação: decorativo
- Fundo: transparente
- Texto embutido: marca CIATA no peito
- Uso recomendado: confirmação de envio, cadastro concluído, conclusão de jornada
- Descrição curta sugerida: Nexo sorridente, com o polegar para cima e o outro punho erguido, comemorando.
- Referência canônica: `imagens/institucional/Nexo_acolhedor_oficial.png`
- Data de aprovação: 31/10/2026
- Observações: na falta de uma pose própria de conclusão no Nexo 1.0, também cobre o estado de conclusão. Em uso no Emprega CIATA (Web, Android e iOS) ao lado de mensagem textual de sucesso.

### Nexo alerta amigável

- Arquivo: `imagens/institucional/Nexo_Amigável.png`
- Duplicata exata: `imagens/institucional/06_nexo_alerta_amigavel.png`
- Identidade: Nexo 1.0
- Estado: atenção
- Finalidade: reforçar um aviso ou uma falha já descritos em texto, sem alarmar
- Status: `aprovado`
- Classificação: decorativo
- Fundo: transparente
- Texto embutido: marca CIATA no peito
- Uso recomendado: páginas de erro, falha de carregamento, avisos que pedem uma ação
- Descrição curta sugerida: Nexo sorridente, com o indicador erguido como quem lembra de algo e a outra mão aberta.
- Referência canônica: `imagens/institucional/Nexo_acolhedor_oficial.png`
- Data de aprovação: 31/10/2026
- Observações: na falta de uma pose própria de erro no Nexo 1.0, também cobre o estado de erro, sempre acompanhado do texto que explica a falha e a ação. Em uso no Emprega CIATA (Web, Android e iOS).

## Pendências de identidade

As imagens `02_nexo_bracos_abertos.png` e `07` a `17` (e as cópias com nomes descritivos) mostram outro desenho de robô, sem o cabelo amarelo e com olhos azuis, e várias trazem texto embutido. Elas não seguem a identidade 1.0 e não devem ser usadas como Nexo em novas interfaces. Os estados erro, estado vazio, carregamento e conclusão ainda precisam ser gerados a partir da referência canônica.

## Regra de entrada

Todo novo asset do Nexo deve ter uma entrada neste catálogo ou em futura representação estruturada derivada dele antes de ser considerado pronto para uso.

O registro deve seguir os campos definidos em `esquema-de-metadados-do-nexo.md` e passar pelo `checklist-de-entrada-do-acervo.md`.
