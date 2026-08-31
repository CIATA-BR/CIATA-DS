# Idioma e pronúncia

## Objetivo

Garantir que conteúdo textual seja identificado no idioma correto e pronunciado de forma compreensível por leitores de tela e síntese de voz.

## Regras

- declarar o idioma principal da página, tela ou documento;
- identificar mudanças de idioma em trechos relevantes quando a plataforma oferecer suporte;
- evitar abreviações ambíguas quando a pronúncia puder comprometer compreensão;
- não usar grafias artificiais apenas para "forçar" pronúncia quando isso prejudicar leitura visual, busca ou tradução;
- validar nomes próprios, siglas e termos técnicos com leitores de tela representativos quando forem essenciais à jornada.

## Exemplo conforme

```html
<html lang="pt-BR">
<p>Leia a versão em <span lang="en">English</span>.</p>
```

## Comportamento esperado

O leitor de tela usa a voz e as regras de pronúncia adequadas para cada idioma sem exigir que a pessoa interprete uma pronúncia incorreta.

## Exemplo não conforme

```html
<html>
<p>Read the accessibility report.</p>
```

## Por que falha

Sem idioma programático, síntese de voz pode aplicar regras fonéticas incorretas e reduzir compreensão.

## Testes mínimos

- idioma principal;
- mudança de idioma em conteúdo essencial;
- siglas e termos técnicos;
- leitura com leitor de tela nas plataformas suportadas.
