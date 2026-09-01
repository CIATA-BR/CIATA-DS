# Conformidade contínua e monitoramento

## Contrato

Acessibilidade não termina no release. Mudanças de produto, dependências, navegadores, sistemas operacionais, leitores de tela e padrões podem alterar o comportamento depois da entrega.

## Regras

- monitorar mudanças relevantes em padrões e plataformas que possam afetar componentes do Design System;
- revisar componentes quando houver alteração material em semântica, foco, teclado, gestos, conteúdo dinâmico ou suporte de tecnologia assistiva;
- priorizar regressões observadas em produção e mudanças de alto impacto;
- manter uma matriz de plataformas e tecnologias assistivas representativas do uso real;
- transformar mudanças relevantes em issue, atualização documental ou reteste, conforme o impacto;
- evitar retrabalho por atualização meramente editorial sem efeito funcional;
- registrar quando uma recomendação ainda depende de suporte incompleto de navegador ou plataforma;
- não considerar um componente permanentemente conforme apenas porque foi aprovado em uma versão anterior.

## Gatilhos de revisão

- atualização de WCAG, ARIA ou orientação normativa relevante;
- mudança de comportamento em navegador, Android, iOS ou Windows;
- atualização significativa de leitor de tela;
- alteração de componente base ou biblioteca de UI;
- regressão reportada por pessoa usuária;
- incidente em jornada crítica;
- mudança relevante de conteúdo, foco ou interação.

## Exemplo conforme

Uma atualização de navegador altera o comportamento de um componente composto. A equipe registra o impacto, retesta o componente com teclado e leitor de tela e atualiza a documentação quando necessário.

## Exemplo não conforme

O componente continua marcado como conforme por anos, sem reteste, mesmo após mudanças de plataforma que alteraram sua navegação por teclado.

## Por que falha

Conformidade histórica não garante comportamento atual. A interface pode regredir sem alteração direta no código do produto.

## Critérios de teste

- existem gatilhos claros de revisão;
- mudanças materiais geram ação rastreável;
- matriz de teste é revisada periodicamente;
- dependências de suporte são documentadas;
- regressões em produção retornam ao ciclo de correção e reteste.
