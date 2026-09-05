import SwiftUI

/// Implementação experimental do CMP-0009 Loading/Progress para SwiftUI.
public struct CiataProgress: View {
    private let label: String
    private let value: Double?

    public init(label: String, value: Double? = nil) {
        let normalizedLabel = label.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!normalizedLabel.isEmpty, "label não pode ser vazio")
        precondition(value == nil || value!.isFinite, "value deve ser finito quando informado")
        self.label = normalizedLabel
        self.value = value
    }

    public var body: some View {
        if let value {
            let safe = min(max(value, 0), 1)
            ProgressView(value: safe) {
                Text(label)
            } currentValueLabel: {
                Text("\(Int((safe * 100).rounded()))%")
            }
        } else {
            ProgressView(label)
        }
    }
}
