# Ativos do Mascote CIATA

Este diretório reúne os ativos oficiais derivados da referência histórica do
Mascote CIATA.

## Referência oficial

A referência visual permanece, sem modificações, em:

```text
imagens/projetos/Comunica-CIATA/Logo-Comunica.png
```

Ela não deve ser movida, renomeada, sobrescrita nem editada. Novos ativos devem
preservar a identidade definida em [`docs/mascote/`](../../docs/mascote/README.md).

## Organização

- `poses/`: poses isoladas e reutilizáveis do personagem;
- `braille/`: atividades e tecnologias específicas de leitura e escrita Braille;
- `tecnologias/`: composições com diferentes tecnologias relacionadas ao Braille;
- `expressions/`: expressões faciais reutilizáveis;
- `accessories/`: acessórios oficiais;
- `scenes/`: composições completas para projetos e campanhas;
- `3d/`: futuros modelos, texturas e renderizações tridimensionais.

## Convenções

- nomes em inglês, com letras minúsculas e palavras separadas por hífen;
- prefixo obrigatório `mascot-`;
- arquivos derivados não substituem a referência oficial;
- cada imagem deve ter um arquivo Markdown de mesmo nome com metadados de
  acessibilidade, finalidade, idioma, origem e histórico;
- ativos experimentais ou ainda não aprovados não devem ser incluídos aqui.

## Formatos

- PNG para imagens rasterizadas;
- SVG para futuras ilustrações vetoriais aprovadas;
- Blender, STL, STEP e OBJ para futuros ativos tridimensionais.

## Histórico

### 2026-08-07

- gerados dez ativos do mascote para narrativa, Braille e tecnologias;
- todos os novos ativos permanecem com status `review` até validação humana;
- `mascot-braille-display.png` requer revisão do enquadramento do notebook;
- `mascot-perkins.png` requer revisão técnica da posição das mãos;
- removido o ativo experimental `mascot-welcome-wave` do pacote em revisão.

### 2026-08-06

- criada a estrutura oficial em `imagens/mascote/`;
- adicionada a pose institucional de boas-vindas e aceno;
- registrada a origem, a finalidade e a descrição acessível do ativo.
