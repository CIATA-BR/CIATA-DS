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

        normalized_title = title.strip()
        normalized_description = description.strip()
        if not normalized_title:
            raise ValueError("title não pode ser vazio.")

        sizer = wx.BoxSizer(wx.VERTICAL)
        self.title = wx.StaticText(self, label=normalized_title)
        sizer.Add(self.title, 0, wx.BOTTOM, 4)
        if normalized_description:
            self.description = wx.StaticText(self, label=normalized_description)
            self.description.Wrap(560)
            sizer.Add(self.description, 0, wx.EXPAND)

        if on_activate is not None:
            self.activate_button = wx.Button(self, label=normalized_title)
            self.activate_button.SetName(normalized_title)
            self.activate_button.Bind(wx.EVT_BUTTON, lambda _event: on_activate())
            sizer.Add(self.activate_button, 0, wx.TOP, 8)

        self.SetSizer(sizer)
