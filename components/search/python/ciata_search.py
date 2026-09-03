"""Implementação experimental do CMP-0021 Search para wxPython."""

from __future__ import annotations

from collections.abc import Callable

import wx


class CiataSearch(wx.Panel):
    def __init__(self, parent: wx.Window, label: str, on_submit: Callable[[str], None]) -> None:
        super().__init__(parent)
        label = label.strip()
        if not label:
            raise ValueError("label não pode ser vazio.")

        self._on_submit = on_submit
        text = wx.StaticText(self, label=label)
        self.field = wx.SearchCtrl(self, style=wx.TE_PROCESS_ENTER)
        self.field.ShowSearchButton(True)
        self.field.ShowCancelButton(True)
        self.field.Bind(wx.EVT_TEXT_ENTER, self._submit)
        self.field.Bind(wx.EVT_SEARCHCTRL_SEARCH_BTN, self._submit)

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(text, 0, wx.BOTTOM, 4)
        sizer.Add(self.field, 0, wx.EXPAND)
        self.SetSizer(sizer)

    def _submit(self, _event: wx.CommandEvent) -> None:
        self._on_submit(self.field.GetValue())
