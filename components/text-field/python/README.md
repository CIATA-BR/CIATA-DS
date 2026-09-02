# CMP-0002 — TextField para Python/wxPython

Status: experimental.

Esta implementação usa `wx.TextCtrl` nativo dentro de um `wx.Panel` que organiza label persistente, ajuda e erro. O painel não substitui o controle de edição; foco, seleção, digitação, colagem e navegação permanecem no `wx.TextCtrl`.

## Princípios

- label visual persistente; placeholder não substitui nome do campo;
- `readonly` usa estado editável do controle e continua distinto de `disabled`;
- `disabled` usa `Enable(false)`;
- senha usa `wx.TE_PASSWORD`;
- multilinha usa `wx.TE_MULTILINE`;
- `max_length` usa a API nativa do controle;
- erros não movem foco;
- erros só são anunciados quando o chamador solicita e fornece `on_status`;
- validação a cada caractere não é imposta pelo componente;
- nenhuma máscara é aplicada automaticamente, para não quebrar cursor, seleção, colagem ou leitura caractere a caractere.

## Exemplo

```python
field = CiataTextField(
    panel,
    "CPF",
    required=True,
    help_text="Informe apenas os números ou cole o CPF completo.",
    on_status=announce_status,
)

field.set_error("CPF inválido")
```

## Máscaras

Máscaras de CPF, telefone, CEP e datas devem ser tratadas por uma camada separada e testada com JAWS/NVDA. A representação visual não deve impedir entrada sem pontuação, colagem, edição no meio do valor ou leitura consistente pelo leitor de tela.

## Validação mínima

Validar em consumidor real, especialmente CIATA-Game:

- foco e ordem de tabulação;
- nome do campo;
- obrigatório;
- ajuda e erro;
- readonly e disabled;
- seleção, copiar/colar e edição;
- senha;
- multilinha;
- limite de caracteres;
- escalabilidade/DPI;
- JAWS e NVDA;
- alto contraste/tema do sistema quando aplicável.

A promoção para estável depende de evidências reais, não apenas da existência do código.
