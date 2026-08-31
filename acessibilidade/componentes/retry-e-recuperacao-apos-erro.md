# Retry e recuperação após erro

## Objetivo

Permitir recuperação previsível após falhas temporárias sem obrigar a pessoa a reconstruir a jornada ou repetir trabalho desnecessário.

## Regras

- oferecer retry quando a operação puder ser repetida com segurança;
- distinguir erro temporário de erro de validação ou regra de negócio;
- preservar valores, seleção e posição de contexto sempre que possível;
- evitar duplicar operações críticas quando retry for acionado;
- comunicar sucesso, nova falha ou impossibilidade de continuar;
- não mover foco automaticamente para o topo sem necessidade;
- quando a recuperação exigir outra ação, explicar claramente o próximo passo.

## Exemplo conforme

Após falha temporária ao salvar, a interface informa “Não foi possível salvar agora. Suas alterações foram mantidas.” e oferece “Tentar novamente”. Ao tentar novamente, a operação é concluída uma única vez e o foco permanece no mesmo contexto.

## Comportamento esperado

A pessoa entende que o conteúdo não foi perdido, sabe que a falha é temporária e consegue repetir a ação sem risco de duplicação ou perda de foco.

## Exemplo não conforme

A interface mostra “Erro 500”, remove o conteúdo digitado e oferece apenas “Atualizar página”.

## Por que falha

Código técnico não orienta a recuperação e a atualização pode apagar contexto ou provocar repetição acidental de ações.

## Testes mínimos

- provocar falha temporária durante salvar, enviar ou carregar;
- validar preservação de dados e posição de foco;
- testar retry múltiplas vezes sem duplicação de operação;
- confirmar feedback após sucesso e após nova falha;
- validar leitor de tela e teclado durante todo o ciclo.
