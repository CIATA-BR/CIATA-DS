"""Implementação experimental do CMP-0003 Checkbox para wxPython."""

from __future__ import annotations

from typing import Callable, Optional

import wx


class CiataCheckbox(wx.Panel):
    """Checkbox composto preservando o wx.CheckBox nativo.

    Mantém nome, papel, estado e acionamento nativos. Ajuda e erro ficam
    separados visualmente; ``on_status`` permite ao aplicativo consumidor
    escolher o mecanismo apropriado de anúncio acessível.
    """

    def __init__(
        self,
        parent: wx.Window,
        label: str,
        *,
        checked: bool = False,
        help_text: str = "",
        required: bool = False,
        disabled: bool = False,
        allow_mixed: bool = False,
        on_change: Optional[Callable[[int], None]] = None,
        on_status: Optional[Callable[[str], None]] = None,
        **kwargs,
    ) -> None:
        super().__init__(parent)

        if not label.strip():
            raise ValueError("label não pode ser vazio.")

        self._base_label = label.strip()
        self._help_text = help_text.strip()
        self._on_change = on_change
        self._on_status = on_status
        self._error = ""

        style = kwargs.pop("style", 0)
        if allow_mixed:
            style |= wx.CHK_3STATE | wx.CHK_ALLOW_3RD_STATE_FOR_USER

        visible_label = f"{self._base_label} (obrigatório)" if required else self._base_label
        self.checkbox = wx.CheckBox(self, label=visible_label, style=style, **kwargs)
        self.checkbox.SetName(visible_label)
        self.checkbox.SetValue(bool(checked))
        self.checkbox.Enable(not disabled)

        self.help = wx.StaticText(self, label=self._help_text)
        self.error = wx.StaticText(self, label="")

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.checkbox, 0, wx.EXPAND)
        if self._help_text:
            sizer.Add(self.help, 0, wx.TOP | wx.LEFT, 4)
        sizer.Add(self.error, 0, wx.TOP | wx.LEFT, 4)
        self.SetSizer(sizer)

        self.checkbox.Bind(wx.EVT_CHECKBOX, self._handle_change)

    def _handle_change(self, event: wx.CommandEvent) -> None:
        if self._on_change is not None:
            self._on_change(self.get_state())
        event.Skip()

    def get_state(self) -> int:
        if self.checkbox.Is3State():
            return int(self.checkbox.Get3StateValue())
        return int(wx.CHK_CHECKED if self.checkbox.GetValue() else wx.CHK_UNCHECKED)

    def set_checked(self, checked: bool) -> None:
        self.checkbox.SetValue(bool(checked))

    def set_mixed(self) -> None:
        if not self.checkbox.Is3State():
            raise ValueError("Checkbox não foi criado com allow_mixed=True.")
        self.checkbox.Set3StateValue(wx.CHK_UNDETERMINED)

    def set_disabled(self, disabled: bool) -> None:
        self.checkbox.Enable(not bool(disabled))

    def set_error(self, message: str, *, announce: bool = True) -> None:
        self._error = message.strip()
        self.error.SetLabel(self._error)
        description = ". ".join(part for part in (self._help_text, self._error) if part)
        self.checkbox.SetHelpText(description)

        if self._error and announce and self._on_status is not None:
            self._on_status(f"{self._base_label}: {self._error}")
        self.Layout()

    def clear_error(self) -> None:
        self.set_error("", announce=False)
