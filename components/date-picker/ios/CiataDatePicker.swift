import SwiftUI

/// Implementação experimental do CMP-0019 Date Picker para SwiftUI.
public struct CiataDatePicker: View {
    private let label: String
    @Binding private var selection: Date
    private let range: ClosedRange<Date>?

    public init(
        label: String,
        selection: Binding<Date>,
        range: ClosedRange<Date>? = nil
    ) {
        let trimmed = label.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!trimmed.isEmpty, "label não pode ser vazio")
        self.label = trimmed
        self._selection = selection
        self.range = range
    }

    public var body: some View {
        Group {
            if let range {
                DatePicker(label, selection: $selection, in: range, displayedComponents: .date)
            } else {
                DatePicker(label, selection: $selection, displayedComponents: .date)
            }
        }
    }
}
