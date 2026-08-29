# Componentes canônicos de acessibilidade

Esta área define o contrato mínimo de acessibilidade dos componentes do CIATA Design System. O objetivo é garantir que a mesma intenção de interação seja preservada em Web, Android e iOS, respeitando as convenções nativas de cada plataforma.

Os documentos desta pasta complementam as [receitas de acessibilidade](../receitas/README.md), a [base canônica WCAG 2.2](../wcag-2.2/README.md) e o [processo de auditoria](../processo-de-auditoria.md).

## Regras comuns

Todo componente interativo deve:

- possuir nome acessível claro e estável;
- expor função, estado e valor quando aplicáveis;
- ser operável pelos mecanismos de entrada relevantes da plataforma;
- possuir foco perceptível e previsível;
- manter alvo de interação adequado;
- comunicar desabilitação, seleção, expansão, erro e carregamento quando aplicáveis;
- preservar equivalência entre interação visual, teclado, toque e tecnologia assistiva;
- preferir componente nativo quando ele atende ao comportamento desejado;
- evitar semântica customizada quando a semântica nativa equivalente já existe.

## Componentes fundamentais

- [Botão](botao.md)
- [Link](link.md)
- [Campo de texto](campo-de-texto.md)
- [Checkbox e radio](checkbox-e-radio.md)
- [Switch](switch.md)

## Validação mínima por componente

Cada componente deve ser validado, quando aplicável, com:

1. teclado ou mecanismo equivalente;
2. leitor de tela principal da plataforma;
3. foco visual e foco de acessibilidade;
4. estados normal, focado, pressionado, selecionado, desabilitado, inválido ou carregando conforme o componente;
5. aumento de texto, zoom ou configuração de fonte da plataforma;
6. contraste e percepção sem depender apenas de cor;
7. reteste após alterações de implementação.

Componentes compostos como combobox, tabs, accordion, modal e toast são tratados em documentos próprios porque exigem contrato de foco e interação adicional.
