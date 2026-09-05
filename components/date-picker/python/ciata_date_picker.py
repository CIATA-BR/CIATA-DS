"""Implementação experimental do CMP-0019 Date Picker para wxPython."""

from __future__ import annotations

import wx
import wx.adv


class CiataDatePicker(wx.Panel):
    def __init__(self, parent: wx.Window, label: str) -> None:
        super().__init__(parent)
        label = label.strip()
        if not label:
            raise ValueError("label não pode ser vazio.")

        text = wx.StaticText(self, label=label)
        self.control = wx.adv.DatePickerCtrl(self, style=wx.adv.DP_DROPDOWN | wx.adv.DP_SHOWCENTURY)
        self.control.SetName(label)

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(text, 0, wx.BOTTOM, 4)
        sizer.Add(self.control, 0, wx.EXPAND)
        self.SetSizer(sizer)

    def get_value(self) -> wx.DateTime:
        return self.control.GetValue()

    def set_value(self, value: wx.DateTime) -> None:
        if not value.IsValid():
            raise ValueError("value deve ser uma data válida.")
        self.control.SetValue(value)
