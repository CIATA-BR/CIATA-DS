"""Implementação experimental do CMP-0011 Pagination para wxPython."""

from __future__ import annotations

from collections.abc import Callable

import wx


class CiataPagination(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        current_page: int,
        total_pages: int,
        on_page_change: Callable[[int], None],
    ) -> None:
        super().__init__(parent)
        if total_pages < 1:
            raise ValueError("total_pages deve ser maior que zero.")
        if not 1 <= current_page <= total_pages:
            raise ValueError("current_page deve estar dentro do intervalo válido.")

        sizer = wx.BoxSizer(wx.HORIZONTAL)
        previous = wx.Button(self, label="Anterior")
        previous.Enable(current_page > 1)
        previous.Bind(wx.EVT_BUTTON, lambda _event: on_page_change(current_page - 1))
        sizer.Add(previous, 0, wx.RIGHT, 6)

        for page in range(1, total_pages + 1):
            button = wx.Button(self, label=str(page))
            button.SetName(f"Página {page}" + (", atual" if page == current_page else ""))
            button.Enable(page != current_page)
            button.Bind(wx.EVT_BUTTON, lambda _event, p=page: on_page_change(p))
            sizer.Add(button, 0, wx.RIGHT, 6)

        next_button = wx.Button(self, label="Próxima")
        next_button.Enable(current_page < total_pages)
        next_button.Bind(wx.EVT_BUTTON, lambda _event: on_page_change(current_page + 1))
        sizer.Add(next_button)
        self.SetSizer(sizer)
