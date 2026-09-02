import SwiftUI

public struct CiataRadioOption: Identifiable, Hashable {
    public let id: String
    public let label: String
    public let enabled: Bool

    public init(value: String, label: String, enabled: Bool = true) {
        self.id = value
        self.label = label
        self.enabled = enabled
    }
}

/// Implementação experimental do CMP-0004 Radio para SwiftUI.
public struct CiataRadioGroup: View {
    private let legend: String
    private let options: [CiataRadioOption]
    @Binding private var selectedValue: String?
    private let required: Bool
    private let disabled: Bool
    private let helpText: String?
    private let errorText: String?

    public init(
        legend: String,
        options: [CiataRadioOption],
        selectedValue: Binding<String?>,
        required: Bool = false,
        disabled: Bool = false,
        helpText: String? = nil,
        errorText: String? = nil
    ) {
        precondition(!legend.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "legend não pode ser vazio")
        precondition(options.count >= 2, "Radio Group deve possuir ao menos duas opções")
        precondition(options.allSatisfy { !$0.label.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }, "Rótulos não podem ser vazios")
        precondition(Set(options.map(\.id)).count == options.count, "Valores devem ser únicos")

        self.legend = legend
        self.options = options
        self._selectedValue = selectedValue
        self.required = required
        self.disabled = disabled
        self.helpText = helpText
        self.errorText = errorText
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(required ? "\(legend) (obrigatório)" : legend)
                .fontWeight(.semibold)

            Picker(legend, selection: $selectedValue) {
                ForEach(options) { option in
                    Text(option.label)
                        .tag(Optional(option.id))
                        .disabled(!option.enabled)
                }
            }
            .pickerStyle(.inline)
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
