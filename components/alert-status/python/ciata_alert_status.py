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

        normalized_message = message.strip()
        normalized_title = title.strip()
        normalized_variant = variant.strip()
        normalized_priority = priority.strip()

        if not normalized_message:
            raise ValueError("message não pode ser vazio.")
        if normalized_variant not in {"info", "success", "warning", "error"}:
            raise ValueError("variant deve ser info, success, warning ou error.")
        if normalized_priority not in {"status", "alert"}:
            raise ValueError("priority deve ser status ou alert.")

        self._priority = normalized_priority
        self._on_announce = on_announce
        if normalized_title:
            self.SetName(normalized_title)

        sizer = wx.BoxSizer(wx.VERTICAL)
        if normalized_title:
            self.title = wx.StaticText(self, label=normalized_title)
            sizer.Add(self.title, 0, wx.BOTTOM, 4)
        self.message = wx.StaticText(self, label=normalized_message)
        self.message.Wrap(560)
        sizer.Add(self.message, 0, wx.EXPAND)
        self.SetSizer(sizer)
        self.SetHelpText(normalized_message)

        if on_announce is not None:
            on_announce(normalized_message, normalized_priority)

    def update_message(self, message: str, *, announce: bool = True) -> None:
        value = message.strip()
        if not value:
            raise ValueError("message não pode ser vazio.")
        self.message.SetLabel(value)
        self.SetHelpText(value)
        self.Layout()
        if announce and self._on_announce is not None:
            self._on_announce(value, self._priority)
