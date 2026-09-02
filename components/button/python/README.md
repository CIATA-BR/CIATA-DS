# Button — Python desktop / wxPython

Status: experimental.

Esta implementação traduz o contrato `CMP-0001 — Button / Botão` para aplicações desktop Python baseadas em wxPython, com o CIATA-Game como consumidor de referência.

## Princípios

- usar `wx.Button` como controle nativo;
- preservar navegação, foco e acionamento nativos;
- não simular botão com `wx.Panel`, bitmap ou evento de mouse;
- manter `loading` semanticamente separado de `disabled`;
- impedir acionamento duplicado durante loading sem desabilitar o controle;
- usar `FromDIP` para a dimensão mínima lógica de 44 × 44;
- permitir que a aplicação forneça um callback de status acessível por meio de `on_status`;
- tratar `variant` como intenção visual/funcional, sem alterar papel ou nome acessível.

## Exemplo

```python
import wx

from ciata_button import CiataButton


def anunciar_status(message: str) -> None:
    status_bar.SetStatusText(message)


def salvar(event: wx.CommandEvent) -> None:
    save_button.set_loading(True)
    # Executar trabalho assíncrono e, ao concluir:
    # save_button.set_loading(False)


save_button = CiataButton(
    panel,
    "Salvar alterações",
    on_activate=salvar,
    on_status=anunciar_status,
    variant="primary",
)
```

O mecanismo usado em `on_status` deve ser validado no aplicativo consumidor com as tecnologias assistivas suportadas. Uma barra de status visível não garante, por si só, anúncio automático por leitor de tela.

## Loading

Durante `loading=true`:

- o label muda temporariamente para `loading_label`;
- novos eventos de acionamento são ignorados;
- o controle continua sendo um `wx.Button` habilitado;
- o foco não é removido deliberadamente;
- `on_status`, quando fornecido, recebe mensagem de início e conclusão.

Não use `Disable()` para representar loading. `disabled` permanece reservado para indisponibilidade real da ação.

## Disabled

Use `set_disabled(True)` somente quando a ação realmente não estiver disponível. O método delega para o estado nativo de `wx.Button`.

## Nome acessível

O texto visível deve ser suficiente sempre que possível. `set_accessible_name()` existe para cenários em que um nome acessível específico seja realmente necessário. Não acrescente manualmente a palavra “botão”, pois o papel já é fornecido pelo controle nativo.

## Variantes

`primary`, `secondary`, `danger` e `ghost` são aceitas pela API para manter equivalência conceitual com as demais plataformas. Nesta primeira versão wxPython, a classe não força pintura customizada. A aparência deve respeitar o tema nativo e, quando houver estilização no aplicativo consumidor, os tokens do CIATA-DS devem ser usados sem substituir o controle nativo.

## Validação mínima antes de estabilidade

- Windows + JAWS;
- Windows + NVDA;
- navegação somente por teclado;
- Enter/Espaço conforme comportamento nativo wx;
- ordem e retorno de foco;
- nome, papel e estados expostos;
- loading com prevenção de duplo acionamento;
- disabled;
- escala/DPI;
- alto contraste do sistema;
- mensagem produzida pelo `on_status` no mecanismo escolhido pelo aplicativo.

Outras plataformas suportadas por wxPython devem ser avaliadas separadamente antes de serem declaradas conformes.
