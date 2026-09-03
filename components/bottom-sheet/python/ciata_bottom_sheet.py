"""Implementação experimental do CMP-0018 Bottom Sheet para wxPython."""

from __future__ import annotations

from collections.abc import Callable

import wx


class CiataBottomSheetDialog(wx.Dialog):
    """Mapeia o comportamento modal do Bottom Sheet para diálogo nativo desktop."""

    def __init__(self, parent: wx.Window, title: str, build_content: Callable[[wx.Window], None]) -> None:
        title = title.strip()
        if not title:
            raise ValueError("title não pode ser vazio.")

        super().__init__(parent, title=title, style=wx.DEFAULT_DIALOG_STYLE | wx.RESIZE_BORDER)
        container = wx.Panel(self)
        build_content(container)

        close_button = wx.Button(self, wx.ID_CLOSE, label="Fechar")
        close_button.Bind(wx.EVT_BUTTON, lambda _event: self.EndModal(wx.ID_CLOSE))

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(container, 1, wx.EXPAND | wx.ALL, 12)
        sizer.Add(close_button, 0, wx.ALIGN_RIGHT | wx.LEFT | wx.RIGHT | wx.BOTTOM, 12)
        self.SetSizerAndFit(sizer)
        self.SetMinSize((360, 240))
