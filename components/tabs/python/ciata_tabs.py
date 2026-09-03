"""Implementação experimental do CMP-0013 Tabs para wxPython."""

from __future__ import annotations

from collections.abc import Sequence

import wx


class CiataTabs(wx.Notebook):
    def __init__(self, parent: wx.Window, tabs: Sequence[tuple[str, wx.Window]]) -> None:
        super().__init__(parent)
        if not tabs:
            raise ValueError("tabs não pode ser vazio.")

        for label, panel in tabs:
            if not label.strip():
                raise ValueError("rótulo de aba não pode ser vazio.")
            self.AddPage(panel, label.strip())

    def select(self, index: int) -> None:
        if not 0 <= index < self.GetPageCount():
            raise IndexError("índice de aba fora do intervalo válido.")
        self.SetSelection(index)
