import SwiftUI

/// Implementação experimental do CMP-0016 Breadcrumb para SwiftUI.
public struct CiataBreadcrumb: View {
    public struct Item: Identifiable {
        public let id = UUID()
        public let label: String
        public let action: (() -> Void)?

        public init(label: String, action: (() -> Void)? = nil) {
            let normalizedLabel = label.trimmingCharacters(in: .whitespacesAndNewlines)
            precondition(!normalizedLabel.isEmpty, "label não pode ser vazio")
            self.label = normalizedLabel
            self.action = action
        }
    }

    private let items: [Item]

    public init(items: [Item]) {
        precondition(!items.isEmpty, "items não pode ser vazio")
        precondition(items.last?.action == nil, "o item atual deve ser não interativo")
        precondition(items.dropLast().allSatisfy { $0.action != nil }, "itens anteriores ao atual devem ser interativos")
        self.items = items
    }

    public var body: some View {
        HStack(spacing: 8) {
            ForEach(items) { item in
                if let action = item.action {
                    Button(item.label, action: action)
                } else {
                    Text(item.label)
                }
            }
        }
    }
}
