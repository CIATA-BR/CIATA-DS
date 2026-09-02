# Button — Android / Jetpack Compose

Implementação experimental do `CMP-0001 — Button / Botão` para Android com Jetpack Compose e Material 3.

## Princípios

- usa `Button`, `OutlinedButton` e `TextButton` nativos do Material 3;
- preserva semântica, foco, acionamento e integração com TalkBack da plataforma;
- mantém o texto da ação durante `loading`;
- expõe `stateDescription` para comunicar processamento sem transformar loading em disabled;
- bloqueia acionamentos repetidos durante `loading` sem remover o controle da navegação;
- usa 48 dp como dimensão mínima, respeitando a convenção Android e superando o padrão-base CIATA de 44 unidades lógicas;
- usa `MaterialTheme.colorScheme.error/onError` para a variante destrutiva em vez de cores literais locais.

## Variantes

- `Primary` → `Button`;
- `Secondary` → `OutlinedButton`;
- `Danger` → `Button` com tokens semânticos de erro do tema;
- `Ghost` → `TextButton`.

A escolha do componente Material não altera o contrato funcional definido em `components/button/spec.md`.

## Exemplo

```kotlin
CiataButton(
    label = "Salvar alterações",
    onClick = { salvar() },
    loading = salvando,
)
```

Ações destrutivas:

```kotlin
CiataButton(
    label = "Excluir conta",
    variant = CiataButtonVariant.Danger,
    onClick = { solicitarConfirmacao() },
)
```

A variante `Danger` não substitui confirmação, desfazer ou outro mecanismo proporcional ao risco.

## Loading

`loading=true` não equivale a `enabled=false`.

Durante loading:

- o botão permanece semanticamente disponível e localizável;
- novos acionamentos são ignorados para prevenir duplicidade;
- o texto original permanece visível e acessível;
- um indicador de progresso é apresentado;
- `stateDescription` recebe, por padrão, `Processando`.

O texto de estado deve ser localizado pelo aplicativo consumidor.

## Ícones

Conteúdo visual adicional pode ser passado por `leadingContent`. Quando o ícone apenas repete o significado do texto, ele deve permanecer decorativo para acessibilidade. Botões somente com ícone não fazem parte desta primeira API e devem usar um componente especializado com nome acessível explícito.

## Tema e tokens

Esta implementação usa Material 3 como mecanismo de plataforma. A integração definitiva deverá mapear os tokens semânticos do CIATA-DS para `MaterialTheme.colorScheme`, tipografia, formas e dimensões, evitando valores de marca duplicados no componente.

## Validação antes de estabilidade

Validar em aplicativo real, no mínimo:

- TalkBack com navegação por toque e varredura;
- teclado físico/ChromeOS quando aplicável;
- foco e retorno de foco;
- `enabled=false`;
- `loading=true` e prevenção de acionamento duplicado;
- anúncio/compreensão de `stateDescription`;
- escalabilidade de fonte;
- tema claro e escuro;
- alto contraste/configurações de acessibilidade disponíveis;
- variantes Primary, Secondary, Danger e Ghost;
- 48 dp de área mínima de interação.

O componente permanece **experimental** até existirem evidências manuais suficientes.
