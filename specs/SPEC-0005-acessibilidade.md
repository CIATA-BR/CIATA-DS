# SPEC-0005 — Acessibilidade

## Status

Proposta inicial.

## Objetivo

Estabelecer acessibilidade como requisito de concepção, produção, revisão, aceite, publicação e manutenção.

## Requisitos gerais

- nenhuma informação pode depender exclusivamente de cor, posição, forma, som ou movimento;
- textos devem ser claros, objetivos e compatíveis com ampliação;
- estruturas devem possuir hierarquia semântica coerente;
- nomes de arquivos, títulos, rótulos e descrições devem funcionar com leitores de tela e linhas Braille;
- interações digitais devem funcionar por teclado e tecnologias assistivas;
- foco, ordem de leitura e feedback devem ser previsíveis;
- imagens informativas exigem alternativa textual equivalente;
- animações e mídia devem respeitar preferências do usuário e oferecer controles acessíveis;
- mudanças de orientação, tamanho, janela ou processo não podem apagar dados, romper a jornada ou deslocar o foco sem necessidade;
- interfaces mobile devem ser operáveis por gestos acessíveis e teclado físico quando a plataforma permitir;
- controles customizados devem expor nome, função, estado, valor e eventos equivalentes aos controles nativos.

## Avaliação de produtos digitais

A avaliação deve:

- definir escopo, versão, objetivo e linha de base de suporte;
- explorar telas, estados, tecnologias e funções essenciais;
- selecionar amostra representativa;
- testar jornadas completas, inclusive erros, interrupções e retomadas;
- registrar combinações de sistema, navegador, leitor de tela, teclado e Braille;
- distinguir requisito normativo, orientação técnica e recurso experimental.

O processo segue o [guia de validação multiplataforma](../acessibilidade/validacao-multiplataforma.md), alinhado ao WCAG-EM 2.0.

## Validação

Automação é complementar. Entregas aplicáveis exigem avaliação manual com pessoas e tecnologias assistivas.

## Evidências

A aprovação deve registrar:

- escopo e versão testados;
- tecnologia assistiva e ambiente utilizados;
- dispositivo, teclado e linha Braille quando aplicáveis;
- jornadas e mudanças de contexto executadas;
- pessoa responsável;
- problemas encontrados;
- correções ou exceções aceitas.

## Critério de conclusão

Um artefato ou componente não é considerado concluído quando barreiras conhecidas impedem acesso equivalente, salvo exceção formalmente documentada, temporária e acompanhada de plano de correção.

## Princípio

Acessibilidade não é decoração acrescentada ao final. Ela integra a arquitetura da entrega.
