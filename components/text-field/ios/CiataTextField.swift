import SwiftUI

struct CiataTextField: View {
    @Binding var text: String

    let label: String
    var helpText: String? = nil
    var errorText: String? = nil
    var required: Bool = false
    var readOnly: Bool = false
    var disabled: Bool = false
    var password: Bool = false
    var multiline: Bool = false
    var textContentType: UITextContentType? = nil
    var keyboardType: UIKeyboardType = .default
    var submitLabel: SubmitLabel = .done

    @State private var passwordVisible = false

    private var effectiveLabel: String {
        required ? "\(label) (obrigatório)" : label
    }

    private var supportingText: String? {
        if let errorText, !errorText.isEmpty { return errorText }
        return helpText
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(effectiveLabel)
                .font(.body)

            field
                .textContentType(textContentType)
                .keyboardType(keyboardType)
                .submitLabel(submitLabel)
                .disabled(disabled)
                .accessibilityLabel(Text(effectiveLabel))
                .accessibilityHint(accessibilityHint)
                .accessibilityValue(accessibilityValue)

            if let supportingText, !supportingText.isEmpty {
                Text(supportingText)
                    .font(.footnote)
                    .foregroundStyle(errorText?.isEmpty == false ? .red : .secondary)
                    .accessibilityLabel(Text(supportingText))
            }
        }
    }

    @ViewBuilder
    private var field: some View {
        if multiline {
            TextEditor(text: readOnlyBinding)
                .frame(minHeight: 88)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(errorText?.isEmpty == false ? Color.red : Color.secondary)
                }
        } else if password {
            HStack(spacing: 8) {
                Group {
                    if passwordVisible {
                        TextField("", text: readOnlyBinding)
                    } else {
                        SecureField("", text: readOnlyBinding)
                    }
                }

                Button(passwordVisible ? "Ocultar" : "Mostrar") {
                    passwordVisible.toggle()
                }
                .disabled(disabled || readOnly)
                .accessibilityLabel(Text(passwordVisible ? "Ocultar senha" : "Mostrar senha"))
            }
        } else {
            TextField("", text: readOnlyBinding)
        }
    }

    private var readOnlyBinding: Binding<String> {
        Binding(
            get: { text },
            set: { newValue in
                guard !readOnly && !disabled else { return }
                text = newValue
            }
        )
    }

    private var accessibilityHint: Text {
        if let errorText, !errorText.isEmpty {
            return Text(errorText)
        }
        if let helpText, !helpText.isEmpty {
            return Text(helpText)
        }
        if readOnly {
            return Text("Somente leitura")
        }
        return Text("")
    }

    private var accessibilityValue: Text {
        if disabled {
            return Text("Indisponível")
        }
        if readOnly {
            return Text("Somente leitura")
        }
        return Text("")
    }
}
