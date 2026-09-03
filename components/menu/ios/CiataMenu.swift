import SwiftUI

/// Implementação experimental do CMP-0015 Menu para SwiftUI.
public struct CiataMenu: View {
    private let label: String
    private let items: [(String, () -> Void)]

    public init(label: String, items: [(String, () -> Void)]) {
        let trimmed = label.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!trimmed.isEmpty, "label não pode ser vazio")
        precondition(!items.isEmpty, "items não pode ser vazio")
        precondition(items.allSatisfy { !$0.0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }, "rótulos não podem ser vazios")
        self.label = trimmed
        self.items = items
    }

    public var body: some View {
        Menu(label) {
            ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                Button(item.0, action: item.1)
            }
        }
    }
}
