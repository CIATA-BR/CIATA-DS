# Estados vazios e confirmações

## Contrato

Estados vazios e mensagens de confirmação devem explicar claramente o que aconteceu, o que significa e qual é o próximo passo possível, sem depender apenas de ilustração, cor ou desaparecimento automático.

## Regras

- estado vazio deve ser distinguido de erro, carregamento e ausência temporária de dados;
- informar quando não há conteúdo, resultados ou itens cadastrados;
- oferecer próxima ação quando houver algo útil a fazer;
- mensagens de sucesso devem confirmar a ação concluída e, quando necessário, indicar consequência ou próximo passo;
- não usar apenas ícone de check, cor verde ou animação como confirmação;
- mensagens essenciais não devem desaparecer antes de poderem ser percebidas;
- atualizações assíncronas devem ser anunciadas sem mover o foco sem necessidade;
- evitar mensagens vagas como `Pronto`, `Tudo certo` ou `Nenhum item` quando o contexto exige mais precisão.

## Exemplo conforme

Após salvar um formulário, a interface mantém o foco lógico e apresenta `Dados pessoais salvos com sucesso.` em uma região de status apropriada.

### Comportamento esperado

O leitor de tela anuncia a confirmação sem retirar a pessoa do campo ou controle atual. A mensagem também permanece disponível visualmente pelo tempo necessário.

## Exemplo não conforme

Após salvar, apenas um ícone verde de check aparece por dois segundos e desaparece, sem texto e sem anúncio acessível.

### Por que falha

A conclusão da tarefa depende de percepção visual e temporal. Uma pessoa usando leitor de tela pode não receber qualquer confirmação de que a ação foi concluída.

## Critérios de teste

- estado vazio é identificado como ausência de conteúdo, não como erro genérico;
- próxima ação é clara quando aplicável;
- sucesso e confirmação possuem mensagem textual objetiva;
- feedback assíncrono é anunciado sem roubar foco;
- conteúdo essencial não desaparece cedo demais;
- cor, animação e ícones são complementares, nunca o único canal de informação.