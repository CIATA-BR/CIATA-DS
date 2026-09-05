import SwiftUI

/// Implementação experimental do CMP-0017 Tooltip para SwiftUI.
public struct CiataTooltip<Content: View>: View {
    private let text: String
    private let appliesAccessibilityHint: Bool
    private let content: Content

    public init(
        text: String,
        appliesAccessibilityHint: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!trimmed.isEmpty, "text não pode ser vazio")
        self.text = trimmed
        self.appliesAccessibilityHint = appliesAccessibilityHint
        self.content = content()
    }

    @ViewBuilder
    public var body: some View {
        if appliesAccessibilityHint {
            content
                .accessibilityHint(text)
        } else {
            content
        }
    }
}
