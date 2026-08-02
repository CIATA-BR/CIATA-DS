# PAT-0002 — Cadastro e autenticação acessíveis e seguros

## Metadados

- **Tipo:** Padrão
- **Código:** PAT-0002
- **Versão:** 0.1.0
- **Status:** rascunho
- **Responsável:** CIATA
- **Última revisão:** 2026-08-02

## Resumo

Fluxos de cadastro e autenticação devem confirmar a identidade necessária sem impor barreiras evitáveis, expor segredos ou depender exclusivamente de visão, memória, tempo ou interação precisa. Este padrão reúne práticas validadas no Portal CIATA para confirmação de e-mail, criação de senha, comunicação de estados e proteção contra automação.

## Quando usar

Em criação de conta, entrada, confirmação de e-mail, recuperação de acesso e alteração de credenciais.

Quando o serviço não precisa identificar a pessoa, prefira acesso sem conta. Aprovação administrativa após o cadastro só deve existir quando uma regra de negócio explícita exigir análise humana; não deve ser adicionada como etapa genérica de segurança.

## Relação com formulários

Todo fluxo deve seguir o [padrão de formulários acessíveis PAT-0001](PAT-0001-formularios-acessiveis.md). Este documento acrescenta requisitos próprios de identidade, credenciais, tokens e prevenção de abuso.

## Cadastro em etapas

Quando o e-mail precisar ser confirmado antes da criação da conta:

1. solicite apenas o e-mail na primeira etapa;
2. envie um link que informe claramente a ação, a validade e como ignorar uma solicitação não reconhecida;
3. após a confirmação, apresente o e-mail preenchido e não editável;
4. obtenha os demais dados somente na segunda etapa;
5. crie a conta com o e-mail já marcado como verificado;
6. invalide o token depois da conclusão.

As etapas devem usar estrutura semântica, nome compreensível e estado atual programaticamente exposto, como uma lista ordenada com `aria-current="step"`. Etapas concluídas e atuais não podem ser diferenciadas apenas por cor ou ícone.

Deve existir uma ação clara para reiniciar o fluxo com outro e-mail. O servidor usa o endereço confirmado como fonte de verdade e ignora qualquer e-mail diferente enviado manualmente pelo navegador na etapa final.

## Links e tokens de confirmação

- Gere tokens com fonte criptograficamente segura e entropia suficiente.
- Armazene somente uma representação criptográfica não reversível, como o hash SHA-256, nunca o token recebido pela pessoa.
- Use comparação exata, vínculo com o e-mail e validade curta configurável.
- Faça o token expirar e trate-o como de uso único após a conclusão do cadastro.
- Revalide token, prazo e unicidade do e-mail dentro da operação que cria a conta.
- Evite incluir token, senha, corpo da mensagem ou outros dados pessoais desnecessários em logs e evidências.
- Limpe tokens expirados de forma periódica.

Uma nova solicitação para o mesmo endereço deve substituir ou invalidar a anterior. A resposta sobre endereços já cadastrados deve considerar o risco de enumeração de contas e a necessidade de orientar uma pessoa legítima a entrar ou recuperar o acesso.

## Senhas

- Informe as regras antes da entrada, em linguagem clara.
- Permita colar, usar gerenciador de senhas e caracteres especiais.
- Não imponha regras ocultas nem limite máximo baixo que impeça frases-senha.
- Ofereça um botão semântico para exibir ou ocultar cada senha.
- Atualize o nome acessível do botão para descrever a próxima ação, como “Exibir senha” e “Ocultar senha”.
- Mantenha o ícone decorativo fora da árvore de acessibilidade.
- Se houver animação do ícone, use transição discreta e respeite `prefers-reduced-motion`.
- Informe em texto se as senhas coincidem e associe a mensagem aos campos.
- Trate o indicador de força como orientação adicional; ele não substitui regras explícitas nem validação no servidor.

Não anuncie a força a cada tecla de forma excessivamente verbosa. Estados como “fraca”, “média” e “forte” precisam de texto e sinalização visual que não dependa apenas de cor.

## Validação, botões e estados

- A validação imediata melhora o retorno, mas o servidor repete todas as regras críticas.
- Campos obrigatórios são identificados em texto no rótulo ou por uma instrução equivalente, além do atributo programático `required`.
- O botão principal descreve a ação daquela etapa, como “Enviar link de confirmação”, “Criar conta” ou “Entrar”.
- Enquanto campos obrigatórios estiverem incompletos ou uma verificação de segurança estiver pendente, o botão pode permanecer desabilitado desde que o motivo esteja disponível em texto e seu estado seja atualizado de forma previsível.
- Após o envio, bloqueie repetições acidentais e comunique processamento, sucesso, falha e próximos passos.
- No erro, associe mensagens aos campos e mova o foco uma única vez para o resumo quando isso ajudar.
- Quando uma nova página ou contexto de sucesso for apresentado, anuncie o resultado e posicione o foco no título ou mensagem principal.

