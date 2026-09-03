import SwiftUI

/// Implementação experimental do CMP-0021 Search para SwiftUI.
public struct CiataSearch: View {
    private let label: String
    @Binding private var value: String
    private let onSubmit: () -> Void

    public init(label: String, value: Binding<String>, onSubmit: @escaping () -> Void) {
        let trimmed = label.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!trimmed.isEmpty, "label não pode ser vazio")
        self.label = trimmed
        self._value = value
        self.onSubmit = onSubmit
    }

    public var body: some View {
        TextField(label, text: $value)
            .textInputAutocapitalization(.never)
            .submitLabel(.search)
            .onSubmit(onSubmit)
    }
}
