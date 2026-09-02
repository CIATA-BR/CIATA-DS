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
        precondition(!message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "message não pode ser vazio")
        precondition(priority == "status" || priority == "alert", "priority deve ser status ou alert")
        self.message = message
        self.title = title
        self.priority = priority
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let title, !title.isEmpty {
                Text(title).fontWeight(.semibold)
            }
            Text(message)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLiveRegion(priority == "alert" ? .assertive : .polite)
    }
}
