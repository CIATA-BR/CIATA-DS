import SwiftUI

/// Implementação experimental do CMP-0006 Link para SwiftUI.
public struct CiataLink: View {
    private let label: String
    private let destination: URL
    private let opensNewContext: Bool

    public init(
        _ label: String,
        destination: URL,
        opensNewContext: Bool = false
    ) {
        precondition(!label.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, "label não pode ser vazio")
        self.label = label
        self.destination = destination
        self.opensNewContext = opensNewContext
    }

    public var body: some View {
        Link(destination: destination) {
            Text(opensNewContext ? "\(label) (abre em novo contexto)" : label)
                .underline()
        }
    }
}
