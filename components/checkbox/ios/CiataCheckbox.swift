import SwiftUI

/// Implementação experimental do CMP-0003 Checkbox para SwiftUI.
public struct CiataCheckbox: View {
    private let label: String
    @Binding private var isChecked: Bool
    private let required: Bool
    private let disabled: Bool
    private let helpText: String?
    private let errorText: String?

    public init(
        _ label: String,
        isChecked: Binding<Bool>,
        required: Bool = false,
        disabled: Bool = false,
        helpText: String? = nil,
        errorText: String? = nil
    ) {
        precondition(!label.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "label não pode ser vazio")
        self.label = label
        self._isChecked = isChecked
        self.required = required
        self.disabled = disabled
        self.helpText = helpText
        self.errorText = errorText
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Toggle(isOn: $isChecked) {
                Text(required ? "\(label) (obrigatório)" : label)
            }
            .toggleStyle(.switch)
            .disabled(disabled)
            .accessibilityHint(accessibilityHint)

            if let helpText, !helpText.isEmpty {
                Text(helpText)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            if let errorText, !errorText.isEmpty {
                Text(errorText)
                    .font(.footnote)
                    .accessibilityLabel("Erro: \(errorText)")
            }
        }
    }

    private var accessibilityHint: String {
        [helpText, errorText.map { "Erro: \($0)" }]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .joined(separator: ". ")
    }
}
