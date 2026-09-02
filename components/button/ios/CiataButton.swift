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
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(style)
        .disabled(isDisabled)
        .accessibilityLabel(Text(label))
        .accessibilityValue(isLoading ? Text("Operação em andamento") : Text(""))
        .accessibilityHint(isLoading ? Text("Aguarde a conclusão da operação") : Text(""))
    }

    @ViewBuilder
    private var style: some PrimitiveButtonStyle {
        switch variant {
        case .primary:
            BorderedProminentButtonStyle()
        case .secondary:
            BorderedButtonStyle()
        case .danger:
            BorderedProminentButtonStyle()
        case .ghost:
            PlainButtonStyle()
        }
    }
}
