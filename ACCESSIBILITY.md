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

A validação combina:

1. revisão durante a concepção;
2. verificação automática como apoio;
3. inspeção técnica;
4. teste manual por teclado;
5. teste com tecnologias assistivas;
6. revisão por pessoas com deficiência sempre que possível.

Automação não substitui validação humana.

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

## Registro de resultados

Cada revisão deve informar:

- tecnologia assistiva e versão;
- sistema operacional e versão;
- navegador ou aplicativo;
- cenário testado;
- resultado;
- barreiras encontradas;
- responsável e data.

## Critério de bloqueio

Uma barreira que impeça acesso, compreensão, operação, recuperação de erro ou privacidade bloqueia a publicação até ser corrigida ou formalmente tratada pela governança.

## Relato de barreiras

Barreiras devem ser registradas em Issue com passos para reprodução, impacto, ambiente e evidências que não exponham dados pessoais.
