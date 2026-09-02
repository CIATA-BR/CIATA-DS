import SwiftUI
import UIKit

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

            if let supportingText, !supportingText.isEmpty {
                Text(supportingText)
                    .font(.footnote)
                    .foregroundStyle(errorText?.isEmpty == false ? .red : .secondary)
            }
        }
    }

    @ViewBuilder
    private var field: some View {
        if readOnly {
            Text(text.isEmpty ? "Sem valor" : text)
                .frame(maxWidth: .infinity, minHeight: 44, alignment: .leading)
                .padding(.horizontal, 12)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(errorText?.isEmpty == false ? Color.red : Color.secondary)
                }
                .accessibilityLabel(Text(effectiveLabel))
                .accessibilityValue(Text(text.isEmpty ? "Sem valor, somente leitura" : "\(text), somente leitura"))
                .accessibilityHint(accessibilityHint)
        } else if multiline {
            TextEditor(text: $text)
                .frame(minHeight: 88)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(errorText?.isEmpty == false ? Color.red : Color.secondary)
                }
                .disabled(disabled)
                .accessibilityLabel(Text(effectiveLabel))
                .accessibilityHint(accessibilityHint)
                .accessibilityValue(disabled ? Text("Indisponível") : Text(""))
        } else if password {
            HStack(spacing: 8) {
                Group {
                    if passwordVisible {
                        TextField("", text: $text)
                    } else {
                        SecureField("", text: $text)
                    }
                }
                .textContentType(textContentType)
                .keyboardType(keyboardType)
                .submitLabel(submitLabel)
                .disabled(disabled)
                .accessibilityLabel(Text(effectiveLabel))
                .accessibilityHint(accessibilityHint)
                .accessibilityValue(disabled ? Text("Indisponível") : Text(""))

                Button(passwordVisible ? "Ocultar" : "Mostrar") {
                    passwordVisible.toggle()
                }
                .disabled(disabled)
                .accessibilityLabel(Text(passwordVisible ? "Ocultar senha" : "Mostrar senha"))
            }
        } else {
            TextField("", text: $text)
                .textContentType(textContentType)
                .keyboardType(keyboardType)
                .submitLabel(submitLabel)
                .disabled(disabled)
                .accessibilityLabel(Text(effectiveLabel))
                .accessibilityHint(accessibilityHint)
                .accessibilityValue(disabled ? Text("Indisponível") : Text(""))
        }
    }

    private var accessibilityHint: Text {
        if let errorText, !errorText.isEmpty {
            return Text(errorText)
        }
        if let helpText, !helpText.isEmpty {
            return Text(helpText)
        }
        return Text("")
    }
}
