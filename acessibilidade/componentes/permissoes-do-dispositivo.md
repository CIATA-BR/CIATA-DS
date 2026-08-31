# Permissões do dispositivo

## Objetivo

Solicitações de câmera, microfone, localização, fotos, arquivos, notificações, Bluetooth ou recursos semelhantes devem ser compreensíveis, previsíveis e operáveis com tecnologia assistiva.

## Regras

- explicar por que a permissão é necessária antes ou no momento adequado da solicitação;
- solicitar apenas quando o recurso for realmente usado, evitando pedidos antecipados sem contexto;
- não depender apenas do diálogo nativo do sistema para explicar consequência e finalidade;
- oferecer alternativa quando a permissão negada não torna a jornada essencialmente impossível;
- informar como continuar, tentar novamente ou abrir ajustes quando a permissão tiver sido negada permanentemente;
- não mover foco inesperadamente após aceitar ou negar;
- não repetir indefinidamente a mesma solicitação;
- manter o nome do recurso e a ação claros para leitor de tela.

## Exemplo conforme

Antes de abrir o seletor do sistema:

> Para anexar um comprovante, o aplicativo precisa acessar seus arquivos. Você também pode tirar uma foto usando a câmera.

Botões: **Selecionar arquivo** e **Usar câmera**.

### Comportamento esperado

A pessoa entende por que a permissão será solicitada, pode escolher uma alternativa e, depois da decisão do sistema, retorna ao fluxo sem perda de contexto.

## Exemplo não conforme

Ao entrar na tela, o aplicativo solicita câmera, microfone, localização e fotos sem explicar por quê. Se a pessoa negar câmera, a tela exibe apenas um ícone vermelho e bloqueia todo o restante.

### Por que falha

A solicitação é descontextualizada, aumenta carga cognitiva, pode bloquear funções não relacionadas e depende de percepção visual para explicar o estado.

## Testes mínimos

1. testar primeira solicitação, aceite e negação;
2. testar negação permanente e retorno a partir dos ajustes;
3. validar foco antes e depois do diálogo do sistema;
4. confirmar que leitor de tela identifica claramente ação, recurso e consequência;
5. verificar alternativas quando a permissão não é estritamente necessária para a jornada.
