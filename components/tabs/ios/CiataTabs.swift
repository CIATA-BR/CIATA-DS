import SwiftUI

/// Implementação experimental do CMP-0013 Tabs para SwiftUI.
public struct CiataTabs<Content: View>: View {
    private let labels: [String]
    @Binding private var selectedIndex: Int
    private let content: (Int) -> Content

    public init(
        labels: [String],
        selectedIndex: Binding<Int>,
        @ViewBuilder content: @escaping (Int) -> Content
    ) {
        precondition(!labels.isEmpty, "labels não pode ser vazio")
        precondition(labels.allSatisfy { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }, "rótulos não podem ser vazios")
        precondition(labels.indices.contains(selectedIndex.wrappedValue), "selectedIndex fora do intervalo válido")
        self.labels = labels
        self._selectedIndex = selectedIndex
        self.content = content
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Picker("Seções", selection: $selectedIndex) {
                ForEach(labels.indices, id: \.self) { index in
                    Text(labels[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)
            content(selectedIndex)
        }
    }
}
