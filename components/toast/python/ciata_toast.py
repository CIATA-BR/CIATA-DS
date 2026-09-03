"""Implementação experimental do CMP-0012 Toast para wxPython."""

from __future__ import annotations

from collections.abc import Callable

import wx


class CiataToast(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        message: str,
        *,
        action_label: str | None = None,
        on_action: Callable[[], None] | None = None,
        dismiss_label: str | None = None,
        on_dismiss: Callable[[], None] | None = None,
    ) -> None:
        super().__init__(parent)
        if not message.strip():
            raise ValueError("message não pode ser vazio.")
        if (action_label is None) != (on_action is None):
            raise ValueError("action_label e on_action devem ser fornecidos juntos.")
        if (dismiss_label is None) != (on_dismiss is None):
            raise ValueError("dismiss_label e on_dismiss devem ser fornecidos juntos.")

        sizer = wx.BoxSizer(wx.HORIZONTAL)
        self.message = wx.StaticText(self, label=message.strip())
        self.message.Wrap(480)
        sizer.Add(self.message, 1, wx.ALIGN_CENTER_VERTICAL | wx.RIGHT, 8)

        if action_label and on_action:
            action = wx.Button(self, label=action_label)
            action.Bind(wx.EVT_BUTTON, lambda _event: on_action())
            sizer.Add(action, 0, wx.RIGHT, 6)

        if dismiss_label and on_dismiss:
            dismiss = wx.Button(self, label=dismiss_label)
            dismiss.Bind(wx.EVT_BUTTON, lambda _event: on_dismiss())
            sizer.Add(dismiss)

        self.SetSizer(sizer)
