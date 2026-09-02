import SwiftUI

struct CiataButtonExample: View {
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 16) {
            CiataButton(
                "Salvar alterações",
                isLoading: isLoading
            ) {
                isLoading = true
            }

            CiataButton(
                "Cancelar",
                variant: .secondary
            ) {
                // Ação secundária.
            }

            CiataButton(
                "Excluir arquivo",
                variant: .danger
            ) {
                // O fluxo consumidor deve solicitar confirmação proporcional ao risco.
            }

            CiataButton(
                "Mais opções",
                variant: .ghost
            ) {
                // Ação de menor ênfase.
            }
        }
        .padding()
    }
}
