package org.ciata.ds.search

import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.text.input.ImeAction

/** Implementação experimental do CMP-0021 Search para Jetpack Compose. */
@Composable
fun CiataSearch(
    label: String,
    value: String,
    onValueChange: (String) -> Unit,
    onSubmit: (String) -> Unit,
    enabled: Boolean = true,
    readOnly: Boolean = false,
    placeholder: String? = null,
) {
    val normalizedLabel = label.trim()
    val normalizedPlaceholder = placeholder?.trim()?.takeIf { it.isNotEmpty() }

    require(normalizedLabel.isNotEmpty()) { "label não pode ser vazio." }

    OutlinedTextField(
        value = value,
        onValueChange = onValueChange,
        enabled = enabled,
        readOnly = readOnly,
        singleLine = true,
        label = { Text(normalizedLabel) },
        placeholder = normalizedPlaceholder?.let { { Text(it) } },
        keyboardOptions = KeyboardOptions(imeAction = ImeAction.Search),
        keyboardActions = KeyboardActions(
            onSearch = {
                if (enabled && !readOnly) onSubmit(value)
            },
        ),
    )
}
