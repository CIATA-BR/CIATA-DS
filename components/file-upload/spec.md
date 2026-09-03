# CMP-0020 — File Upload

## Status
Rascunho.

## Propósito
Permitir seleção e envio de arquivos com nome claro, restrições compreensíveis, progresso e resultado acessíveis, sem depender de arrastar e soltar ou de informação apenas visual.

## Princípios
- Preferir seletores nativos de arquivo/documento da plataforma.
- Arrastar e soltar pode ser oferecido como conveniência, nunca como único meio de seleção.
- Rótulo, tipos aceitos, quantidade máxima e limite de tamanho devem estar disponíveis antes da seleção quando forem relevantes.
- Arquivos rejeitados precisam de motivo específico e acionável.
- Nome, tamanho e estado de cada arquivo selecionado devem ser perceptíveis por tecnologia assistiva.
- Remover/substituir arquivo deve ser uma ação explícita e não depender de gesto complexo.
- Não iniciar upload irreversível apenas pela seleção quando o fluxo exigir revisão/confirmacão.

## Propriedades conceituais
- `label` — nome do campo/controle;
- `accept` — tipos/extensões aceitos;
- `multiple` — seleção múltipla;
- `maxFiles` — quantidade máxima;
- `maxFileSize` — limite por arquivo;
- `disabled` e `required` — estados do controle;
- `files` — seleção atual;
- `onChange` — alteração da seleção;
- `onRemove` — remoção de item;
- `uploading`, `progress`, `error` e `success` — estados do envio quando aplicáveis.

## Semântica e seleção
Na Web, preferir `input type="file"` com `label` real. Usar `accept`, `multiple`, `required` e `disabled` nativos quando aplicáveis. O atributo `accept` orienta o seletor, mas validação definitiva também deve ocorrer na aplicação/servidor.

O controle não deve ser removido da árvore de acessibilidade apenas para criar um botão visual customizado. Se houver estilização, preservar associação do `label`, foco e acionamento nativos.

## Lista de arquivos
- Expor nome do arquivo e, quando útil, tamanho/formato.
- Em múltiplos arquivos, usar estrutura de lista quando a plataforma oferecer semântica equivalente.
- Ação `Remover` deve possuir nome específico quando necessário, por exemplo `Remover contrato.pdf`.
- Não usar somente ícone de lixeira sem nome acessível.

## Progresso e feedback
- Upload assíncrono deve expor estado de envio e progresso quando determinável.
- Mudanças importantes como início, conclusão, falha e cancelamento precisam de feedback perceptível sem mover foco arbitrariamente.
- Erros devem permanecer associados ao arquivo ou ao controle relevante até serem resolvidos.
- Não anunciar percentuais excessivamente frequentes a ponto de inundar leitores de tela; usar atualizações significativas.

## Teclado, foco e drag-and-drop
- O seletor e ações de arquivo seguem a ordem natural de foco.
- Arrastar e soltar deve possuir alternativa por botão/seletor nativo.
- Ao remover um arquivo, mover foco apenas quando o elemento focado deixar de existir, preferindo o próximo item lógico ou o controle de seleção.
- Não criar drop zones focáveis sem função real de teclado.

## Validação
- Validar quantidade, tamanho, tipo e demais restrições tanto no cliente quanto no servidor quando aplicável.
- Mensagens devem citar o arquivo e a restrição violada, por exemplo `relatorio.exe não é permitido. Envie PDF ou DOCX`.
- Não confiar apenas na extensão do nome do arquivo para segurança.

## Tema, contraste e escala
Respeitar claro, escuro, sistema, forced/high contrast, zoom e text scaling. Estados de erro, sucesso, envio e seleção não podem depender apenas de cor, ícone ou animação.

## Alvo mínimo
Ações interativas seguem alvo interno de 44 × 44 unidades lógicas quando aplicável; Android pode manter 48 dp e iOS mínimo de 44 × 44 pt.

## Exemplos conformes
- campo rotulado `Anexar comprovante`, com texto persistente `PDF ou JPG, até 10 MB`;
- seleção múltipla lista cada arquivo com ação `Remover <nome>`;
- progresso é apresentado visualmente e programaticamente sem spam de anúncios;
- arquivo acima do limite permanece identificado com mensagem específica e pode ser removido/substituído;
- drop zone possui também botão `Selecionar arquivos` acionável por teclado e leitor de tela.

## Exemplos não conformes
- área `Arraste aqui` sem alternativa por teclado;
- input nativo escondido de modo que não possa receber foco nem ser acionado;
- tipos permitidos indicados apenas por ícones;
- erro genérico `Arquivo inválido` sem dizer qual arquivo ou motivo;
- botão de remover anunciado apenas como `botão`;
- foco some após remover um arquivo;
- sucesso indicado apenas por check verde;
- percentuais anunciados a cada alteração mínima, interrompendo continuamente a leitura.

## Matriz mínima
Verificar nome, restrições, seletor nativo, múltiplos arquivos, lista, remover/substituir, drag equivalente, teclado, foco, tipos/tamanho/quantidade, progresso, erro, sucesso, cancelamento, alvo, contraste, escala e tecnologias assistivas.

## Validação manual
Nenhuma implementação passa para estável sem evidência real com tecnologia assistiva relevante.

## Implementações planejadas
Web, Laravel/PHP, Python desktop, Android/Compose, iOS/SwiftUI e Flutter.
