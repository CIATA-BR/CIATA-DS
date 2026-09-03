"""Implementação experimental do CMP-0014 Accordion para wxPython."""

from __future__ import annotations

from collections.abc import Callable, Sequence

import wx


class CiataAccordion(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        items: Sequence[tuple[str, Callable[[wx.Window], None]]],
    ) -> None:
        super().__init__(parent)
        if not items:
            raise ValueError("items não pode ser vazio.")

        sizer = wx.BoxSizer(wx.VERTICAL)

        for label, build_content in items:
            label = label.strip()
            if not label:
                raise ValueError("rótulo do item não pode ser vazio.")

            pane = wx.CollapsiblePane(self, label=label)
            build_content(pane.GetPane())
            pane.Bind(wx.EVT_COLLAPSIBLEPANE_CHANGED, self._on_changed)
            sizer.Add(pane, 0, wx.EXPAND | wx.TOP, 4)

        self.SetSizer(sizer)

    def _on_changed(self, event: wx.CollapsiblePaneEvent) -> None:
        self.Layout()
        event.Skip()
