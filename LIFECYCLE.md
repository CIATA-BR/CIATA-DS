# Ciclo de vida de projetos CIATA

## Propósito

Este documento descreve o caminho padrão entre uma necessidade e uma solução mantida pelo CIATA. O processo deve ser proporcional ao risco e ao tamanho da iniciativa, sem transformar projetos pequenos em cerimônias desnecessárias.

## 1. Necessidade

Definir:

- problema observado;
- pessoas afetadas;
- impacto atual;
- evidências disponíveis;
- resultado esperado;
- restrições conhecidas.

A necessidade deve ser descrita antes da solução preferida.

## 2. Descoberta

Pesquisar:

- padrões existentes no CIATA-DS;
- soluções anteriores no ecossistema;
- requisitos legais, técnicos e de acessibilidade;
- dependências e integrações;
- riscos de segurança e privacidade;
- alternativas disponíveis.

## 3. Proposta

Mudanças amplas, novos produtos ou padrões reutilizáveis devem começar por RFC. Alterações locais e de baixo risco podem ser tratadas diretamente por issue e pull request.

A proposta deve esclarecer:

- escopo;
- alternativas consideradas;
- custos e riscos;
- critérios de aceite;
- estratégia de acessibilidade;
- estratégia de validação;
- efeitos sobre manutenção e operação.

## 4. Blueprint e arquitetura

Antes da implementação, definir a estrutura necessária:

- responsabilidades;
- limites entre componentes e repositórios;
- fluxos de dados;
- integrações;
- decisões arquiteturais;
- requisitos não funcionais;
- observabilidade;
- segurança e privacidade;
- internacionalização e localização;
- acessibilidade.

Decisões com consequências duradouras devem gerar ADR.

## 5. Prototipação

Validar cedo aquilo que possui maior incerteza.

Protótipos devem considerar conteúdo realista, navegação, estados, erros, teclado, foco, leitores de tela, ampliação e outras tecnologias assistivas aplicáveis.

Um protótipo visual sem comportamento acessível não comprova viabilidade da experiência.

## 6. Implementação

A implementação deve:

- seguir os padrões vigentes;
- preservar separação de responsabilidades;
- manter textos e conteúdos localizáveis;
- incluir semântica e acessibilidade desde cada componente;
- possuir testes proporcionais ao risco;
- atualizar documentação e decisões relacionadas;
- evitar introduzir segredos, dados pessoais ou dependências sem avaliação.

## 7. Revisão

Toda mudança relevante deve passar por revisão adequada ao impacto:

- código e arquitetura;
- segurança e privacidade;
- acessibilidade;
- conteúdo e linguagem;
- testes;
- documentação;
- operação e suporte.

A revisão deve avaliar comportamento e consequências, não apenas estilo de código.

## 8. Validação

Combinar, conforme aplicável:

- testes automatizados;
- inspeção técnica;
- teste funcional manual;
- teste por teclado;
- teste com tecnologias assistivas;
- validação de conteúdo;
- verificação de desempenho;
- verificação de segurança;
- teste de instalação, atualização e recuperação.

Resultados relevantes devem registrar ambiente, versões, cenários, evidências e limitações.

## 9. Release

Uma entrega deve possuir:

- versão ou identificação rastreável;
- changelog compreensível;
- artefatos corretos;
- instruções de implantação ou distribuição;
- plano de reversão quando necessário;
- riscos e limitações conhecidos;
- canais de suporte;
- validações concluídas.

Barreiras críticas de acesso, segurança, privacidade ou integridade bloqueiam a publicação.

## 10. Operação e observabilidade

Depois da entrega, acompanhar:

- disponibilidade;
- erros;
- desempenho;
- incidentes;
- relatos de usuários;
- barreiras de acessibilidade;
- custos;
- dependências desatualizadas;
- comportamento inesperado.

Coletar somente dados necessários e compatíveis com a política de privacidade.

## 11. Aprendizado

Projetos devem registrar:

- o que funcionou;
- o que falhou;
- decisões que precisam ser revistas;
- riscos que se confirmaram;
- barreiras encontradas;
- padrões reutilizáveis;
- dívidas assumidas;
- próximos passos.

Conhecimento reutilizável deve ser promovido ao CIATA-DS.

## 12. Evolução, substituição ou encerramento

Todo produto deve poder ser evoluído, substituído ou arquivado conscientemente.

O encerramento deve considerar:

- comunicação aos usuários;
- exportação ou preservação de dados;
- revogação de credenciais;
- desligamento de infraestrutura;
- arquivamento de documentação;
- retenção legal;
- destino dos aprendizados e componentes reutilizáveis.

## Escala proporcional

Nem toda mudança exige todos os artefatos formais.

- **Baixo risco:** issue, pull request, testes e documentação local.
- **Risco moderado:** especificação breve, revisão multidisciplinar e plano de validação.
- **Alto risco ou alcance institucional:** RFC, ADRs, especificações, revisão de governança e evidências formais.

A redução de cerimônia nunca elimina requisitos de acessibilidade, segurança, privacidade ou rastreabilidade necessários ao impacto da mudança.
