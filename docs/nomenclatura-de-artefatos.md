# Nomenclatura de artefatos

Este documento define como nomear arquivos e pastas do CIATA Design System para que qualquer pessoa encontre o recurso correto pelo caminho e pelo nome, sem depender de inspeção visual, reconhecimento de imagem ou ferramentas de descrição.

## Princípios

1. O nome deve explicar o que o arquivo é.
2. O caminho deve explicar onde ele pertence.
3. Não usar nomes vagos como `final`, `novo`, `arte`, `imagem1`, `logo2` ou `versao-certa`.
4. Usar português do Brasil nos ativos institucionais.
5. Usar letras minúsculas, números e hífens.
6. Não usar espaços, acentos, cedilha ou caracteres especiais.
7. Informar variante, finalidade, formato lógico e dimensão quando isso diferenciar o artefato.
8. A versão deve aparecer apenas quando houver necessidade real de manter versões simultâneas.

## Estrutura de nome

```text
ciata-{categoria}-{tipo}-{variante}-{finalidade}-{dimensao}-{versao}.{extensao}
```

Nem todos os campos são obrigatórios. O nome deve ser completo sem ficar redundante.

## Exemplos corretos

```text
ciata-logo-horizontal-colorido-fundo-claro.svg
ciata-logo-horizontal-negativo-fundo-escuro.svg
ciata-logo-vertical-monocromatico-preto.png
ciata-simbolo-colorido-512x512.png
ciata-favicon-32x32.png
ciata-banner-github-organizacao-1280x640.png
ciata-capa-linkedin-institucional-1128x191.png
ciata-timbrado-oficio-a4-editavel.docx
ciata-timbrado-oficio-a4-final.pdf
ciata-certificado-participacao-a4-paisagem-editavel.docx
```

## Exemplos proibidos

```text
logo-final.png
logo-novo-2.png
arte-canva.png
imagem1.jpg
certificado-certo.docx
banner-atualizado-final-agora-vai.png
```

## Vocabulário oficial

### Variantes de marca

```text
horizontal
vertical
simbolo
colorido
monocromatico
negativo
positivo
fundo-claro
fundo-escuro
```

### Estado do arquivo

```text
editavel
final
impressao
web
```

### Orientação

```text
retrato
paisagem
quadrado
```

### Plataformas e destinos

```text
github
facebook
instagram
linkedin
youtube
x
android
ios
windows
web
```

## Regras por formato

### SVG

Usar para vetores oficiais, ícones e logotipos escaláveis.

### PNG

Usar quando transparência ou dimensões específicas forem necessárias. Incluir dimensão no nome quando houver múltiplos tamanhos.

### JPG

Usar apenas para fotografias ou composições sem transparência.

### PDF

Usar para versões finais, impressão e documentos de distribuição.

### DOCX, PPTX e outros editáveis

Incluir `editavel` no nome.

## Versões

Quando necessário, utilizar versão semântica:

```text
ciata-manual-de-marca-v1.0.0.pdf
ciata-template-apresentacao-institucional-v1.1.0.pptx
```

Não utilizar datas como substituto de versão, salvo em materiais cuja data faça parte da identidade do conteúdo, como relatórios anuais.

## Regra de reconhecimento imediato

Ao ouvir somente o caminho e o nome do arquivo, uma pessoa deve conseguir responder:

- o que é;
- qual variante contém;
- para qual finalidade serve;
- em qual plataforma ou contexto deve ser usado;
- se é editável ou final;
- qual é sua dimensão, quando aplicável.

Se alguma dessas respostas essenciais depender de abrir o arquivo, o nome deve ser melhorado.
