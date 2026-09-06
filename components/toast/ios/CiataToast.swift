import SwiftUI

/// Implementação experimental do CMP-0012 Toast para SwiftUI.
public struct CiataToast: View {
    private let message: String
    private let actionLabel: String?
    private let action: (() -> Void)?

    public init(
        message: String,
        actionLabel: String? = nil,
        action: (() -> Void)? = nil
    ) {
        let normalizedMessage = message.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedActionLabel = actionLabel?.trimmingCharacters(in: .whitespacesAndNewlines)

        precondition(!normalizedMessage.isEmpty, "message não pode ser vazio")
        precondition((normalizedActionLabel == nil) == (action == nil), "actionLabel e action devem ser fornecidos juntos")
        precondition(normalizedActionLabel == nil || !normalizedActionLabel!.isEmpty, "actionLabel não pode ser vazio")

        self.message = normalizedMessage
        self.actionLabel = normalizedActionLabel
        self.action = action
    }

    public var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(message)
                .frame(maxWidth: .infinity, alignment: .leading)
            if let actionLabel, let action {
                Button(actionLabel, action: action)
            }
        }
        .padding()
        .accessibilityElement(children: .contain)
    }
}
