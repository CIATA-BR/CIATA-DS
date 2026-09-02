"""Implementação experimental do CMP-0005 Select para wxPython."""

from __future__ import annotations

from typing import Callable, Optional, Sequence, Tuple

import wx

SelectOption = Tuple[str, str]


class CiataSelect(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        label: str,
        options: Sequence[SelectOption],
        *,
        selected_value: Optional[str] = None,
        help_text: str = "",
        required: bool = False,
        disabled: bool = False,
        on_change: Optional[Callable[[str], None]] = None,
        on_status: Optional[Callable[[str], None]] = None,
    ) -> None:
        super().__init__(parent)
        self._label = label.strip()
        if not self._label:
            raise ValueError("label não pode ser vazio.")
        if not options:
            raise ValueError("options não pode ser vazio.")
        self._options = list(options)
        self._help_text = help_text.strip()
        self._on_change = on_change
        self._on_status = on_status
        self._error = ""

        visible_label = f"{self._label} (obrigatório)" if required else self._label
        self.label = wx.StaticText(self, label=visible_label)
        self.choice = wx.Choice(self, choices=[text for _, text in self._options])
        self.choice.SetName(visible_label)
        self.help = wx.StaticText(self, label=self._help_text)
        self.error = wx.StaticText(self, label="")

        if selected_value is not None:
            self.set_value(selected_value)
        self.choice.Enable(not disabled)
        self.choice.Bind(wx.EVT_CHOICE, self._handle_change)

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.label, 0, wx.BOTTOM, 4)
        sizer.Add(self.choice, 0, wx.EXPAND)
        if self._help_text:
            sizer.Add(self.help, 0, wx.TOP, 4)
        sizer.Add(self.error, 0, wx.TOP, 4)
        self.SetSizer(sizer)

    def _handle_change(self, event: wx.CommandEvent) -> None:
        value = self.get_value()
        if value is not None and self._on_change is not None:
            self._on_change(value)
        event.Skip()

    def get_value(self) -> Optional[str]:
        index = self.choice.GetSelection()
        return None if index == wx.NOT_FOUND else self._options[index][0]

    def set_value(self, value: str) -> None:
        values = [item[0] for item in self._options]
        if value not in values:
            raise ValueError("value não pertence às opções.")
        self.choice.SetSelection(values.index(value))

    def set_disabled(self, disabled: bool) -> None:
        self.choice.Enable(not bool(disabled))

    def set_error(self, message: str, *, announce: bool = True) -> None:
        self._error = message.strip()
        self.error.SetLabel(self._error)
        self.choice.SetHelpText(". ".join(p for p in (self._help_text, self._error) if p))
        if self._error and announce and self._on_status is not None:
            self._on_status(f"{self._label}: {self._error}")
        self.Layout()
