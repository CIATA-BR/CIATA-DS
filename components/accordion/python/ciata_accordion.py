"""Implementação experimental do CMP-0014 Accordion para wxPython."""

from __future__ import annotations

from collections.abc import Sequence

import wx


class CiataAccordion(wx.Panel):
    def __init__(self, parent: wx.Window, items: Sequence[tuple[str, wx.Window]]) -> None:
        super().__init__(parent)
        if not items:
            raise ValueError("items não pode ser vazio.")

        sizer = wx.BoxSizer(wx.VERTICAL)
        self._items: list[tuple[wx.Button, wx.Window]] = []

        for label, panel in items:
            if not label.strip():
                raise ValueError("rótulo do item não pode ser vazio.")
            button = wx.Button(self, label=label.strip())
            button.SetName(f"{label.strip()}, recolhido")
            panel.Reparent(self)
            panel.Hide()
            button.Bind(wx.EVT_BUTTON, lambda _event, b=button, p=panel: self._toggle(b, p))
            sizer.Add(button, 0, wx.EXPAND | wx.TOP, 4)
            sizer.Add(panel, 0, wx.EXPAND | wx.ALL, 8)
            self._items.append((button, panel))

        self.SetSizer(sizer)

    def _toggle(self, button: wx.Button, panel: wx.Window) -> None:
        expanded = panel.IsShown()
        panel.Show(not expanded)
        button.SetName(f"{button.GetLabel()}, {'recolhido' if expanded else 'expandido'}")
        self.Layout()
