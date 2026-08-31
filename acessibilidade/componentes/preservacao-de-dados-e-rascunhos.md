# Preservação de dados e rascunhos

## Objetivo

Reduzir perda de trabalho em formulários e jornadas longas, inclusive após interrupções, navegação acidental ou falhas técnicas.

## Regras

- preservar dados preenchidos durante erros recuperáveis e navegação interna quando apropriado;
- informar quando houver salvamento automático ou rascunho disponível;
- não exigir percepção visual contínua para saber que o conteúdo foi salvo;
- permitir retomar rascunho com contexto suficiente para reconhecer o ponto interrompido;
- distinguir rascunho local de conteúdo efetivamente enviado ou confirmado;
- proteger dados sensíveis conforme o risco e o contexto;
- permitir descartar rascunho de forma intencional e previsível.

## Exemplo conforme

Em um cadastro longo, a interface informa de forma discreta e acessível “Rascunho salvo”. Ao retornar depois, oferece “Continuar cadastro” e apresenta a etapa e os dados já preservados.

## Comportamento esperado

A pessoa entende o que foi salvo, onde a jornada será retomada e o que ainda precisa ser concluído, sem depender apenas de indicador visual.

## Exemplo não conforme

Ao voltar uma tela ou após expirar uma requisição, todos os campos são apagados sem aviso e não existe rascunho.

## Por que falha

A perda silenciosa de dados aumenta carga cognitiva, esforço e risco de abandono, especialmente em jornadas extensas.

## Testes mínimos

- interromper a jornada em diferentes etapas;
- validar persistência após erro recuperável e retorno posterior;
- verificar anúncio de salvamento sem excesso de live regions;
- confirmar distinção entre rascunho e envio concluído;
- testar descarte e retomada com teclado e leitor de tela.
