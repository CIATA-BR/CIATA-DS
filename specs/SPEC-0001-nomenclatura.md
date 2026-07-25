# SPEC-0001 — Nomenclatura

## Status

Proposta inicial.

## Objetivo

Definir nomes claros, previsíveis, localizáveis e sustentáveis para arquivos, diretórios, artefatos e documentos do CIATA-DS, sem transformar a nomenclatura interna em uma barreira para quem chega de fora.

## Princípio de linguagem clara

Os identificadores existem para organizar e localizar conhecimento. Eles não substituem nomes compreensíveis.

Na primeira ocorrência em documentos, interfaces, mensagens ou conversas públicas, apresente o nome por extenso e, quando útil, a sigla entre parênteses.

Exemplos:

- proposta de mudança (RFC);
- registro de decisão arquitetural (ADR);
- procedimento operacional (playbook);
- receita técnica (REC).

Evite frases formadas apenas por códigos, como “abra um RFC e aplique o PAT”. Prefira “abra uma proposta de mudança (RFC) e aplique o padrão de formulário PAT-0003”.

## Regras gerais

- arquivos universais mantêm nomes consolidados, como `README.md`, `LICENSE`, `CHANGELOG.md` e `CONTRIBUTING.md`;
- conteúdos institucionais usam português do Brasil;
- diretórios e arquivos usam letras minúsculas, sem acentos, sem espaços e com hífen entre palavras;
- nomes devem descrever conteúdo, variante, finalidade, dimensão e versão quando aplicável;
- siglas isoladas devem ser evitadas fora dos identificadores permanentes;
- o nome não pode depender de contexto visual para ser compreendido;
- títulos devem continuar claros quando lidos por leitor de tela, linha Braille, busca ou referência fora do repositório;
- termos técnicos em inglês só permanecem quando forem amplamente reconhecidos ou necessários para interoperabilidade, sempre acompanhados de explicação em português.

## Prefixos institucionais

| Prefixo | Nome por extenso | Finalidade |
| --- | --- | --- |
| SPEC | Especificação | Define uma regra estável. |
| ADR | Registro de decisão arquitetural | Explica uma decisão e suas consequências. |
| RFC | Proposta de mudança | Abre uma alteração relevante para discussão. |
| CHECK | Lista de verificação | Confirma critérios de qualidade. |
| PB | Procedimento operacional | Explica como executar um processo institucional. |
| PAT | Padrão de solução | Documenta uma solução recorrente e seus limites. |
| REC | Receita técnica | Mostra como implementar uma solução específica. |
| TMP | Modelo reutilizável | Fornece uma estrutura inicial editável. |
| BP | Blueprint de projeto | Reúne uma base completa para iniciar uma classe de projeto. |
| KB | Base de conhecimento | Registra dúvidas, diagnóstico e aprendizado acumulado. |

Novos prefixos exigem justificativa, definição pública e ausência de sobreposição com tipos existentes.

## Artefatos

Formato canônico:

```text
ciata-{categoria}-{tipo}-{variante}-{finalidade}-{dimensao}-{versao}.{ext}
```

Campos não aplicáveis podem ser omitidos sem quebrar a ordem dos demais.

## Exemplos

```text
ciata-logo-horizontal-colorido-fundo-claro-v1.0.0.svg
ciata-banner-github-organizacao-1280x640-v1.0.0.png
ciata-timbrado-oficio-a4-editavel-v1.0.0.docx
```

## Acessibilidade

O caminho, o título e o nome devem permitir que uma pessoa, inclusive usando leitor de tela ou linha Braille, reconheça o conteúdo sem abrir o arquivo.

Códigos não devem ser a única informação disponível em links, títulos ou listas.

## Exceções

Exceções técnicas devem ser documentadas no README da pasta ou em ADR específico.
