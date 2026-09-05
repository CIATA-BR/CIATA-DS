import SwiftUI

public struct CiataSelectOption: Identifiable, Hashable {
    public let id: String
    public let label: String
    public let enabled: Bool

    public init(value: String, label: String, enabled: Bool = true) {
        let normalizedLabel = label.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!normalizedLabel.isEmpty, "label não pode ser vazio")
        self.id = value
        self.label = normalizedLabel
        self.enabled = enabled
    }
}

/// Implementação experimental do CMP-0005 Select para SwiftUI.
public struct CiataSelect: View {
    private let label: String
    private let options: [CiataSelectOption]
    @Binding private var selectedValue: String?
    private let required: Bool
    private let disabled: Bool
    private let helpText: String?
    private let errorText: String?
    private let emptySelectionLabel: String

    public init(
        label: String,
        options: [CiataSelectOption],
        selectedValue: Binding<String?>,
        required: Bool = false,
        disabled: Bool = false,
        helpText: String? = nil,
        errorText: String? = nil,
        emptySelectionLabel: String = "Selecione uma opção"
    ) {
        let normalizedLabel = label.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedHelpText = helpText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedErrorText = errorText?.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedEmptySelectionLabel = emptySelectionLabel.trimmingCharacters(in: .whitespacesAndNewlines)

        precondition(!normalizedLabel.isEmpty, "label não pode ser vazio")
        precondition(!options.isEmpty, "options não pode ser vazio")
        precondition(Set(options.map(\.id)).count == options.count, "Valores devem ser únicos")
        precondition(selectedValue.wrappedValue == nil || options.contains { $0.id == selectedValue.wrappedValue }, "selectedValue não pertence às opções do Select")
        precondition(!normalizedEmptySelectionLabel.isEmpty, "emptySelectionLabel não pode ser vazio")

        self.label = normalizedLabel
        self.options = options
        self._selectedValue = selectedValue
        self.required = required
        self.disabled = disabled
        self.helpText = normalizedHelpText
        self.errorText = normalizedErrorText
        self.emptySelectionLabel = normalizedEmptySelectionLabel
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Picker(required ? "\(label) (obrigatório)" : label, selection: $selectedValue) {
                Text(emptySelectionLabel).tag(Optional<String>.none)
                ForEach(options) { option in
                    Text(option.label)
                        .tag(Optional(option.id))
                        .disabled(!option.enabled)
                }
            }
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
