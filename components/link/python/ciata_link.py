"""Implementação experimental do CMP-0006 Link para wxPython."""

from __future__ import annotations

from typing import Callable, Optional

import wx
import wx.adv


class CiataLink(wx.Panel):
    """Link composto preservando wx.adv.HyperlinkCtrl nativo."""

    def __init__(
        self,
        parent: wx.Window,
        label: str,
        url: str,
        *,
        help_text: str = "",
        external_context: bool = False,
        new_context_label: str = "abre em novo contexto",
        on_activate: Optional[Callable[[str], None]] = None,
    ) -> None:
        super().__init__(parent)

        self._label = label.strip()
        self._url = url.strip()
        normalized_new_context_label = new_context_label.strip()
        if not self._label:
            raise ValueError("label não pode ser vazio.")
        if not self._url:
            raise ValueError("url não pode ser vazia.")
        if external_context and not normalized_new_context_label:
            raise ValueError(
                "new_context_label não pode ser vazio quando external_context estiver ativo."
            )

        visible_label = self._label
        if external_context:
            visible_label = f"{visible_label} ({normalized_new_context_label})"

        normalized_help_text = help_text.strip()
        self.link = wx.adv.HyperlinkCtrl(self, label=visible_label, url=self._url)
        self.link.SetName(visible_label)
        self.link.SetHelpText(normalized_help_text)
        self._on_activate = on_activate

        if on_activate is not None:
            self.link.Bind(wx.adv.EVT_HYPERLINK, self._handle_activate)

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.link, 0, wx.EXPAND)
        if normalized_help_text:
            sizer.Add(wx.StaticText(self, label=normalized_help_text), 0, wx.TOP, 4)
        self.SetSizer(sizer)

    def _handle_activate(self, event: wx.adv.HyperlinkEvent) -> None:
        if self._on_activate is not None:
            self._on_activate(self._url)
        event.Skip()

    def set_url(self, url: str) -> None:
        value = url.strip()
        if not value:
            raise ValueError("url não pode ser vazia.")
        self._url = value
        self.link.SetURL(value)
