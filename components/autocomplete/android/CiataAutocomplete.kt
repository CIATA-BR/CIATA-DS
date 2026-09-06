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
    val normalizedLabel = label.trim()
    val normalizedOptions = options.map(String::trim)

    require(normalizedLabel.isNotEmpty()) { "label não pode ser vazio." }
    require(normalizedOptions.none { it.isEmpty() }) { "options não pode conter rótulos vazios." }
    require(normalizedOptions.distinct().size == normalizedOptions.size) { "options não pode conter rótulos duplicados." }

    val effectiveExpanded = expanded && value.isNotBlank() && normalizedOptions.isNotEmpty()

    OutlinedTextField(
        value = value,
        onValueChange = {
            onValueChange(it)
            onExpandedChange(it.isNotBlank() && normalizedOptions.isNotEmpty())
        },
        singleLine = true,
        label = { Text(normalizedLabel) },
    )
    DropdownMenu(
        expanded = effectiveExpanded,
        onDismissRequest = { onExpandedChange(false) },
    ) {
        normalizedOptions.forEach { option ->
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
