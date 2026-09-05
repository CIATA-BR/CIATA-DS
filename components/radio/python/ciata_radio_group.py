"""Implementação experimental do CMP-0004 Radio para wxPython."""

from __future__ import annotations

from typing import Callable, Iterable, Optional, Sequence, Tuple

import wx


RadioOption = Tuple[str, str]


class CiataRadioGroup(wx.Panel):
    """Grupo de opções exclusivas preservando controles nativos wx.RadioButton."""

    def __init__(
        self,
        parent: wx.Window,
        legend: str,
        options: Sequence[RadioOption] | Iterable[RadioOption],
        *,
        selected_value: Optional[str] = None,
        help_text: str = "",
        required: bool = False,
        disabled: bool = False,
        on_change: Optional[Callable[[str], None]] = None,
        on_status: Optional[Callable[[str], None]] = None,
    ) -> None:
        super().__init__(parent)

        self._legend = legend.strip()
        if not self._legend:
            raise ValueError("legend não pode ser vazio.")

        raw_options = list(options)
        if len(raw_options) < 2:
            raise ValueError("Radio Group deve possuir ao menos duas opções.")

        self._options = [(value, label.strip()) for value, label in raw_options]
        values = [value for value, _ in self._options]
        labels = [label for _, label in self._options]
        if any(not label for label in labels):
            raise ValueError("Rótulos das opções não podem ser vazios.")
        if len(values) != len(set(values)):
            raise ValueError("Valores das opções devem ser únicos.")
        if selected_value is not None and selected_value not in set(values):
            raise ValueError("selected_value não pertence às opções do grupo.")

        self._help_text = help_text.strip()
        self._on_change = on_change
        self._on_status = on_status
        self._error = ""
        self._buttons: list[wx.RadioButton] = []

        visible_legend = f"{self._legend} (obrigatório)" if required else self._legend
        self.legend = wx.StaticText(self, label=visible_legend)
        self.help = wx.StaticText(self, label=self._help_text)
        self.error = wx.StaticText(self, label="")

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.legend, 0, wx.BOTTOM, 4)

        for index, (value, label) in enumerate(self._options):
            style = wx.RB_GROUP if index == 0 else 0
            button = wx.RadioButton(self, label=label, style=style)
            button.SetName(label)
            button.SetClientData(value)
            button.Enable(not disabled)
            button.Bind(wx.EVT_RADIOBUTTON, self._handle_change)
            if selected_value is not None and value == selected_value:
                button.SetValue(True)
            self._buttons.append(button)
            sizer.Add(button, 0, wx.EXPAND | wx.BOTTOM, 4)

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
        for button in self._buttons:
            if button.GetValue():
                return str(button.GetClientData())
        return None

    def set_value(self, value: Optional[str]) -> None:
        if value is not None and value not in {item[0] for item in self._options}:
            raise ValueError("value não pertence ao grupo.")
        for button in self._buttons:
            button.SetValue(value is not None and str(button.GetClientData()) == value)

    def set_disabled(self, disabled: bool) -> None:
        for button in self._buttons:
            button.Enable(not bool(disabled))

    def set_error(self, message: str, *, announce: bool = True) -> None:
        self._error = message.strip()
        self.error.SetLabel(self._error)
        description = ". ".join(part for part in (self._help_text, self._error) if part)
        for button in self._buttons:
            button.SetHelpText(description)

        if self._error and announce and self._on_status is not None:
            self._on_status(f"{self._legend}: {self._error}")
        self.Layout()

    def clear_error(self) -> None:
        self.set_error("", announce=False)
