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
    let action: () -> Void

    init(
        _ label: String,
        variant: CiataButtonVariant = .primary,
        isLoading: Bool = false,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.variant = variant
        self.isLoading = isLoading
        self.isDisabled = isDisabled
        self.action = action
    }

    var body: some View {
        styledButton
            .disabled(isDisabled)
            .accessibilityLabel(Text(label))
            .accessibilityValue(isLoading ? Text("Operação em andamento") : Text(""))
            .accessibilityHint(isLoading ? Text("Aguarde a conclusão da operação") : Text(""))
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
