import SwiftUI

/// Implementação experimental do CMP-0014 Accordion para SwiftUI.
public struct CiataAccordion<Content: View>: View {
    private let labels: [String]
    @Binding private var expanded: Set<Int>
    private let content: (Int) -> Content

    public init(
        labels: [String],
        expanded: Binding<Set<Int>>,
        @ViewBuilder content: @escaping (Int) -> Content
    ) {
        let normalizedLabels = labels.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }

        precondition(!normalizedLabels.isEmpty, "labels não pode ser vazio")
        precondition(normalizedLabels.allSatisfy { !$0.isEmpty }, "rótulos não podem ser vazios")
        precondition(expanded.wrappedValue.allSatisfy { normalizedLabels.indices.contains($0) }, "expanded contém índice inválido")
        self.labels = normalizedLabels
        self._expanded = expanded
        self.content = content
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(labels.indices, id: \.self) { index in
                DisclosureGroup(
                    isExpanded: Binding(
                        get: { expanded.contains(index) },
                        set: { isOpen in
                            if isOpen { expanded.insert(index) }
                            else { expanded.remove(index) }
                        }
                    ),
                    content: { content(index) },
                    label: { Text(labels[index]) }
                )
            }
        }
    }
}
