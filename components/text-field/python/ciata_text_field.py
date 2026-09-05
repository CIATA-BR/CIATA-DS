"""Implementação experimental do CMP-0002 TextField para wxPython."""

from __future__ import annotations

from typing import Callable, Optional

import wx


class CiataTextField(wx.Panel):
    """Campo de texto composto por label persistente + wx.TextCtrl nativo.

    Mantém o controle editável nativo e separa ajuda, erro, readonly e disabled.
    O callback ``on_status`` permite que o aplicativo consumidor escolha o
    mecanismo de anúncio acessível adequado ao contexto.
    """

    def __init__(
        self,
        parent: wx.Window,
        label: str,
        *,
        value: str = "",
        help_text: str = "",
        required: bool = False,
        readonly: bool = False,
        disabled: bool = False,
        password: bool = False,
        multiline: bool = False,
        max_length: Optional[int] = None,
        on_status: Optional[Callable[[str], None]] = None,
        **kwargs,
    ) -> None:
        super().__init__(parent)

        label = label.strip()
        if not label:
            raise ValueError("label não pode ser vazio.")
        if password and multiline:
            raise ValueError("password e multiline não podem ser combinados.")
        if max_length is not None and max_length <= 0:
            raise ValueError("max_length deve ser maior que zero.")

        self._base_label = label
        self._required = bool(required)
        self._help_text = help_text.strip()
        self._on_status = on_status
        self._error = ""

        style = kwargs.pop("style", 0)
        if password:
            style |= wx.TE_PASSWORD
        if multiline:
            style |= wx.TE_MULTILINE
        if readonly:
            style |= wx.TE_READONLY

        self.label = wx.StaticText(self, label=self._visible_label())
        self.text = wx.TextCtrl(self, value=value, style=style, **kwargs)
        self.help = wx.StaticText(self, label=self._help_text)
        self.error = wx.StaticText(self, label="")

        self.text.SetName(self._accessible_name())

        if max_length is not None:
            self.text.SetMaxLength(max_length)

        self.text.Enable(not disabled)

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.label, 0, wx.BOTTOM, 4)
        sizer.Add(self.text, 0 if not multiline else 1, wx.EXPAND)
        if self._help_text:
            sizer.Add(self.help, 0, wx.TOP, 4)
        sizer.Add(self.error, 0, wx.TOP, 4)
        self.SetSizer(sizer)

    def _visible_label(self) -> str:
        return f"{self._base_label} (obrigatório)" if self._required else self._base_label

    def _accessible_name(self) -> str:
        return self._visible_label()

    def get_value(self) -> str:
        return self.text.GetValue()

    def set_value(self, value: str) -> None:
        self.text.SetValue(value)

    def set_readonly(self, readonly: bool) -> None:
        self.text.SetEditable(not bool(readonly))

    def set_disabled(self, disabled: bool) -> None:
        self.text.Enable(not bool(disabled))

    def set_error(self, message: str, *, announce: bool = True) -> None:
        """Atualiza erro sem mover foco e sem anunciar por caractere automaticamente."""

        self._error = message.strip()
        self.error.SetLabel(self._error)

        description_parts = [part for part in (self._help_text, self._error) if part]
        description = ". ".join(description_parts)
        self.text.SetHelpText(description)

        if self._error and announce and self._on_status is not None:
            self._on_status(f"{self._base_label}: {self._error}")

        self.Layout()

    def clear_error(self) -> None:
        self.set_error("", announce=False)
