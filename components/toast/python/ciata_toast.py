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

        normalized_message = message.strip()
        normalized_action_label = action_label.strip() if action_label is not None else None
        normalized_dismiss_label = dismiss_label.strip() if dismiss_label is not None else None

        if not normalized_message:
            raise ValueError("message não pode ser vazio.")
        if (normalized_action_label is None) != (on_action is None):
            raise ValueError("action_label e on_action devem ser fornecidos juntos.")
        if normalized_action_label is not None and not normalized_action_label:
            raise ValueError("action_label não pode ser vazio.")
        if (normalized_dismiss_label is None) != (on_dismiss is None):
            raise ValueError("dismiss_label e on_dismiss devem ser fornecidos juntos.")
        if normalized_dismiss_label is not None and not normalized_dismiss_label:
            raise ValueError("dismiss_label não pode ser vazio.")

        sizer = wx.BoxSizer(wx.HORIZONTAL)
        self.message = wx.StaticText(self, label=normalized_message)
        self.message.Wrap(480)
        sizer.Add(self.message, 1, wx.ALIGN_CENTER_VERTICAL | wx.RIGHT, 8)

        if normalized_action_label is not None and on_action is not None:
            action = wx.Button(self, label=normalized_action_label)
            action.SetName(normalized_action_label)
            action.Bind(wx.EVT_BUTTON, lambda _event: on_action())
            sizer.Add(action, 0, wx.RIGHT, 6)

        if normalized_dismiss_label is not None and on_dismiss is not None:
            dismiss = wx.Button(self, label=normalized_dismiss_label)
            dismiss.SetName(normalized_dismiss_label)
            dismiss.Bind(wx.EVT_BUTTON, lambda _event: on_dismiss())
            sizer.Add(dismiss)

        self.SetSizer(sizer)
