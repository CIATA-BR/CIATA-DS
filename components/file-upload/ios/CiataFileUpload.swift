import SwiftUI
import UniformTypeIdentifiers

/// Implementação experimental do CMP-0020 File Upload para SwiftUI.
public struct CiataFileUpload: View {
    private let label: String
    private let allowedContentTypes: [UTType]
    private let allowsMultipleSelection: Bool
    private let onSelected: ([URL]) -> Void
    @State private var isImporting = false

    public init(
        label: String,
        allowedContentTypes: [UTType] = [.item],
        allowsMultipleSelection: Bool = false,
        onSelected: @escaping ([URL]) -> Void
    ) {
        let trimmed = label.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!trimmed.isEmpty, "label não pode ser vazio")
        precondition(!allowedContentTypes.isEmpty, "allowedContentTypes não pode ser vazio")
        self.label = trimmed
        self.allowedContentTypes = allowedContentTypes
        self.allowsMultipleSelection = allowsMultipleSelection
        self.onSelected = onSelected
    }

    public var body: some View {
        Button(label) { isImporting = true }
            .fileImporter(
                isPresented: $isImporting,
                allowedContentTypes: allowedContentTypes,
                allowsMultipleSelection: allowsMultipleSelection
            ) { result in
                if case let .success(urls) = result {
                    onSelected(urls)
                }
            }
    }
}
