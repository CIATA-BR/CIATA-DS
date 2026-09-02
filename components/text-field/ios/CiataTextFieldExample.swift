import SwiftUI

struct CiataTextFieldExample: View {
    @State private var email = ""
    @State private var password = ""
    @State private var notes = ""

    var body: some View {
        Form {
            CiataTextField(
                text: $email,
                label: "E-mail",
                helpText: "Usaremos este endereço para contato.",
                required: true,
                textContentType: .emailAddress,
                keyboardType: .emailAddress,
                submitLabel: .next
            )

            CiataTextField(
                text: $password,
                label: "Senha",
                helpText: "Use uma senha forte.",
                required: true,
                password: true,
                textContentType: .password,
                submitLabel: .done
            )

            CiataTextField(
                text: $notes,
                label: "Observações",
                helpText: "Campo opcional.",
                multiline: true
            )

            CiataTextField(
                text: .constant("CIATA"),
                label: "Organização",
                readOnly: true
            )
        }
    }
}
