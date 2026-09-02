import wx

from ciata_text_field import CiataTextField


class ExampleFrame(wx.Frame):
    def __init__(self) -> None:
        super().__init__(None, title="CMP-0002 TextField")
        panel = wx.Panel(self)
        self.status = wx.StaticText(panel, label="")

        field = CiataTextField(
            panel,
            "Nome completo",
            required=True,
            help_text="Digite seu nome como consta no documento.",
            on_status=self.announce,
        )

        password = CiataTextField(
            panel,
            "Senha",
            password=True,
            help_text="Use uma senha forte.",
            on_status=self.announce,
        )

        button = wx.Button(panel, label="Validar")
        button.Bind(wx.EVT_BUTTON, lambda event: field.set_error("Informe nome e sobrenome."))

        sizer = wx.BoxSizer(wx.VERTICAL)
        sizer.Add(field, 0, wx.EXPAND | wx.ALL, 12)
        sizer.Add(password, 0, wx.EXPAND | wx.LEFT | wx.RIGHT | wx.BOTTOM, 12)
        sizer.Add(button, 0, wx.LEFT | wx.RIGHT | wx.BOTTOM, 12)
        sizer.Add(self.status, 0, wx.LEFT | wx.RIGHT | wx.BOTTOM, 12)
        panel.SetSizer(sizer)
        self.Fit()

    def announce(self, message: str) -> None:
        self.status.SetLabel(message)


if __name__ == "__main__":
    app = wx.App()
    frame = ExampleFrame()
    frame.Show()
    app.MainLoop()
