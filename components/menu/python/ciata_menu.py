"""Implementação experimental do CMP-0015 Menu para wxPython."""

from __future__ import annotations

from collections.abc import Callable, Sequence

import wx


class CiataMenuButton(wx.Button):
    def __init__(
        self,
        parent: wx.Window,
        label: str,
        items: Sequence[tuple[str, Callable[[], None], bool]],
    ) -> None:
        label = label.strip()
        if not label:
            raise ValueError("label não pode ser vazio.")
        if not items:
            raise ValueError("items não pode ser vazio.")

        super().__init__(parent, label=label)
        self._items = items
        self.Bind(wx.EVT_BUTTON, self._open_menu)

    def _open_menu(self, _event: wx.CommandEvent) -> None:
        menu = wx.Menu()
        for label, callback, disabled in self._items:
            item = menu.Append(wx.ID_ANY, label.strip())
            item.Enable(not disabled)
            if not disabled:
                self.Bind(wx.EVT_MENU, lambda _event, cb=callback: cb(), item)
        self.PopupMenu(menu)
        menu.Destroy()
