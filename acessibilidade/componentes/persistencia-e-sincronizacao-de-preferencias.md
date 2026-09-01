# Persistência e sincronização de preferências

## Contrato

Preferências de acessibilidade e personalização devem permanecer previsíveis entre sessões e dispositivos quando o produto oferecer persistência ou sincronização.

## Regras

- informar quando uma preferência é local, vinculada à conta ou sincronizada;
- não redefinir preferências sem motivo claro;
- aplicar mudanças sem deslocar foco ou perder contexto;
- permitir restaurar valores padrão;
- evitar que sincronização sobrescreva silenciosamente uma escolha recente;
- não exigir autenticação adicional desnecessária apenas para usar preferências locais;
- preservar acessibilidade do próprio painel de preferências.

## Web

Persistência local e preferências de conta devem ter comportamento distinguível. Mudanças entre dispositivos precisam evitar conflitos silenciosos.

## Android

Respeitar configurações do sistema e preferências do app. Se houver sincronização, manter resultado previsível após reinstalação ou troca de dispositivo quando tecnicamente suportado.

## iOS

Distinguir preferências herdadas do sistema das específicas do produto e garantir que a sincronização não contradiga configurações de acessibilidade do dispositivo.

## Exemplo conforme

A pessoa ativa uma preferência de alto contraste no produto. A interface informa que ela será salva na conta e mantém a escolha na próxima sessão sem mover foco durante a aplicação.

## Exemplo não conforme

A preferência volta ao padrão em cada login e não há indicação de que a configuração não seria persistida.

## Por que falha

A pessoa precisa reconstruir continuamente uma configuração necessária para usar o produto, aumentando esforço e risco de erro.

## Critérios de teste

- escopo da preferência é compreensível;
- persistência corresponde ao que foi informado;
- aplicação não rouba foco;
- restauração ao padrão é acessível;
- conflitos de sincronização não são silenciosos;
- preferências do sistema continuam respeitadas.
