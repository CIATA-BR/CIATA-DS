# Receitas de acessibilidade multiplataforma

Esta área transforma princípios e critérios de acessibilidade em orientações práticas de implementação para Web, Android e iOS.

As receitas não substituem o texto normativo da [WCAG 2.2 canônica](../wcag-2.2/README.md), nem os referenciais externos. Elas descrevem padrões de engenharia que reduzem regressões recorrentes e tornam a implementação mais previsível entre plataformas.

## Como usar

1. identifique o comportamento funcional desejado;
2. aplique a receita comum;
3. implemente a adaptação da plataforma;
4. valide com tecnologia assistiva real;
5. registre qualquer exceção ou limitação no fluxo de auditoria.

## Receitas

- [Nome, função, estado e valor](nome-funcao-estado-valor.md)
- [Foco e mudanças de contexto](foco-e-contexto.md)
- [Mensagens dinâmicas e feedback](mensagens-dinamicas.md)
- [Modais, diálogos e bottom sheets](modais-e-bottom-sheets.md)
- [Formulários, validação e erros](formularios-e-erros.md)
- [Autenticação acessível](autenticacao-acessivel.md)
- [Gestos, arraste e ações alternativas](gestos-e-drag-and-drop.md)
- [Zoom, reflow e aumento de texto](zoom-reflow-e-texto.md)
- [Mídia e conteúdo visual](midia-e-conteudo-visual.md)

## Princípios gerais

- preferir componentes nativos quando atendem ao caso de uso;
- não depender apenas de aparência visual para transmitir papel, estado ou resultado;
- não mover o foco sem causa funcional clara;
- não usar anúncio como substituto de semântica correta;
- não duplicar fala desnecessariamente;
- preservar equivalência entre toque, teclado, leitor de tela e outras formas de entrada;
- considerar Web, Android e iOS como implementações diferentes do mesmo contrato de experiência, e não como cópias literais umas das outras.
