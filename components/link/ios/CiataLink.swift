import SwiftUI

/// Implementação experimental do CMP-0006 Link para SwiftUI.
public struct CiataLink: View {
    private let label: String
    private let destination: URL
    private let opensNewContext: Bool
    private let newContextLabel: String

    public init(
        _ label: String,
        destination: URL,
        opensNewContext: Bool = false,
        newContextLabel: String = "abre em novo contexto"
    ) {
        let normalizedLabel = label.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedNewContextLabel = newContextLabel.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!normalizedLabel.isEmpty, "label não pode ser vazio")
        precondition(!opensNewContext || !normalizedNewContextLabel.isEmpty, "newContextLabel não pode ser vazio quando opensNewContext estiver ativo")
        self.label = normalizedLabel
        self.destination = destination
        self.opensNewContext = opensNewContext
        self.newContextLabel = normalizedNewContextLabel
    }

    public var body: some View {
        Link(destination: destination) {
            Text(opensNewContext ? "\(label) (\(newContextLabel))" : label)
                .underline()
        }
    }
}
