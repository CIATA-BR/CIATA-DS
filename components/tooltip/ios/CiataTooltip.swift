import SwiftUI

/// Implementação experimental do CMP-0017 Tooltip para SwiftUI.
public struct CiataTooltip<Content: View>: View {
    private let text: String
    private let content: Content

    public init(text: String, @ViewBuilder content: () -> Content) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!trimmed.isEmpty, "text não pode ser vazio")
        self.text = trimmed
        self.content = content()
    }

    public var body: some View {
        content
            .accessibilityHint(text)
    }
}
