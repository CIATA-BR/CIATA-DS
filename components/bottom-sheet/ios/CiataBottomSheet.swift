import SwiftUI

/// Implementação experimental do CMP-0018 Bottom Sheet para SwiftUI.
public struct CiataBottomSheet<Content: View>: ViewModifier {
    @Binding private var isPresented: Bool
    private let title: String
    private let content: () -> Content

    public init(
        isPresented: Binding<Bool>,
        title: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!trimmed.isEmpty, "title não pode ser vazio")
        self._isPresented = isPresented
        self.title = trimmed
        self.content = content
    }

    public func body(content host: ContentOf<Self>) -> some View {
        host.sheet(isPresented: $isPresented) {
            VStack(alignment: .leading, spacing: 16) {
                Text(title)
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
                self.content()
                Button("Fechar") { isPresented = false }
            }
            .padding()
        }
    }
}
