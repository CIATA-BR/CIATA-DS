"""Implementação experimental do CMP-0001 Button para wxPython.

Mantém wx.Button como controle nativo e adiciona apenas comportamento comum do
CIATA-DS que não é oferecido diretamente pelo widget.
"""

from __future__ import annotations

from typing import Callable, Optional

import wx

StatusCallback = Callable[[str], None]


class CiataButton(wx.Button):
    """Botão nativo wxPython alinhado ao contrato CMP-0001.

    O controle preserva a semântica e o comportamento de teclado de ``wx.Button``.
    O estado ``loading`` é separado de ``disabled``: durante uma operação em
    andamento o botão continua habilitado para a API de acessibilidade, mas novos
    acionamentos são ignorados até que o estado seja encerrado.
    """

    def __init__(
        self,
        parent: wx.Window,
        label: str,
        *,
        on_activate: Optional[Callable[[wx.CommandEvent], None]] = None,
        on_status: Optional[StatusCallback] = None,
        variant: str = "primary",
        loading_label: str = "Processando",
        **kwargs,
    ) -> None:
        label = label.strip()
        loading_label = loading_label.strip()
        if not label:
            raise ValueError("label não pode ser vazio.")
        if not loading_label:
            raise ValueError("loading_label não pode ser vazio.")
        if variant not in {"primary", "secondary", "danger", "ghost"}:
            raise ValueError(
                "variant deve ser 'primary', 'secondary', 'danger' ou 'ghost'."
            )

        super().__init__(parent, label=label, **kwargs)

        self.variant = variant
        self._original_label = label
        self._loading_label = loading_label
        self._loading = False
        self._on_activate = on_activate
        self._on_status = on_status

        self.SetMinSize(self.FromDIP(wx.Size(44, 44)))
        self.Bind(wx.EVT_BUTTON, self._handle_activate)

    @property
    def loading(self) -> bool:
        return self._loading

    def set_loading(self, loading: bool, *, announce: bool = True) -> None:
        """Atualiza processamento sem confundir loading com disabled.

        O rótulo visível permanece estável durante a operação. Quando ``on_status``
        é fornecido, a aplicação decide como anunciar início/conclusão pelo
        mecanismo acessível mais apropriado para a janela/plataforma.
        """

        loading = bool(loading)
        if loading == self._loading:
            return

        self._loading = loading
        self.SetLabel(self._original_label)

        if announce and self._on_status is not None:
            message = (
                f"{self._original_label}: {self._loading_label}"
                if loading
                else f"{self._original_label}: operação concluída"
            )
            self._on_status(message)

    def set_disabled(self, disabled: bool) -> None:
        """Controla indisponibilidade real usando o estado nativo de wx.Button."""

        self.Enable(not bool(disabled))

    def set_accessible_name(self, name: str) -> None:
        """Define um nome acessível somente quando o rótulo visível não basta.

        Em botões com texto visível, prefira que o próprio label seja suficiente.
        """

        name = name.strip()
        if not name:
            raise ValueError("O nome acessível não pode ser vazio.")
        self.SetName(name)

    def _handle_activate(self, event: wx.CommandEvent) -> None:
        if self._loading:
            return

        if self._on_activate is not None:
            self._on_activate(event)
            return

        event.Skip()
