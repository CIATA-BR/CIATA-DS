"""Implementação experimental do CMP-0016 Breadcrumb para wxPython."""

from __future__ import annotations

from collections.abc import Callable, Sequence

import wx


class CiataBreadcrumb(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        items: Sequence[tuple[str, Callable[[], None] | None]],
    ) -> None:
        super().__init__(parent)
        if not items:
            raise ValueError("items não pode ser vazio.")

        normalized_items = [(label.strip(), action) for label, action in items]
        if any(not label for label, _action in normalized_items):
            raise ValueError("rótulo não pode ser vazio.")
        if normalized_items[-1][1] is not None:
            raise ValueError("o item atual deve ser não interativo.")
        if any(action is None for _label, action in normalized_items[:-1]):
            raise ValueError("itens anteriores ao atual devem ser interativos.")

        sizer = wx.BoxSizer(wx.HORIZONTAL)
        for index, (label, action) in enumerate(normalized_items):
            if index:
                sizer.AddSpacer(12)
            if action is None:
                current = wx.StaticText(self, label=label)
                current.SetName(label)
                sizer.Add(current, 0, wx.ALIGN_CENTER_VERTICAL)
            else:
                link = wx.Button(self, label=label, style=wx.BU_EXACTFIT)
                link.SetName(label)
                link.Bind(wx.EVT_BUTTON, lambda _event, callback=action: callback())
                sizer.Add(link, 0, wx.ALIGN_CENTER_VERTICAL)
        self.SetSizer(sizer)
