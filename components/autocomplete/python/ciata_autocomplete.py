"""Implementação experimental do CMP-0022 Autocomplete para wxPython."""

from __future__ import annotations

from collections.abc import Callable, Sequence

import wx


class CiataAutocomplete(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        label: str,
        options: Sequence[str],
        on_select: Callable[[str], None],
    ) -> None:
        super().__init__(parent)
        label = label.strip()
        if not label:
            raise ValueError("label não pode ser vazio.")
        cleaned = [option.strip() for option in options]
        if any(not option for option in cleaned):
            raise ValueError("options não pode conter rótulos vazios.")

        text = wx.StaticText(self, label=label)
        self.control = wx.ComboBox(self, choices=cleaned, style=wx.CB_DROPDOWN | wx.TE_PROCESS_ENTER)
        self._on_select = on_select
        self.control.Bind(wx.EVT_COMBOBOX, self._selected)
        self.control.Bind(wx.EVT_TEXT_ENTER, self._submitted)

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(text, 0, wx.BOTTOM, 4)
        sizer.Add(self.control, 0, wx.EXPAND)
        self.SetSizer(sizer)

    def _selected(self, _event: wx.CommandEvent) -> None:
        self._on_select(self.control.GetValue())

    def _submitted(self, _event: wx.CommandEvent) -> None:
        self._on_select(self.control.GetValue())
