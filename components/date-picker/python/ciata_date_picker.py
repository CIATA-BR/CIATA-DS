"""Implementação experimental do CMP-0019 Date Picker para wxPython."""

from __future__ import annotations

import wx
import wx.adv


class CiataDatePicker(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        label: str,
        *,
        value: wx.DateTime | None = None,
        min_value: wx.DateTime | None = None,
        max_value: wx.DateTime | None = None,
    ) -> None:
        super().__init__(parent)
        label = label.strip()
        if not label:
            raise ValueError("label não pode ser vazio.")

        for field, date in (("value", value), ("min_value", min_value), ("max_value", max_value)):
            if date is not None and not date.IsValid():
                raise ValueError(f"{field} deve ser uma data válida.")
        if min_value is not None and max_value is not None and min_value.IsLaterThan(max_value):
            raise ValueError("min_value deve ser anterior ou igual a max_value.")
        if value is not None:
            if min_value is not None and value.IsEarlierThan(min_value):
                raise ValueError("value deve estar dentro do intervalo permitido.")
            if max_value is not None and value.IsLaterThan(max_value):
                raise ValueError("value deve estar dentro do intervalo permitido.")

        text = wx.StaticText(self, label=label)
        self.control = wx.adv.DatePickerCtrl(self, style=wx.adv.DP_DROPDOWN | wx.adv.DP_SHOWCENTURY)
        self.control.SetName(label)

        if min_value is not None or max_value is not None:
            lower = min_value if min_value is not None else wx.DefaultDateTime
            upper = max_value if max_value is not None else wx.DefaultDateTime
            self.control.SetRange(lower, upper)
        if value is not None:
            self.control.SetValue(value)

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
