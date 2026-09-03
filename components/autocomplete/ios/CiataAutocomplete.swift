import SwiftUI

/// Implementação experimental do CMP-0022 Autocomplete para SwiftUI.
public struct CiataAutocomplete: View {
    private let label: String
    private let options: [String]
    @Binding private var value: String
    private let onSelect: (String) -> Void
    @State private var isExpanded = false

    public init(
        label: String,
        value: Binding<String>,
        options: [String],
        onSelect: @escaping (String) -> Void
    ) {
        let trimmed = label.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!trimmed.isEmpty, "label não pode ser vazio")
        precondition(!options.contains { $0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }, "options não pode conter rótulos vazios")
        self.label = trimmed
        self._value = value
        self.options = options
        self.onSelect = onSelect
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextField(label, text: $value)
                .onChange(of: value) { _, newValue in
                    isExpanded = !newValue.isEmpty && !options.isEmpty
                }
            if isExpanded {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        value = option
                        onSelect(option)
                        isExpanded = false
                    }
                }
            }
        }
    }
}