Desabilitar o botão no cliente não é mecanismo de segurança e não elimina a necessidade de validação no servidor.

## Tokens semânticos do CIATA

Produtos web devem importar os tokens oficiais em vez de repetir valores literais de cor. Para estes fluxos, use:

- `--ciata-sucesso-fundo` e `--ciata-sucesso-texto` em confirmação, requisito atendido e etapa concluída;
- `--ciata-aviso-fundo` e `--ciata-aviso-texto` em orientação que exige atenção;
- `--ciata-erro-fundo` e `--ciata-erro-texto` em resumo, mensagem e borda de erro;
- `--ciata-desabilitado-fundo`, `--ciata-desabilitado-texto` e `--ciata-desabilitado-borda` em controles indisponíveis;
- `--ciata-foco` e `--ciata-foco-contraste` no indicador visível de foco;
- tokens de superfície, texto e borda para os demais estados neutros.

Cor continua sendo apoio visual: sucesso, aviso, erro, força da senha e conclusão de etapa também precisam de texto, semântica ou ícone com alternativa compreensível. Novas necessidades de cor devem primeiro ampliar os tokens oficiais, não criar valores isolados no produto.

## Proteção contra automação

Use camadas proporcionais ao risco, combinando quando aplicável:

- limitação de requisições por rota e contexto;
- campo-armadilha invisível para pessoas, mas disponível para automações simples;
- verificação de tempo mínimo plausível de preenchimento;
- proteção contra falsificação de requisição;
- serviço de desafio adaptativo, como Cloudflare Turnstile;
- detecção e tratamento de envios duplicados.

O desafio deve ter nome e estado compreensíveis, funcionar por teclado e comunicar carregamento, conclusão ou falha em texto. Falhas não podem prender a pessoa indefinidamente em “verificando”; ofereça nova tentativa ou orientação de suporte. A verificação do token do desafio ocorre no servidor e fica vinculada à ação esperada.

Não use um desafio visual ou cognitivo como única defesa. Proteção contra bots não justifica coletar dados pessoais adicionais.

## E-mail transacional

Mensagens de confirmação seguem a [receita de envio por Microsoft Graph REC-0001](../recipes/REC-0001-envio-email-microsoft-graph.md) quando esse serviço for adotado. O e-mail deve ter assunto objetivo, HTML semântico, alternativa textual, remetente institucional e link com finalidade compreensível fora do contexto visual.

O envio deve ser desacoplado da resposta sempre que possível. Falhas de fila ou entrega precisam ser observáveis sem registrar conteúdo sensível.

## Critérios de aceite

- [ ] É possível concluir o fluxo apenas com teclado.
- [ ] Rótulos, instruções, erros, estados e resultados são anunciados corretamente por leitor de tela.
- [ ] Ampliação, alto contraste e cores forçadas preservam conteúdo e operação.
- [ ] Exibir e ocultar senha funciona, possui nome acessível atualizado e respeita redução de movimento.
- [ ] Colagem e gerenciadores de senha não são bloqueados.
- [ ] O servidor rejeita alteração do e-mail confirmado e dados manipulados no cliente.
- [ ] O token é aleatório, armazenado como hash, temporário e invalidado após uso.
- [ ] Reenvio, expiração, link inválido, sessão ausente e e-mail já cadastrado foram testados.
- [ ] Limites de requisição e proteção contra automação foram testados no cliente e no servidor.
- [ ] Nenhuma credencial, token ou dado pessoal desnecessário aparece em logs, testes ou evidências.
- [ ] O CHECK-0102 e o CHECK-0101 foram concluídos para o fluxo.

## Antipadrões

- criar conta antes de confirmar o endereço quando o e-mail é parte da identidade;
- confiar no e-mail reenviado pelo navegador após a confirmação;
- armazenar o token de confirmação em texto puro;
- exigir aprovação administrativa sem regra de negócio;
- impedir colagem no campo de senha;
- usar apenas cor ou barras visuais para comunicar força;
- usar ícone de olho sem nome acessível;
- depender somente de JavaScript, botão desabilitado ou desafio anti-bot para validar o envio;
- responder indefinidamente “verificando” sem recuperação;
- registrar senhas, tokens ou conteúdo pessoal para diagnóstico.

## Relações

- **Padrões:** PAT-0001 — Formulários acessíveis
- **Receitas técnicas:** REC-0001 — Envio de e-mail com Microsoft Graph; REC-0002 — Validação acessível de formulários
- **Checklists:** CHECK-0001 — Revisão manual de acessibilidade; CHECK-0101 — QA funcional; CHECK-0102 — Validação de formulários acessíveis
- **Blueprints:** BP-0001 — Projeto Laravel institucional

## Histórico

- 2026-08-02 — Criação inicial a partir das práticas validadas no Portal CIATA.
