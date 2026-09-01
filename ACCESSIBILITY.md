# Acessibilidade no CIATA Design System

## Compromisso

A acessibilidade é requisito de projeto, critério de aceite e responsabilidade compartilhada. Nenhum artefato ou componente deve ser considerado concluído apenas porque parece correto visualmente ou passa em uma ferramenta automática.

## Requisitos gerais

Todo conteúdo aplicável deve:

- possuir estrutura semântica e ordem de leitura coerente;
- funcionar por teclado sem armadilhas de foco;
- oferecer nomes, funções, estados e instruções compreensíveis;
- ser compatível com leitores de tela e linhas Braille;
- manter contraste e legibilidade adequados;
- não depender exclusivamente de cor, posição, forma, som ou animação;
- oferecer alternativa textual equivalente para informação visual;
- permitir ampliação, redimensionamento e adaptação sem perda essencial;
- usar linguagem clara e consistente;
- evitar movimento, tempo ou interação desnecessariamente excludentes.

## Validação

O alvo padrão dos produtos digitais é WCAG 2.2 nos níveis A e AA. A [base canônica WCAG 2.2](acessibilidade/wcag-2.2/README.md) organiza critérios, testes, falhas e interfaces sem substituir o texto normativo do W3C.

A validação combina:

1. revisão durante a concepção;
2. verificação automática como apoio;
3. inspeção técnica;
4. teste manual por teclado;
5. teste com tecnologias assistivas;
6. revisão por pessoas com deficiência sempre que possível.

Automação não substitui validação humana.

Avaliações de produtos digitais devem considerar jornadas completas e uma amostra representativa de telas, estados e conteúdos. O escopo, a linha de base de suporte e as combinações de sistema, navegador, leitor de tela, teclado e Braille devem ser definidos antes da execução, conforme o [guia de validação multiplataforma](acessibilidade/validacao-multiplataforma.md).

## Artefatos visuais

Peças visuais devem registrar:

- finalidade e público;
- texto completo presente na imagem;
- descrição alternativa quando necessária;
- contraste dos elementos relevantes;
- fundos permitidos e proibidos;
- tamanho mínimo de uso;
- versão acessível equivalente quando o formato original não for suficiente.

## Documentos

Documentos devem usar títulos hierárquicos, listas reais, tabelas simples com cabeçalhos, idioma definido, links descritivos, ordem de leitura correta e texto alternativo significativo. O PDF não deve ser a única versão quando outro formato oferecer melhor acesso.

## Software

Componentes de interface devem nascer com semântica, foco, navegação por teclado, estados, mensagens de erro e rótulos localizáveis. Acessibilidade não deve ser adicionada como remendo após a lógica visual estar fechada.

Interfaces devem preservar dados, etapa, contexto e foco lógico durante rotação, redimensionamento, tela dividida, alternância de janela e recriação de visualizações. Aplicativos mobile devem ser testados também com teclado físico. Controles de texto customizados devem emitir a semântica e os eventos recomendados pela plataforma, preferindo componentes nativos quando eles atenderem à necessidade.

## Registro de resultados

Cada revisão deve informar:

- tecnologia assistiva e versão;
- sistema operacional e versão;
- navegador ou aplicativo;
- dispositivo, teclado ou linha Braille quando aplicável;
- cenário e jornada completa testados;
- resultado;
- barreiras encontradas;
- responsável e data.

## Critério de bloqueio

Uma barreira que impeça acesso, compreensão, operação, recuperação de erro ou privacidade bloqueia a publicação até ser corrigida ou formalmente tratada pela governança.

## Relato de barreiras

Barreiras devem ser registradas em Issue com passos para reprodução, impacto, ambiente e evidências que não exponham dados pessoais.
