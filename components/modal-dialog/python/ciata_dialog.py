"""Implementação experimental do CMP-0008 Modal/Dialog para wxPython."""

from __future__ import annotations

import wx


class CiataDialog(wx.Dialog):
    def __init__(
        self,
        parent: wx.Window,
        title: str,
        message: str = "",
        *,
        close_label: str = "Fechar diálogo",
    ) -> None:
        if not title.strip():
            raise ValueError("title não pode ser vazio.")
        super().__init__(parent, title=title.strip(), style=wx.DEFAULT_DIALOG_STYLE | wx.RESIZE_BORDER)

        panel = wx.Panel(self)
        sizer = wx.BoxSizer(wx.VERTICAL)
        if message.strip():
            text = wx.StaticText(panel, label=message.strip())
            text.Wrap(560)
            sizer.Add(text, 0, wx.EXPAND | wx.ALL, 12)

        self.close_button = wx.Button(panel, wx.ID_CANCEL, close_label)
        self.close_button.SetName(close_label)
        sizer.Add(self.close_button, 0, wx.ALIGN_RIGHT | wx.ALL, 12)
        panel.SetSizer(sizer)

        root = wx.BoxSizer(wx.VERTICAL)
        root.Add(panel, 1, wx.EXPAND)
        self.SetSizerAndFit(root)
        self.SetMinSize((360, 180))
