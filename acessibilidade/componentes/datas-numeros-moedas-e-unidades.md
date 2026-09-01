# Datas, números, moedas e unidades

## Objetivo

Garantir que valores localizados sejam apresentados e anunciados de forma inequívoca, sem depender de convenções visuais implícitas.

## Regras

- formatar datas, horas, números, moedas e unidades conforme locale da experiência;
- evitar datas numéricas ambíguas como `03/04/2026` quando o contexto internacional puder gerar dúvida;
- expor unidade junto ao valor quando ela for necessária para compreensão;
- não depender apenas de separadores visuais para distinguir milhares e decimais;
- em valores críticos, considerar forma textual mais explícita para reduzir ambiguidade;
- preservar o mesmo valor semântico entre texto visível e nome/descrição acessível.

## Exemplo conforme

```html
<p>Vencimento: <time datetime="2026-09-05">5 de setembro de 2026</time></p>
<p>Valor: R$ 1.250,50</p>
```

## Comportamento esperado

A pessoa entende data e valor sem precisar inferir formato regional, posição de símbolos ou separadores.

## Exemplo não conforme

```html
<p>Vencimento: 05/09/26</p>
<p>Total: 1.250,50</p>
```

## Por que falha

O significado pode mudar conforme idioma, país ou configuração regional, especialmente em jornadas financeiras, administrativas e de agenda.

## Testes mínimos

- datas e horas;
- números decimais;
- moedas;
- unidades;
- leitura por leitor de tela em pelo menos dois locales quando o produto for multilíngue.
