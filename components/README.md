# Componentes do CIATA-DS

Esta pasta reúne as especificações canônicas e, quando existirem, as implementações de componentes reutilizáveis do CIATA-DS.

## Regra central

O CIATA-DS padroniza comportamento, acessibilidade, intenção visual e critérios de aceite. Cada plataforma deve preferir sua implementação nativa em vez de reproduzir o mesmo código em todos os ambientes.

## Status possíveis

- `rascunho` — especificação em elaboração;
- `experimental` — contrato aprovado, implementação ainda em validação;
- `estável` — contrato e implementações suportadas validadas;
- `depreciado` — não recomendado para novos usos e com plano de migração documentado.

A ordem operacional para validação manual e promoção está em [`validation-promotion-queue.md`](./validation-promotion-queue.md).

## Catálogo inicial

| Código | Componente | Status | Plataformas iniciais |
| --- | --- | --- | --- |
| CMP-0001 | Button / Botão | rascunho | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0002 | TextField / Campo de texto | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0003 | Checkbox / Caixa de seleção | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0004 | Radio / Botão de opção | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0005 | Select / Combobox | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0006 | Link / Link de navegação | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0007 | Alert / Status | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0008 | Modal / Dialog | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0009 | Loading / Progress | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0010 | Card interativo | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0011 | Pagination / Paginação | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0012 | Toast | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0013 | Tabs / Abas | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0014 | Accordion / Acordeão | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0015 | Menu | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0016 | Breadcrumb / Trilha de navegação | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0017 | Tooltip | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0018 | Bottom Sheet | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0019 | Date Picker / Seletor de data | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0020 | File Upload / Envio de arquivo | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0021 | Search / Busca | experimental | Web, Laravel, Android, iOS, Flutter, Python |
| CMP-0022 | Autocomplete | experimental | Web, Laravel, Android, iOS, Flutter, Python |

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
