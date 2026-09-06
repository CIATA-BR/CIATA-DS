import SwiftUI

/// Implementação experimental do CMP-0015 Menu para SwiftUI.
public struct CiataMenu: View {
    private let label: String
    private let items: [(String, () -> Void)]

    public init(label: String, items: [(String, () -> Void)]) {
        let normalizedLabel = label.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedItems = items.map { item in
            (item.0.trimmingCharacters(in: .whitespacesAndNewlines), item.1)
        }

        precondition(!normalizedLabel.isEmpty, "label não pode ser vazio")
        precondition(!normalizedItems.isEmpty, "items não pode ser vazio")
        precondition(normalizedItems.allSatisfy { !$0.0.isEmpty }, "rótulos não podem ser vazios")
        self.label = normalizedLabel
        self.items = normalizedItems
    }

    public var body: some View {
        Menu(label) {
            ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                Button(item.0, action: item.1)
            }
        }
    }
}
