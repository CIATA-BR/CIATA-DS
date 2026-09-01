# Busca e filtros

## Contrato

Busca e filtros permitem localizar e reduzir conjuntos de conteúdo sem perder contexto, foco ou compreensão do resultado aplicado.

## Regras

- campo de busca deve possuir rótulo persistente e finalidade clara;
- botão de busca deve possuir nome de ação compreensível;
- filtros precisam expor nome, função, estado e relação com o conjunto afetado;
- quantidade de resultados ou alteração relevante deve ser comunicada sem roubar foco;
- filtros aplicados devem permanecer identificáveis e removíveis por teclado e tecnologia assistiva;
- não atualizar resultados a cada tecla quando isso interromper edição ou navegação sem necessidade;
- quando houver atualização automática, preservar foco e posição lógica;
- botão `Limpar filtros` deve indicar claramente o efeito e não apagar a consulta de busca se isso não fizer parte do contrato.

## Web

Preferir formulário de busca com label associado ao campo e controles nativos para filtros. Resultados atualizados dinamicamente podem usar uma região de status apropriada para informar quantidade ou conclusão da atualização, sem transformar toda a lista em live region.

## Android e iOS

Preservar foco no campo ou filtro acionado durante atualizações. Mudanças de resultado devem ser anunciadas de modo conciso, e controles selecionados devem expor estado pelo mecanismo semântico da plataforma.

## Exemplo conforme

```html
<form role="search">
  <label for="busca">Buscar vagas</label>
  <input id="busca" name="q" type="search">
  <button type="submit">Buscar</button>
</form>

<fieldset>
  <legend>Tipo de contratação</legend>
  <label><input type="checkbox" name="tipo" value="clt"> CLT</label>
  <label><input type="checkbox" name="tipo" value="pj"> PJ</label>
</fieldset>

<p role="status">18 vagas encontradas.</p>
```

## Comportamento esperado

A pessoa identifica o campo como `Buscar vagas`, seleciona filtros com estado perceptível e, após aplicar a busca, recebe uma informação equivalente a `18 vagas encontradas` sem perder o foco do controle utilizado.

## Exemplo não conforme

```html
<input placeholder="Buscar">
<div class="filtro ativo">CLT</div>
<div class="contador">18</div>
```

## Por que falha

O placeholder não substitui rótulo persistente, o filtro visual não expõe função ou estado e o número `18` não informa o que mudou. A atualização pode ser invisível para quem não acompanha a tela visualmente.

## Critérios de teste

- busca possui label persistente e botão com nome adequado;
- filtros expõem seleção e podem ser removidos sem ponteiro;
- resultados atualizados são anunciados sem mover foco indevidamente;
- navegação entre filtros e resultados permanece previsível;
- estado dos filtros não depende apenas de cor ou posição.