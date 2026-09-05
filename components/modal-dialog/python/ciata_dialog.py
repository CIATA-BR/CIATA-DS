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
        normalized_title = title.strip()
        normalized_message = message.strip()
        normalized_close_label = close_label.strip()

        if not normalized_title:
            raise ValueError("title não pode ser vazio.")
        if not normalized_close_label:
            raise ValueError("close_label não pode ser vazio.")

        super().__init__(
            parent,
            title=normalized_title,
            style=wx.DEFAULT_DIALOG_STYLE | wx.RESIZE_BORDER,
        )

        panel = wx.Panel(self)
        sizer = wx.BoxSizer(wx.VERTICAL)
        if normalized_message:
            text = wx.StaticText(panel, label=normalized_message)
            text.Wrap(560)
            sizer.Add(text, 0, wx.EXPAND | wx.ALL, 12)

        self.close_button = wx.Button(panel, wx.ID_CANCEL, normalized_close_label)
        self.close_button.SetName(normalized_close_label)
        sizer.Add(self.close_button, 0, wx.ALIGN_RIGHT | wx.ALL, 12)
        panel.SetSizer(sizer)

        root = wx.BoxSizer(wx.VERTICAL)
        root.Add(panel, 1, wx.EXPAND)
        self.SetSizerAndFit(root)
        self.SetMinSize((360, 180))
