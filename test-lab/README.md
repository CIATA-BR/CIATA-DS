# CIATA Accessibility Test Lab

Laboratório estático para validação manual dos 22 componentes do CIATA Design System.

## Objetivo

Fornecer URLs estáveis e reproduzíveis para testes com teclado, leitores de tela, zoom, contraste, text scaling e demais recursos de tecnologia assistiva antes de qualquer promoção de `experimental` para `stable`.

## Fluxo de teste

1. Abra a página do componente.
2. Execute o fluxo somente com teclado ou gestos nativos.
3. Repita com o recurso de tecnologia assistiva relevante.
4. Consulte `components/<componente>/spec.md` e `validation-matrix.md`.
5. Registre: componente, plataforma, recurso de tecnologia assistiva e versão, navegador/app e versão, sistema operacional, cenário, resultado, observações e passos para reproduzir.

## Critério de status

A existência de uma página neste laboratório não torna o componente estável. O laboratório é uma superfície de teste. A promoção depende de evidência manual real prevista no ciclo de vida do CIATA-DS.

## GitHub Pages

O workflow `.github/workflows/test-lab-pages.yml` publica apenas o diretório `test-lab/` no GitHub Pages quando há alteração relevante em `main`.

Caso seja a primeira publicação do repositório, pode ser necessário selecionar **GitHub Actions** como fonte em **Settings > Pages > Build and deployment > Source**.
