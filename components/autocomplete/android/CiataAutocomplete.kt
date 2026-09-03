package org.ciata.ds.autocomplete

import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable

/** Implementação experimental do CMP-0022 Autocomplete para Jetpack Compose. */
@Composable
fun CiataAutocomplete(
    label: String,
    value: String,
    options: List<String>,
    expanded: Boolean,
    onValueChange: (String) -> Unit,
    onExpandedChange: (Boolean) -> Unit,
    onSelect: (String) -> Unit,
) {
    require(label.isNotBlank()) { "label não pode ser vazio." }
    require(options.none { it.isBlank() }) { "options não pode conter rótulos vazios." }

    OutlinedTextField(
        value = value,
        onValueChange = {
            onValueChange(it)
            onExpandedChange(it.isNotBlank() && options.isNotEmpty())
        },
        singleLine = true,
        label = { Text(label) },
    )
    DropdownMenu(
        expanded = expanded,
        onDismissRequest = { onExpandedChange(false) },
    ) {
        options.forEach { option ->
            DropdownMenuItem(
                text = { Text(option) },
                onClick = {
                    onSelect(option)
                    onExpandedChange(false)
                },
            )
        }
    }
}
