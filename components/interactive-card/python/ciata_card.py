"""Implementação experimental do CMP-0010 Card interativo para wxPython."""

from __future__ import annotations

from collections.abc import Callable

import wx


class CiataCard(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        title: str,
        description: str = "",
        *,
        on_activate: Callable[[], None] | None = None,
    ) -> None:
        super().__init__(parent)
        if not title.strip():
            raise ValueError("title não pode ser vazio.")

        sizer = wx.BoxSizer(wx.VERTICAL)
        self.title = wx.StaticText(self, label=title.strip())
        sizer.Add(self.title, 0, wx.BOTTOM, 4)
        if description.strip():
            self.description = wx.StaticText(self, label=description.strip())
            self.description.Wrap(560)
            sizer.Add(self.description, 0, wx.EXPAND)

        if on_activate is not None:
            self.activate_button = wx.Button(self, label=title.strip())
            self.activate_button.SetName(title.strip())
            self.activate_button.Bind(wx.EVT_BUTTON, lambda _event: on_activate())
            sizer.Add(self.activate_button, 0, wx.TOP, 8)

        self.SetSizer(sizer)
