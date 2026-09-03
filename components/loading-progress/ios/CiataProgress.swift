import SwiftUI

/// Implementação experimental do CMP-0009 Loading/Progress para SwiftUI.
public struct CiataProgress: View {
    private let label: String
    private let value: Double?

    public init(label: String, value: Double? = nil) {
        precondition(!label.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "label não pode ser vazio")
        self.label = label
        self.value = value
    }

    public var body: some View {
        if let value {
            let safe = min(max(value, 0), 1)
            ProgressView(value: safe) {
                Text(label)
            } currentValueLabel: {
                Text("\(Int(safe * 100))%")
            }
        } else {
            ProgressView(label)
        }
    }
}
