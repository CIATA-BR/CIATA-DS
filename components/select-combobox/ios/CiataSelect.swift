import SwiftUI

public struct CiataSelectOption: Identifiable, Hashable {
    public let id: String
    public let label: String
    public let enabled: Bool

    public init(value: String, label: String, enabled: Bool = true) {
        self.id = value
        self.label = label
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

    public init(
        label: String,
        options: [CiataSelectOption],
        selectedValue: Binding<String?>,
        required: Bool = false,
        disabled: Bool = false,
        helpText: String? = nil,
        errorText: String? = nil
    ) {
        precondition(!label.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "label não pode ser vazio")
        precondition(!options.isEmpty, "options não pode ser vazio")
        precondition(Set(options.map(\.id)).count == options.count, "Valores devem ser únicos")
        self.label = label
        self.options = options
        self._selectedValue = selectedValue
        self.required = required
        self.disabled = disabled
        self.helpText = helpText
        self.errorText = errorText
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Picker(required ? "\(label) (obrigatório)" : label, selection: $selectedValue) {
                Text("Selecione uma opção").tag(Optional<String>.none)
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
