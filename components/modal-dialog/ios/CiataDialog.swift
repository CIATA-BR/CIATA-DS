import SwiftUI

/// Implementação experimental do CMP-0008 Modal/Dialog para SwiftUI.
public struct CiataDialogModifier: ViewModifier {
    @Binding private var isPresented: Bool
    private let title: String
    private let message: String
    private let confirmLabel: String
    private let dismissLabel: String
    private let onConfirm: () -> Void

    public init(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        confirmLabel: String,
        dismissLabel: String = "Cancelar",
        onConfirm: @escaping () -> Void
    ) {
        let normalizedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedMessage = message.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedConfirmLabel = confirmLabel.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedDismissLabel = dismissLabel.trimmingCharacters(in: .whitespacesAndNewlines)

        precondition(!normalizedTitle.isEmpty, "title não pode ser vazio")
        precondition(!normalizedConfirmLabel.isEmpty, "confirmLabel não pode ser vazio")
        precondition(!normalizedDismissLabel.isEmpty, "dismissLabel não pode ser vazio")

        self._isPresented = isPresented
        self.title = normalizedTitle
        self.message = normalizedMessage
        self.confirmLabel = normalizedConfirmLabel
        self.dismissLabel = normalizedDismissLabel
        self.onConfirm = onConfirm
    }

    public func body(content: Content) -> some View {
        content.alert(title, isPresented: $isPresented) {
            Button(dismissLabel, role: .cancel) {}
            Button(confirmLabel) { onConfirm() }
        } message: {
            if !message.isEmpty {
                Text(message)
            }
        }
    }
}
