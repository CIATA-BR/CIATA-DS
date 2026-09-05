"""Implementação experimental do CMP-0021 Search para wxPython."""

from __future__ import annotations

from collections.abc import Callable

import wx


class CiataSearch(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        label: str,
        on_submit: Callable[[str], None],
        *,
        on_clear: Callable[[], None] | None = None,
    ) -> None:
        super().__init__(parent)
        label = label.strip()
        if not label:
            raise ValueError("label não pode ser vazio.")

        self._on_submit = on_submit
        self._on_clear = on_clear
        text = wx.StaticText(self, label=label)
        self.field = wx.SearchCtrl(self, style=wx.TE_PROCESS_ENTER)
        self.field.SetName(label)
        self.field.ShowSearchButton(True)
        self.field.ShowCancelButton(True)
        self.field.Bind(wx.EVT_TEXT_ENTER, self._submit)
        self.field.Bind(wx.EVT_SEARCHCTRL_SEARCH_BTN, self._submit)
        self.field.Bind(wx.EVT_SEARCHCTRL_CANCEL_BTN, self._clear)

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(text, 0, wx.BOTTOM, 4)
        sizer.Add(self.field, 0, wx.EXPAND)
        self.SetSizer(sizer)

    def _submit(self, _event: wx.CommandEvent) -> None:
        self._on_submit(self.field.GetValue())

    def _clear(self, _event: wx.CommandEvent) -> None:
        self.field.SetValue("")
        self.field.SetFocus()
        if self._on_clear is not None:
            self._on_clear()
