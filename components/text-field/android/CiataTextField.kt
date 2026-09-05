package org.ciata.ds.components.textfield

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation

@Composable
fun CiataTextField(
    value: String,
    onValueChange: (String) -> Unit,
    label: String,
    modifier: Modifier = Modifier,
    helpText: String? = null,
    errorText: String? = null,
    required: Boolean = false,
    readOnly: Boolean = false,
    enabled: Boolean = true,
    singleLine: Boolean = true,
    maxLines: Int = if (singleLine) 1 else Int.MAX_VALUE,
    keyboardOptions: KeyboardOptions = KeyboardOptions.Default,
    password: Boolean = false,
    showPasswordLabel: String = "Mostrar",
    hidePasswordLabel: String = "Ocultar",
) {
    val normalizedLabel = label.trim()
    val normalizedShowPasswordLabel = showPasswordLabel.trim()
    val normalizedHidePasswordLabel = hidePasswordLabel.trim()
    require(normalizedLabel.isNotEmpty()) { "label não pode ser vazio." }
    require(maxLines > 0) { "maxLines deve ser maior que zero." }
    require(!password || singleLine) { "password exige singleLine=true." }
    require(normalizedShowPasswordLabel.isNotEmpty()) { "showPasswordLabel não pode ser vazio." }
    require(normalizedHidePasswordLabel.isNotEmpty()) { "hidePasswordLabel não pode ser vazio." }

    var passwordVisible by remember { mutableStateOf(false) }
    val hasError = !errorText.isNullOrBlank()
    val supporting = errorText ?: helpText

    Column(modifier = modifier.fillMaxWidth()) {
        OutlinedTextField(
            value = value,
            onValueChange = onValueChange,
            modifier = Modifier.fillMaxWidth(),
            enabled = enabled,
            readOnly = readOnly,
            label = {
                Text(if (required) "$normalizedLabel (obrigatório)" else normalizedLabel)
            },
            supportingText = supporting?.let { text ->
                { Text(text) }
            },
            isError = hasError,
            singleLine = singleLine,
            maxLines = maxLines,
            keyboardOptions = keyboardOptions,
            visualTransformation = if (password && !passwordVisible) {
                PasswordVisualTransformation()
            } else {
                VisualTransformation.None
            },
            trailingIcon = if (password) {
                {
                    TextButton(
                        enabled = enabled && !readOnly,
                        onClick = { passwordVisible = !passwordVisible },
                    ) {
                        Text(if (passwordVisible) normalizedHidePasswordLabel else normalizedShowPasswordLabel)
                    }
                }
            } else {
                null
            },
        )
    }
}
