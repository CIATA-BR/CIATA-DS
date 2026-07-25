# REC-0003 — Upload de arquivos acessível e seguro

## Metadados

- **Tipo:** Receita técnica
- **Código:** REC-0003
- **Versão:** 0.1.0
- **Status:** rascunho
- **Responsável:** CIATA
- **Última revisão:** 2026-07-25

## Objetivo

Implementar envio de arquivos com instruções claras, operação completa por teclado, retorno compreensível e proteção contra arquivos perigosos ou dados expostos.

## Quando usar

Em laudos, documentos, imagens, obras digitais, anexos e demais fluxos nos quais o usuário precisa selecionar e enviar arquivos.

## Ingredientes técnicos

- controle nativo de seleção de arquivos;
- limites de tamanho e tipos aceitos definidos no servidor;
- armazenamento privado quando houver dados pessoais;
- nome interno aleatório e metadados separados;
- verificação de conteúdo e registro seguro de falhas.

## Receita

1. Informe antes do controle os formatos aceitos, o tamanho máximo e a finalidade do arquivo.
2. Preserve o controle nativo de arquivo ou ofereça alternativa equivalente plenamente acessível.
3. Exiba o nome do arquivo selecionado em texto.
4. Permita remover ou substituir o arquivo antes do envio.
5. Valide extensão, tipo MIME, assinatura do conteúdo e tamanho no servidor.
6. Gere nome interno imprevisível e mantenha o nome original apenas como metadado sanitizado.
7. Armazene arquivos sensíveis fora da área pública e entregue-os por autorização controlada.
8. Informe progresso quando o envio puder demorar, sem depender apenas de animação.
9. Em falha, preserve o restante do formulário e explique a ação necessária.
10. Registre auditoria sem copiar dados pessoais ou conteúdo do arquivo para logs.

## Validação

- selecionar, substituir e remover arquivo usando apenas teclado;
- confirmar que o leitor de tela anuncia nome, estado e mensagens;
- testar arquivo acima do limite, extensão alterada e tipo não permitido;
- verificar bloqueio de acesso direto ao armazenamento privado;
- testar interrupção de rede e reenvio sem duplicação indevida.

## Erros comuns

### Botão visual não abre o seletor pelo teclado

- **Causa provável:** elemento não semântico acionando um campo oculto.
- **Correção:** usar controle nativo ou botão real associado corretamente.

### Arquivo aceito no navegador e rejeitado depois

- **Causa provável:** regras diferentes entre cliente e servidor.
- **Correção:** manter a regra do servidor como fonte de verdade e refletir os mesmos limites na interface.

### Link público expõe documento privado

- **Causa provável:** armazenamento sensível em diretório servido diretamente.
- **Correção:** mover para armazenamento privado e usar autorização para download.

## Segurança e privacidade

Não confiar no nome ou tipo informado pelo navegador. Aplicar autorização, nomes internos aleatórios, limites de tamanho, varredura quando aplicável e descarte seguro. Dados sensíveis devem ter retenção e acesso definidos.

## Acessibilidade

Não substituir o controle de arquivo por área de arrastar e soltar sem alternativa. Mensagens de progresso, sucesso e falha devem ser textuais e anunciadas de maneira não intrusiva.

## Reversão

Desativar temporariamente novos uploads sem remover arquivos existentes. Manter acesso autorizado e registrar a migração ao restaurar a implementação anterior.

## Relações

- **Padrões:** PAT-0001 — Formulários acessíveis
- **Especificações:** SPEC-0004 — Artefatos; SPEC-0005 — Acessibilidade
- **Checklists:** CHECK-0102 — Validação de formulários acessíveis
- **Playbooks:** PB-0005 — Executar validação manual de acessibilidade

## Histórico

- 2026-07-25 — Criação inicial pelo CIATA.
