"""Implementação experimental do CMP-0020 File Upload para wxPython."""

from __future__ import annotations

from collections.abc import Callable
from pathlib import Path

import wx


class CiataFileUpload(wx.Panel):
    def __init__(
        self,
        parent: wx.Window,
        label: str,
        on_selected: Callable[[list[Path]], None],
        *,
        multiple: bool = False,
        wildcard: str = "Todos os arquivos (*.*)|*.*",
        dialog_title: str | None = None,
    ) -> None:
        super().__init__(parent)
        label = label.strip()
        wildcard = wildcard.strip()
        dialog_title = (dialog_title or ("Selecionar arquivos" if multiple else "Selecionar arquivo")).strip()
        if not label:
            raise ValueError("label não pode ser vazio.")
        if not wildcard:
            raise ValueError("wildcard não pode ser vazio.")
        if not dialog_title:
            raise ValueError("dialog_title não pode ser vazio.")

        self._multiple = multiple
        self._wildcard = wildcard
        self._dialog_title = dialog_title
        self._on_selected = on_selected

        text = wx.StaticText(self, label=label)
        self.button = wx.Button(self, label=dialog_title)
        self.button.SetName(label)
        self.button.Bind(wx.EVT_BUTTON, self._choose)

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(text, 0, wx.BOTTOM, 4)
        sizer.Add(self.button, 0)
        self.SetSizer(sizer)

    def _choose(self, _event: wx.CommandEvent) -> None:
        style = wx.FD_OPEN | wx.FD_FILE_MUST_EXIST
        if self._multiple:
            style |= wx.FD_MULTIPLE
        with wx.FileDialog(self, self._dialog_title, wildcard=self._wildcard, style=style) as dialog:
            if dialog.ShowModal() != wx.ID_OK:
                return
            paths = [Path(path) for path in (dialog.GetPaths() if self._multiple else [dialog.GetPath()])]
            self._on_selected(paths)
