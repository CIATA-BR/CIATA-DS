import SwiftUI

/// Implementação experimental do CMP-0007 Alert/Status para SwiftUI.
public struct CiataAlertStatus: View {
    private let message: String
    private let title: String?
    private let priority: String

    public init(
        message: String,
        title: String? = nil,
        priority: String = "status"
    ) {
        let normalizedMessage = message.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedTitle = title?.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedPriority = priority.trimmingCharacters(in: .whitespacesAndNewlines)

        precondition(!normalizedMessage.isEmpty, "message não pode ser vazio")
        precondition(normalizedPriority == "status" || normalizedPriority == "alert", "priority deve ser status ou alert")

        self.message = normalizedMessage
        self.title = normalizedTitle?.isEmpty == false ? normalizedTitle : nil
        self.priority = normalizedPriority
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let title {
                Text(title).fontWeight(.semibold)
            }
            Text(message)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLiveRegion(priority == "alert" ? .assertive : .polite)
    }
}
