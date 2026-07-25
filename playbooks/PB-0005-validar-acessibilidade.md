# PB-0005 — Executar validação manual de acessibilidade

- **Versão:** 1.0
- **Status:** Em revisão
- **Responsável pelo processo:** QA de acessibilidade
- **Relacionamentos:** SPEC-0005, CHECK-0001, ADR-0003

## Objetivo

Validar uma experiência com pessoas, tecnologias assistivas e cenários reais, sem confundir conformidade automática com acessibilidade concluída.

## Preparação

1. Definir escopo, versão, ambiente, perfis e jornadas críticas.
2. Registrar tecnologias assistivas, navegadores, sistemas e dispositivos utilizados.
3. Desativar recursos automáticos de reconhecimento quando puderem mascarar ausência de rótulos, descrições ou texto alternativo.
4. Preparar dados de teste sem informações pessoais reais.

## Execução

1. Navegar apenas por teclado quando aplicável.
2. Validar ordem e persistência do foco.
3. Verificar nomes, papéis, estados, valores e mensagens anunciadas.
4. Testar leitores de tela relevantes, como NVDA, JAWS, TalkBack e VoiceOver.
5. Verificar leitura e operação com linha Braille quando disponível.
6. Testar zoom, ampliação, contraste, reflow e tamanho de texto.
7. Confirmar que cor, posição, forma, gesto ou áudio não são o único meio de comunicação.
8. Validar erros, confirmações, carregamento, conteúdo dinâmico e mudanças de contexto.
9. Conferir imagens, gráficos, anexos, documentos e multimídia.
10. Registrar evidências reproduzíveis e impacto para a pessoa usuária.

## Classificação

- **Bloqueadora:** impede jornada essencial ou acesso ao conteúdo.
- **Alta:** causa perda relevante de informação, autonomia ou segurança.
- **Média:** cria barreira contornável com esforço significativo.
- **Baixa:** prejudica clareza ou eficiência sem impedir a tarefa.

## Critérios de conclusão

- jornadas críticas executadas;
- ambiente e tecnologias registrados;
- falhas com passos de reprodução e evidências;
- bloqueios resolvidos ou publicação formalmente impedida;
- resultado revisado por pessoa competente, preferencialmente incluindo pessoa com deficiência.
