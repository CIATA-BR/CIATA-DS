import SwiftUI

enum CiataButtonVariant {
    case primary
    case secondary
    case danger
    case ghost
}

struct CiataButton: View {
    let label: String
    let variant: CiataButtonVariant
    let isLoading: Bool
    let isDisabled: Bool
    let loadingValue: String
    let loadingHint: String
    let action: () -> Void

    init(
        _ label: String,
        variant: CiataButtonVariant = .primary,
        isLoading: Bool = false,
        isDisabled: Bool = false,
        loadingValue: String = "Operação em andamento",
        loadingHint: String = "Aguarde a conclusão da operação",
        action: @escaping () -> Void
    ) {
        let normalizedLabel = label.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedLoadingValue = loadingValue.trimmingCharacters(in: .whitespacesAndNewlines)
        let normalizedLoadingHint = loadingHint.trimmingCharacters(in: .whitespacesAndNewlines)
        precondition(!normalizedLabel.isEmpty, "label não pode ser vazio")
        precondition(!normalizedLoadingValue.isEmpty, "loadingValue não pode ser vazio")
        precondition(!normalizedLoadingHint.isEmpty, "loadingHint não pode ser vazio")

        self.label = normalizedLabel
        self.variant = variant
        self.isLoading = isLoading
        self.isDisabled = isDisabled
        self.loadingValue = normalizedLoadingValue
        self.loadingHint = normalizedLoadingHint
        self.action = action
    }

    var body: some View {
        styledButton
            .disabled(isDisabled)
            .accessibilityLabel(Text(label))
            .accessibilityValue(isLoading ? Text(loadingValue) : Text(""))
            .accessibilityHint(isLoading ? Text(loadingHint) : Text(""))
    }

    private var baseButton: some View {
        Button(action: {
            guard !isLoading && !isDisabled else { return }
            action()
        }) {
            HStack(spacing: 8) {
                if isLoading {
                    ProgressView()
                        .accessibilityHidden(true)
                }

                Text(label)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
            }
            .frame(minHeight: 44)
        }
    }

    @ViewBuilder
    private var styledButton: some View {
        switch variant {
        case .primary:
            baseButton
                .buttonStyle(.borderedProminent)
        case .secondary:
            baseButton
                .buttonStyle(.bordered)
        case .danger:
            baseButton
                .buttonStyle(.borderedProminent)
                .tint(.red)
        case .ghost:
            baseButton
                .buttonStyle(.plain)
        }
    }
}
