# Padrões de arquitetura

Este documento apresenta princípios arquiteturais compartilhados. Ele não impõe uma tecnologia única e não substitui a arquitetura concreta de cada produto.

## 1. Arquitetura orientada ao problema

Tecnologia não define o produto. A arquitetura deve nascer de:

- necessidades das pessoas;
- requisitos funcionais;
- requisitos de acessibilidade;
- riscos de segurança e privacidade;
- contexto operacional;
- capacidade real da equipe;
- custo de manutenção.

Evitar introduzir serviços, camadas, abstrações ou dependências sem um problema verificável que os justifique.

## 2. Separação de responsabilidades

Os limites entre domínio, aplicação, infraestrutura e interface devem permanecer compreensíveis.

Como regra geral:

- modelos de domínio não devem depender de frameworks visuais;
- regras de negócio não devem ficar escondidas em componentes de interface;
- componentes de interface não devem assumir responsabilidades de persistência ou integração;
- recursos visuais e textos localizáveis não devem contaminar regras de domínio;
- dependências externas devem possuir pontos de integração identificáveis;
- efeitos colaterais devem permanecer controlados e testáveis.

A forma concreta dessa separação depende da plataforma.

## 3. Acessibilidade como atributo arquitetural

A arquitetura deve permitir:

- semântica adequada;
- foco previsível;
- navegação por teclado;
- rótulos localizáveis;
- feedback de estado e erro;
- alternativas equivalentes;
- testes com tecnologias assistivas;
- substituição de componentes inacessíveis;
- evolução sem regressões silenciosas.

Uma biblioteca ou componente que impeça esses requisitos precisa ser substituído, adaptado ou formalmente tratado como risco.

## 4. Limites e contratos

Módulos, serviços e integrações devem ter contratos claros.

Documentar quando relevante:

- entradas e saídas;
- formatos e versões;
- autenticação;
- autorização;
- erros esperados;
- idempotência;
- limites de uso;
- timeout e repetição;
- compatibilidade;
- degradação;
- dados pessoais envolvidos.

Contratos externos não devem ser espalhados por toda a base de código.

## 5. Dependências

Toda dependência adiciona custo de atualização, risco e conhecimento necessário.

Antes de adotar uma dependência, avaliar:

- manutenção ativa;
- licença;
- segurança;
- acessibilidade;
- tamanho e impacto;
- compatibilidade;
- possibilidade de substituição;
- qualidade da documentação;
- necessidade real.

Dependências críticas devem possuir responsável, versão controlada e estratégia de atualização.

## 6. Dados

O desenho de dados deve considerar:

- finalidade;
- minimização;
- integridade;
- retenção;
- exclusão;
- auditoria;
- migração;
- backup;
- restauração;
- portabilidade;
- proteção contra acesso indevido.

Mudanças destrutivas exigem plano de migração e recuperação.

## 7. Erros e estados

Falhas são parte do sistema e devem ser projetadas.

A solução deve:

- distinguir erro técnico de mensagem para a pessoa usuária;
- preservar contexto quando possível;
- oferecer recuperação compreensível;
- evitar perda silenciosa de dados;
- registrar informação suficiente para diagnóstico sem expor dados sensíveis;
- comunicar carregamento, sucesso, falha e indisponibilidade de forma acessível.

## 8. Observabilidade

Sistemas operados pelo CIATA devem oferecer visibilidade proporcional ao risco por meio de:

- logs estruturados;
- métricas;
- auditoria;
- alertas;
- identificação de correlação;
- monitoramento de dependências;
- registros de implantação.

Observabilidade não deve se transformar em vigilância desnecessária.

## 9. Segurança

Aplicar defesa em profundidade:

- menor privilégio;
- validação de entrada;
- codificação segura de saída;
- autenticação e autorização explícitas;
- proteção de segredos;
- atualização de dependências;
- trilha de auditoria;
- limitação de abuso;
- tratamento seguro de arquivos;
- configuração segura por padrão.

Segurança não deve depender apenas da interface esconder uma ação.

## 10. Evolução

Arquiteturas mudam. Mudanças relevantes devem:

1. declarar o problema;
2. registrar restrições;
3. comparar alternativas;
4. analisar acessibilidade, segurança e operação;
5. documentar consequências;
6. possuir estratégia de migração;
7. preservar histórico por ADR, RFC ou SPEC.

## 11. Anti-padrões

Evitar:

- lógica de negócio duplicada em interfaces diferentes;
- estados globais sem controle;
- textos de interface codificados diretamente quando deveriam ser localizáveis;
- tratamento genérico que oculta erros;
- dependências adotadas apenas por tendência;
- microsserviços sem necessidade operacional;
- documentação que descreve uma arquitetura diferente da existente;
- testes que verificam apenas implementação interna;
- componentes visuais sem semântica desde a origem;
- contas pessoais como ponto único de operação.

## 12. Registro local

Cada produto deve manter sua arquitetura concreta perto do código e apontar para estes princípios compartilhados. Diferenças são permitidas quando justificadas pelo contexto e registradas de forma rastreável.