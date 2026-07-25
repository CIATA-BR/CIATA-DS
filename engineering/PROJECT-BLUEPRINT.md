# Blueprint para novos projetos

Este documento define a base mínima para iniciar, herdar ou reorganizar um projeto do ecossistema CIATA.

O blueprint é um ponto de partida. Ele deve ser adaptado ao risco, ao tamanho e à tecnologia do produto sem enfraquecer os compromissos institucionais.

## 1. Identidade do projeto

Antes da implementação, registrar:

- nome oficial;
- problema que será enfrentado;
- público e pessoas afetadas;
- responsável institucional;
- estágio atual;
- repositório e canais oficiais;
- licença;
- dados tratados;
- tecnologias previstas;
- integrações externas;
- riscos iniciais.

## 2. Perguntas obrigatórias

Todo projeto deve conseguir responder:

1. Que necessidade humana ou institucional justifica sua existência?
2. Quem pode ser excluído pela solução proposta?
3. Quais barreiras de acessibilidade são previsíveis?
4. Quais dados pessoais, sensíveis ou confidenciais serão tratados?
5. O que acontece quando a solução falha?
6. Quais partes precisam funcionar sem intervenção manual?
7. O que será reutilizado do ecossistema CIATA?
8. Que conhecimento precisa permanecer documentado?
9. Como o projeto será testado e operado?
10. Como será encerrado ou transferido no futuro?

## 3. Estrutura documental mínima

Projetos ativos devem manter, conforme aplicável:

```text
README.md
LICENSE
CHANGELOG.md
ROADMAP.md
docs/
  architecture/
  decisions/
  accessibility/
  testing/
  operations/
```

Arquivos equivalentes podem usar outra organização quando a tecnologia exigir, desde que a navegação permaneça clara.

## 4. Conteúdo mínimo do README

O README deve informar:

- o que é o projeto;
- qual problema resolve;
- estado de maturidade;
- público principal;
- tecnologias centrais;
- como instalar ou executar;
- como testar;
- como contribuir;
- requisitos de acessibilidade relevantes;
- links para documentação detalhada;
- licença e contato institucional.

Não usar badges, imagens ou tabelas como única forma de transmitir informação essencial.

## 5. Arquitetura e decisões

O projeto deve registrar:

- contexto e limites do sistema;
- principais componentes;
- fluxo de dados;
- dependências externas;
- estratégia de autenticação e autorização;
- tratamento de erros;
- observabilidade;
- riscos de segurança e privacidade;
- decisões arquiteturais relevantes.

Decisões locais usam ADR. Mudanças amplas ou abertas a debate podem usar RFC. Requisitos normativos aprovados podem usar SPEC.

## 6. Acessibilidade

A acessibilidade deve aparecer em:

- requisitos;
- arquitetura;
- design;
- critérios de aceite;
- testes;
- documentação;
- revisão de release.

O plano deve considerar, conforme a plataforma:

- leitores de tela;
- teclado e foco;
- Braille;
- ampliação e redimensionamento;
- contraste;
- linguagem clara;
- mensagens de erro;
- localização;
- alternativas a imagens, áudio, cor, gestos e movimento;
- comportamento com recursos automáticos de reconhecimento de texto e imagens.

## 7. Qualidade

Definir antes da primeira entrega:

- tipos de teste necessários;
- critérios de aceite;
- ambientes suportados;
- ferramentas automáticas;
- testes manuais;
- tecnologias assistivas usadas na validação;
- política para regressões;
- responsáveis por revisão.

Teste automático apoia, mas não substitui validação humana em cenários críticos.

## 8. Segurança e privacidade

O projeto deve documentar:

- dados coletados e finalidade;
- base e tempo de retenção;
- controle de acesso;
- segredos e credenciais;
- logs e auditoria;
- dependências externas;
- processo de atualização;
- resposta a vulnerabilidades;
- procedimento de exclusão ou exportação quando aplicável.

Nunca armazenar segredos reais em exemplos, documentação, issues ou código versionado.

## 9. Integração contínua

Quando houver código executável, a automação deve verificar ao menos o que for aplicável:

- compilação ou validação sintática;
- testes;
- lint e formatação;
- dependências vulneráveis;
- links e documentação;
- artefatos de release;
- regras específicas de acessibilidade que possam ser automatizadas.

Falhas críticas não devem ser convertidas em avisos apenas para permitir a integração.

## 10. Operação e continuidade

Antes de produção, registrar:

- ambientes;
- configuração;
- implantação;
- backup e restauração;
- monitoramento;
- logs;
- alertas;
- responsáveis;
- procedimento de incidente;
- reversão;
- dependências humanas críticas.

O projeto não deve depender exclusivamente da memória, da máquina ou da conta pessoal de uma única pessoa.

## 11. Uso de inteligência artificial

Agentes de IA podem apoiar análise, documentação, implementação, testes e revisão quando:

- recebem contexto suficiente;
- usam fontes canônicas;
- respeitam limites de acesso;
- não recebem segredos desnecessários;
- produzem alterações rastreáveis;
- passam por revisão proporcional ao impacto.

A responsabilidade final permanece humana e institucional.

## 12. Critério de prontidão

Um projeto pode iniciar implementação quando houver clareza suficiente sobre:

- problema e público;
- escopo inicial;
- riscos;
- dados;
- acessibilidade;
- arquitetura de alto nível;
- estratégia de qualidade;
- responsáveis;
- documentação mínima.

Não é necessário prever tudo. É necessário tornar explícito o que já se sabe, o que ainda é hipótese e o que precisa ser decidido.