"""Implementação experimental do CMP-0009 Loading/Progress para wxPython."""

from __future__ import annotations

import wx


class CiataProgress(wx.Panel):
    def __init__(self, parent: wx.Window, label: str, *, maximum: int = 100, value: int | None = None) -> None:
        super().__init__(parent)
        if not label.strip():
            raise ValueError("label não pode ser vazio.")
        if maximum <= 0:
            raise ValueError("maximum deve ser maior que zero.")

        self._label = label.strip()
        self.label = wx.StaticText(self, label=self._label)
        self.gauge = wx.Gauge(self, range=maximum, style=wx.GA_HORIZONTAL)
        self.gauge.SetName(self._label)

        if value is None:
            self.gauge.Pulse()
        else:
            self.set_value(value)

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.label, 0, wx.BOTTOM, 4)
        sizer.Add(self.gauge, 0, wx.EXPAND)
        self.SetSizer(sizer)

    def set_value(self, value: int) -> None:
        safe = max(0, min(self.gauge.GetRange(), value))
        self.gauge.SetValue(safe)
        self.gauge.SetHelpText(f"{self._label}: {safe} de {self.gauge.GetRange()}")
