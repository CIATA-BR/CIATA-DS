import SwiftUI

/// Implementação experimental do CMP-0011 Pagination para SwiftUI.
public struct CiataPagination: View {
    private let currentPage: Int
    private let totalPages: Int
    private let onPageChange: (Int) -> Void
    private let previousLabel: String
    private let nextLabel: String
    private let pageLabel: (Int) -> String
    private let currentValue: String

    public init(
        currentPage: Int,
        totalPages: Int,
        previousLabel: String = "Anterior",
        nextLabel: String = "Próxima",
        currentValue: String = "Atual",
        pageLabel: @escaping (Int) -> String = { page in "Página \(page)" },
        onPageChange: @escaping (Int) -> Void
    ) {
        let previous = previousLabel.trimmingCharacters(in: .whitespacesAndNewlines)
        let next = nextLabel.trimmingCharacters(in: .whitespacesAndNewlines)
        let current = currentValue.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(totalPages > 0, "totalPages deve ser maior que zero")
        precondition((1...totalPages).contains(currentPage), "currentPage fora do intervalo válido")
        precondition(!previous.isEmpty && !next.isEmpty && !current.isEmpty, "rótulos não podem ser vazios")
        precondition((1...totalPages).allSatisfy {
            !pageLabel($0).trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }, "pageLabel deve retornar texto não vazio")
        self.currentPage = currentPage
        self.totalPages = totalPages
        self.previousLabel = previous
        self.nextLabel = next
        self.currentValue = current
        self.pageLabel = pageLabel
        self.onPageChange = onPageChange
    }

    public var body: some View {
        HStack {
            Button(previousLabel) { onPageChange(currentPage - 1) }
                .disabled(currentPage == 1)
            ForEach(1...totalPages, id: \.self) { page in
                let label = pageLabel(page).trimmingCharacters(in: .whitespacesAndNewlines)
                Button(label) { onPageChange(page) }
                    .disabled(page == currentPage)
                    .accessibilityValue(page == currentPage ? currentValue : "")
            }
            Button(nextLabel) { onPageChange(currentPage + 1) }
                .disabled(currentPage == totalPages)
        }
    }
}
