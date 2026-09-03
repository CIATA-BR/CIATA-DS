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

        sizer = wx.BoxSizer(wx.HORIZONTAL)
        for index, (label, action) in enumerate(items):
            label = label.strip()
            if not label:
                raise ValueError("rótulo não pode ser vazio.")
            if index:
                sizer.Add(wx.StaticText(self, label="/"), 0, wx.ALIGN_CENTER_VERTICAL | wx.LEFT | wx.RIGHT, 6)
            if action is None:
                sizer.Add(wx.StaticText(self, label=label), 0, wx.ALIGN_CENTER_VERTICAL)
            else:
                link = wx.Button(self, label=label, style=wx.BU_EXACTFIT)
                link.Bind(wx.EVT_BUTTON, lambda _event, callback=action: callback())
                sizer.Add(link, 0, wx.ALIGN_CENTER_VERTICAL)
        self.SetSizer(sizer)
