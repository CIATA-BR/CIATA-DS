import SwiftUI

/// Implementação experimental do CMP-0011 Pagination para SwiftUI.
public struct CiataPagination: View {
    private let currentPage: Int
    private let totalPages: Int
    private let onPageChange: (Int) -> Void

    public init(currentPage: Int, totalPages: Int, onPageChange: @escaping (Int) -> Void) {
        precondition(totalPages > 0, "totalPages deve ser maior que zero")
        precondition((1...totalPages).contains(currentPage), "currentPage fora do intervalo válido")
        self.currentPage = currentPage
        self.totalPages = totalPages
        self.onPageChange = onPageChange
    }

    public var body: some View {
        HStack {
            Button("Anterior") { onPageChange(currentPage - 1) }
                .disabled(currentPage == 1)
            ForEach(1...totalPages, id: \.self) { page in
                Button("Página \(page)") { onPageChange(page) }
                    .disabled(page == currentPage)
                    .accessibilityValue(page == currentPage ? "Atual" : "")
            }
            Button("Próxima") { onPageChange(currentPage + 1) }
                .disabled(currentPage == totalPages)
        }
    }
}
