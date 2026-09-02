package org.ciata.ds.components.textfield

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp

@Composable
fun CiataTextFieldExample() {
    var email by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var notes by remember { mutableStateOf("") }

    MaterialTheme {
        Surface {
            Column(
                modifier = Modifier.padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp),
            ) {
                CiataTextField(
                    value = email,
                    onValueChange = { email = it },
                    label = "E-mail",
                    required = true,
                    helpText = "Use um endereço que você consulte com frequência.",
                    keyboardOptions = KeyboardOptions(
                        keyboardType = KeyboardType.Email,
                        imeAction = ImeAction.Next,
                    ),
                )

                CiataTextField(
                    value = password,
                    onValueChange = { password = it },
                    label = "Senha",
                    required = true,
                    password = true,
                    keyboardOptions = KeyboardOptions(
                        keyboardType = KeyboardType.Password,
                        imeAction = ImeAction.Next,
                    ),
                )

                CiataTextField(
                    value = notes,
                    onValueChange = { notes = it },
                    label = "Observações",
                    singleLine = false,
                    maxLines = 5,
                    helpText = "Campo opcional.",
                )
            }
        }
    }
}
