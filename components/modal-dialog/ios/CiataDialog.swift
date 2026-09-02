import SwiftUI

/// Implementação experimental do CMP-0008 Modal/Dialog para SwiftUI.
public struct CiataDialogModifier: ViewModifier {
    @Binding private var isPresented: Bool
    private let title: String
    private let message: String
    private let confirmLabel: String
    private let onConfirm: () -> Void

    public init(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        confirmLabel: String,
        onConfirm: @escaping () -> Void
    ) {
        precondition(!title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "title não pode ser vazio")
        precondition(!confirmLabel.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "confirmLabel não pode ser vazio")
        self._isPresented = isPresented
        self.title = title
        self.message = message
        self.confirmLabel = confirmLabel
        self.onConfirm = onConfirm
    }

    public func body(content: Content) -> some View {
        content.alert(title, isPresented: $isPresented) {
            Button("Cancelar", role: .cancel) {}
            Button(confirmLabel) { onConfirm() }
        } message: {
            Text(message)
        }
    }
}
