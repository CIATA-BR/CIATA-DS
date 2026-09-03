# Componentes do CIATA-DS

Esta pasta reúne as especificações canônicas e, quando existirem, as implementações de componentes reutilizáveis do CIATA-DS.

## Regra central

O CIATA-DS padroniza comportamento, acessibilidade, intenção visual e critérios de aceite. Cada plataforma deve preferir sua implementação nativa em vez de reproduzir o mesmo código em todos os ambientes.

## Status possíveis

- `rascunho` — especificação em elaboração;
- `experimental` — contrato aprovado, implementação ainda em validação;
- `estável` — contrato e implementações suportadas validadas;
- `depreciado` — não recomendado para novos usos e com plano de migração documentado.

## Catálogo inicial

| Código | Componente | Status | Plataformas iniciais |
| --- | --- | --- | --- |
| CMP-0001 | Button / Botão | rascunho | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0002 | TextField / Campo de texto | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0003 | Checkbox / Caixa de seleção | rascunho | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0004 | Radio / Botão de opção | rascunho | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0005 | Select / Combobox | rascunho | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0006 | Link / Link de navegação | rascunho | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0007 | Alert / Status | rascunho | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0008 | Modal / Dialog | rascunho | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0009 | Loading / Progress | rascunho | Web, Laravel, Android, iOS, Flutter, Python |

## Estrutura por componente

Cada componente deve possuir `spec.md` como fonte canônica de comportamento. Diretórios de plataforma são adicionados quando houver implementação real.

```text
components/<componente>/
  spec.md
  web/
  laravel/
  android/
  ios/
  flutter/
  python/
  tests/
```

## Critério de suporte

A presença de um nome de plataforma na especificação não significa que a implementação já exista. Uma plataforma só é considerada suportada quando houver código, documentação, testes e evidência de validação compatíveis com o contrato canônico.

## Acessibilidade

Acessibilidade faz parte do comportamento funcional do componente. Nome, papel, estado, foco, acionamento, teclado, feedback, contraste, target size e compatibilidade com tecnologias assistivas devem ser definidos e testados quando aplicáveis.
