"""Implementação experimental do CMP-0017 Tooltip para wxPython."""

from __future__ import annotations

import wx


def attach_tooltip(control: wx.Window, text: str) -> None:
    """Associa ajuda complementar nativa sem alterar o nome acessível do controle."""
    text = text.strip()
    if not text:
        raise ValueError("text não pode ser vazio.")
    control.SetToolTip(text)
