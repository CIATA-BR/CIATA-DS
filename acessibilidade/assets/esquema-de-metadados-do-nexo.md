# Esquema de metadados do Nexo

Cada asset do Nexo deve possuir metadados suficientes para responder: o que é, para que serve, onde pode ser usado, qual seu estado de aprovação e como deve ser tratado em acessibilidade.

## Campos obrigatórios

- `id`: identificador estável e único;
- `arquivo`: caminho relativo no repositório;
- `versao_identidade`: versão do Nexo usada no asset;
- `estado`: neutro, orientação, sucesso, atenção, erro, vazio, carregamento, conclusão ou outro estado documentado;
- `finalidade`: função principal do asset;
- `status`: rascunho, aprovado, canonico, depreciado ou arquivado;
- `classificacao`: decorativo, informativo, funcional ou complexo;
- `fundo`: transparente, claro, escuro ou específico;
- `texto_embutido`: sim ou não;
- `descricao_curta`: descrição objetiva da informação visual relevante;
- `uso_recomendado`: principais contextos ou jornadas;
- `origem`: geração, edição, fotografia, ilustração manual ou outro processo;
- `data_aprovacao`: data da aprovação humana, quando aplicável.

## Campos recomendados

- `plataformas`: Web, Android, iOS, apresentação, social, impressão;
- `tema`: claro, escuro, alto contraste ou independente;
- `movimento`: estático, animado, reduzido;
- `descricao_longa`: quando o asset for complexo;
- `referencia_canonica`: asset usado como base visual;
- `substitui`: id de asset anterior, quando houver;
- `observacoes`: decisões, limitações ou contexto de uso;
- `hash_arquivo`: hash criptográfico para detectar duplicidade exata;
- `hash_perceptual`: hash visual para apoiar detecção de quase duplicidade.

## Exemplo

```yaml
id: nexo-orientacao-apontando-v1
arquivo: imagens/institucional/Nexo_apresentando_apontando.png
versao_identidade: "1.0"
estado: orientacao
finalidade: indicar uma direção, ação ou conteúdo
status: aprovado
classificacao: informativo
fundo: transparente
texto_embutido: nao
descricao_curta: Nexo sorridente, com uma mão aberta e a outra apontando.
uso_recomendado:
  - onboarding
  - ajuda contextual
  - apresentacoes
origem: geracao assistida por IA
referencia_canonica: imagens/institucional/Nexo_acolhedor_oficial.png
```

## Regras

- metadados não transformam automaticamente um asset em conteúdo acessível;
- texto alternativo deve considerar o contexto real de uso, não apenas a descrição de catálogo;
- quando o asset for decorativo, a implementação deve permitir que ele seja ignorado por tecnologias assistivas;
- imagens com texto embutido não devem ser usadas como única fonte de informação essencial;
- mudanças nos elementos invariáveis do Nexo exigem nova versão de identidade, não apenas novo estado.
