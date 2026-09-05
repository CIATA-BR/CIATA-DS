import SwiftUI

/// Implementação experimental do CMP-0010 Card interativo para SwiftUI.
public struct CiataCard: View {
    private let title: String
    private let description: String?
    private let action: (() -> Void)?

    public init(
        title: String,
        description: String? = nil,
        action: (() -> Void)? = nil
    ) {
        let normalizedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedDescription = description?.trimmingCharacters(in: .whitespacesAndNewlines)

        precondition(!normalizedTitle.isEmpty, "title não pode ser vazio")
        self.title = normalizedTitle
        self.description = normalizedDescription?.isEmpty == false ? normalizedDescription : nil
        self.action = action
    }

    public var body: some View {
        Group {
            if let action {
                Button(action: action) { content }
                    .buttonStyle(.plain)
            } else {
                content
            }
        }
    }

    private var content: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).fontWeight(.semibold)
            if let description {
                Text(description)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}
