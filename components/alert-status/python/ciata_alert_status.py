"""Implementação experimental do CMP-0007 Alert/Status para wxPython."""

from __future__ import annotations

from typing import Callable, Optional

import wx


class CiataAlertStatus(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        message: str,
        *,
        title: str = "",
        variant: str = "info",
        priority: str = "status",
        on_announce: Optional[Callable[[str, str], None]] = None,
    ) -> None:
        super().__init__(parent)
        if not message.strip():
            raise ValueError("message não pode ser vazio.")
        if priority not in {"status", "alert"}:
            raise ValueError("priority deve ser status ou alert.")

        self._priority = priority
        self._on_announce = on_announce
        self.SetName(title.strip() or "Mensagem de status")

        sizer = wx.BoxSizer(wx.VERTICAL)
        if title.strip():
            self.title = wx.StaticText(self, label=title.strip())
            sizer.Add(self.title, 0, wx.BOTTOM, 4)
        self.message = wx.StaticText(self, label=message.strip())
        self.message.Wrap(560)
        sizer.Add(self.message, 0, wx.EXPAND)
        self.SetSizer(sizer)
        self.SetHelpText(f"{variant}: {message.strip()}")

        if on_announce is not None:
            on_announce(message.strip(), priority)

    def update_message(self, message: str, *, announce: bool = True) -> None:
        value = message.strip()
        if not value:
            raise ValueError("message não pode ser vazio.")
        self.message.SetLabel(value)
        self.Layout()
        if announce and self._on_announce is not None:
            self._on_announce(value, self._priority)
