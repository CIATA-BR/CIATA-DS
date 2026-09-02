# RFC-0003 — Arquitetura de componentes multiplataforma

## Status

Rascunho.

## Resumo em linguagem simples

O CIATA-DS já possui princípios, acessibilidade, tokens e governança. O próximo passo é permitir que produtos CIATA reutilizem componentes de interface sem recriar comportamento, acessibilidade e identidade em cada projeto.

Esta RFC propõe separar cada componente em duas camadas:

1. uma especificação canônica, independente de linguagem ou framework;
2. implementações nativas por plataforma, todas obrigadas a cumprir o mesmo contrato.

O objetivo não é compartilhar o mesmo código entre plataformas, mas compartilhar a mesma intenção, comportamento, acessibilidade e critérios de aceite.

## Problema

Projetos web, Laravel/PHP, Android/Kotlin, iOS/Swift, Flutter e Python desktop podem implementar controles visualmente parecidos, mas divergentes em foco, estados, semântica, teclado, leitor de tela, tamanho de alvo, mensagens e uso de tokens.

Sem um contrato canônico, o nome "Button" não garante o mesmo comportamento entre plataformas.

## Princípios

- componentes devem preferir controles nativos e semântica nativa;
- mesma função não significa mesmo código;
- tokens e comportamento são compartilhados, implementação é específica da plataforma;
- acessibilidade faz parte do contrato funcional do componente;
- automação complementa, mas não substitui validação humana com tecnologias assistivas;
- um componente só é considerado suportado em uma plataforma quando possui implementação, documentação e evidências de teste;
- plataformas sem consumidor real não precisam receber implementação antecipada;
- mudanças incompatíveis seguem versionamento e depreciação explícitos.

## Estrutura proposta

```text
components/
  README.md
  button/
    spec.md
    web/
    laravel/
    android/
    ios/
    flutter/
    python/
    tests/
```

Diretórios de implementação podem ser adicionados apenas quando houver consumidor real.

## Especificação canônica

Cada componente deve documentar, no mínimo:

- propósito e quando usar;
- quando não usar;
- anatomia;
- variantes;
- propriedades conceituais;
- estados;
- comportamento de interação;
- foco e ordem de foco;
- teclado e equivalentes por plataforma;
- semântica e nome acessível;
- comportamento esperado com leitor de tela;
- target size e geometria;
- conteúdo e linguagem clara;
- tokens utilizados;
- tema claro/escuro/sistema;
- loading, erro, disabled e demais estados aplicáveis;
- exemplos conformes e não conformes;
- testes automáticos possíveis;
- testes manuais obrigatórios;
- critérios de aceite.

## Plataformas iniciais

A primeira onda de suporte deve priorizar consumidores reais:

- Web HTML/CSS/JavaScript;
- Laravel/PHP por meio de componentes Blade que produzam HTML nativo;
- Android com Kotlin/Jetpack Compose e APIs nativas quando aplicável;
- iOS com SwiftUI/UIKit conforme o contexto;
- Flutter usando widgets e semântica nativos;
- Python desktop para o CIATA - Games, preservando APIs de acessibilidade do toolkit utilizado.

Java puro, React e outras plataformas podem ser adicionados quando existir demanda concreta.

## Regra de implementação nativa

Um componente do CIATA-DS não deve recriar primitivas nativas sem necessidade.

Exemplos:

- Web: botão deve resultar em `<button>` quando a função é de botão;
- Android: preferir controles Compose/Android com semântica nativa;
- iOS: preferir Button/controles UIKit ou SwiftUI equivalentes;
- Flutter: preferir widgets interativos nativos do framework;
- Python desktop: usar o controle nativo do toolkit adotado sempre que ele expuser corretamente nome, papel, estado e foco às APIs de acessibilidade.

## Contrato comum

Implementações diferentes devem preservar o mesmo contrato observável pela pessoa usuária:

- mesma finalidade;
- mesmas variantes funcionais;
- estados equivalentes;
- feedback equivalente;
- foco previsível;
- nome, papel e estado corretamente expostos;
- tamanho de interação compatível com os tokens e regras do CIATA-DS;
- funcionamento com teclado quando a plataforma possuir teclado;
- ausência de dependência exclusiva de cor, gesto complexo ou informação visual.

## APIs específicas por plataforma

A API de programação não precisa ser idêntica.

Exemplo conceitual:

```html
<button>Salvar</button>
```

```php
<x-ciata-button variant="primary">Salvar</x-ciata-button>
```

```kotlin
CiataButton(text = "Salvar", onClick = { /* ... */ })
```

```swift
CiataButton("Salvar") { /* ... */ }
```

```dart
CiataButton(label: 'Salvar', onPressed: () {})
```

```python
CiataButton(parent, label="Salvar", command=salvar)
```

O importante é que todas as APIs produzam o comportamento estabelecido pela especificação canônica.

## Testes de conformidade

Cada implementação deve possuir uma matriz comum de casos de teste. Quando aplicável:

- renderização básica;
- acionamento;
- foco visível;
- teclado;
- disabled;
- loading;
- nome acessível;
- papel e estado;
- contraste;
- tamanho mínimo de interação;
- zoom ou escalabilidade;
- tema claro e escuro;
- retorno de foco quando aplicável.

Além da automação, a aprovação de componentes interativos exige validação humana em combinações relevantes de navegador, sistema operacional e tecnologia assistiva.

## Primeiro componente piloto

O primeiro componente proposto é `CMP-0001 — Button / Botão`.

Ele foi escolhido por exercitar simultaneamente:

- tokens de cor, tipografia, espaçamento, raio e dimensão;
- foco;
- hover/pressed quando aplicáveis;
- disabled;
- loading;
- ícones;
- nome acessível;
- teclado e toque;
- tema claro/escuro;
- comportamento multiplataforma.

## Ordem inicial sugerida

Após Button:

1. TextField/Input;
2. Checkbox;
3. Radio;
4. Select/Combobox;
5. Link;
6. Alert/Status message;
7. Dialog/Modal;
8. Progress/Loading;
9. Card interativo;
10. Paginação;
11. Toast/feedback temporário.

## Compatibilidade e versionamento

A especificação canônica é a fonte de verdade do comportamento.

Alterações que removem propriedade, estado ou comportamento suportado exigem análise de compatibilidade e ciclo de depreciação. Implementações de plataforma devem declarar a versão da especificação que atendem.

## Critérios de aceite

- [ ] catálogo `components/` criado;
- [ ] modelo mínimo de especificação definido;
- [ ] plataformas iniciais e regra de adoção por demanda documentadas;
- [ ] regra de implementação nativa documentada;
- [ ] matriz mínima de testes de conformidade definida;
- [ ] `CMP-0001 — Button` criado como componente piloto;
- [ ] acessibilidade tratada como parte do contrato funcional;
- [ ] estratégia de versionamento/depreciação documentada.

## Plano de implementação

1. Aprovar esta RFC.
2. Refinar e aprovar a especificação canônica do Button.
3. Implementar primeiro Web/Laravel, Android, iOS, Flutter e Python conforme consumidores reais.
4. Criar testes de conformidade por plataforma.
5. Validar manualmente com tecnologias assistivas.
6. Somente depois promover o componente de experimental para estável.

## Riscos

O principal risco é tentar uniformizar excessivamente plataformas diferentes e, com isso, substituir controles nativos por componentes customizados menos acessíveis. Esta RFC evita esse risco ao padronizar comportamento e intenção, não código ou aparência pixel a pixel.

## Decisão

A preencher pela equipe mantenedora do CIATA-DS.
