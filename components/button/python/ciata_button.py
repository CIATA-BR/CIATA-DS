"""Implementação experimental do CMP-0001 Button para wxPython.

Mantém wx.Button como controle nativo e adiciona apenas comportamento comum do
CIATA-DS que não é oferecido diretamente pelo widget.
"""

from __future__ import annotations

from typing import Callable, Optional

import wx


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
        variant: str = "primary",
        loading_label: str = "Processando",
        **kwargs,
    ) -> None:
        super().__init__(parent, label=label, **kwargs)

        if variant not in {"primary", "secondary", "danger", "ghost"}:
            raise ValueError(
                "variant deve ser 'primary', 'secondary', 'danger' ou 'ghost'."
            )

        self.variant = variant
        self._original_label = label
        self._loading_label = loading_label
        self._loading = False
        self._on_activate = on_activate

        self.SetMinSize(self.FromDIP(wx.Size(44, 44)))
        self.Bind(wx.EVT_BUTTON, self._handle_activate)

    @property
    def loading(self) -> bool:
        return self._loading

    def set_loading(self, loading: bool, *, announce: bool = True) -> None:
        """Atualiza o estado de processamento sem confundi-lo com disabled.

        ``wx.Button.Disable()`` não é usado para loading porque desabilitar um
        controle pode retirá-lo do fluxo de foco e ocultar a diferença entre
        "indisponível" e "operação em andamento" para tecnologia assistiva.
        """

        loading = bool(loading)
        if loading == self._loading:
            return

        self._loading = loading
        self.SetLabel(self._loading_label if loading else self._original_label)

        if announce:
            message = (
                f"{self._original_label}: operação em andamento"
                if loading
                else f"{self._original_label}: operação concluída"
            )
            self._announce_status(message)

    def set_disabled(self, disabled: bool) -> None:
        """Controla indisponibilidade real usando o estado nativo de wx.Button."""

        self.Enable(not bool(disabled))

    def set_accessible_name(self, name: str) -> None:
        """Define um nome acessível somente quando o rótulo visível não basta.

        Em botões com texto visível, prefira que o próprio label seja suficiente.
        """

        if not name.strip():
            raise ValueError("O nome acessível não pode ser vazio.")
        self.SetName(name)

    def _handle_activate(self, event: wx.CommandEvent) -> None:
        if self._loading:
            return

        if self._on_activate is not None:
            self._on_activate(event)
            return

        event.Skip()

    def _announce_status(self, message: str) -> None:
        """Solicita anúncio de mudança de estado por mecanismo nativo disponível.

        ``wx.Accessible.NotifyEvent`` pode variar conforme plataforma/build do
        wxPython. Esta implementação usa a alteração de nome/label como fallback
        perceptível e mantém o método isolado para evolução por plataforma.
        """

        accessible = self.GetAccessible()
        if accessible is not None:
            try:
                accessible.NotifyEvent(
                    wx.ACC_EVENT_OBJECT_NAMECHANGE,
                    self,
                    wx.OBJID_CLIENT,
                    wx.CHILDID_SELF,
                )
            except (AttributeError, NotImplementedError):
                pass

        self.SetToolTip(message)
