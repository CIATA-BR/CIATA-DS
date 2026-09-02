"""Exemplo mínimo de uso do CiataButton em wxPython."""

import wx

from ciata_button import CiataButton


class ExampleFrame(wx.Frame):
    def __init__(self) -> None:
        super().__init__(None, title="CIATA Button — exemplo wxPython")

        panel = wx.Panel(self)
        self.CreateStatusBar()

        self.save_button = CiataButton(
            panel,
            "Salvar alterações",
            on_activate=self.on_save,
            on_status=self.SetStatusText,
        )

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(self.save_button, 0, wx.ALL, 16)
        panel.SetSizerAndFit(sizer)
        self.Fit()

    def on_save(self, event: wx.CommandEvent) -> None:
        self.save_button.set_loading(True)
        wx.CallLater(1500, lambda: self.save_button.set_loading(False))


if __name__ == "__main__":
    app = wx.App()
    frame = ExampleFrame()
    frame.Show()
    app.MainLoop()
