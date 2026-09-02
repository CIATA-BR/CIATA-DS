package org.ciata.ds.select

import androidx.compose.foundation.layout.Column
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.ExposedDropdownMenuBox
import androidx.compose.material3.ExposedDropdownMenuDefaults
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.error
import androidx.compose.ui.semantics.semantics

data class CiataSelectOption(
    val value: String,
    val label: String,
    val enabled: Boolean = true,
)

/** Implementação experimental do CMP-0005 Select para Jetpack Compose. */
@Composable
fun CiataSelect(
    label: String,
    options: List<CiataSelectOption>,
    selectedValue: String?,
    onSelected: (String) -> Unit,
    modifier: Modifier = Modifier,
    required: Boolean = false,
    enabled: Boolean = true,
    helpText: String? = null,
    errorText: String? = null,
) {
    require(label.isNotBlank()) { "label não pode ser vazio." }
    require(options.isNotEmpty()) { "options não pode ser vazio." }
    require(options.map { it.value }.distinct().size == options.size) { "Valores devem ser únicos." }

    var expanded by remember { mutableStateOf(false) }
    val selectedLabel = options.firstOrNull { it.value == selectedValue }?.label.orEmpty()
    val semanticModifier = if (!errorText.isNullOrBlank()) {
        modifier.semantics { error(errorText) }
    } else modifier

    Column(modifier = semanticModifier) {
        ExposedDropdownMenuBox(
            expanded = expanded,
            onExpandedChange = { if (enabled) expanded = !expanded },
        ) {
            TextField(
                value = selectedLabel,
                onValueChange = {},
                readOnly = true,
                enabled = enabled,
                label = { Text(if (required) "$label (obrigatório)" else label) },
                trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded) },
                modifier = Modifier.menuAnchor(),
                isError = !errorText.isNullOrBlank(),
            )

            ExposedDropdownMenu(
                expanded = expanded,
                onDismissRequest = { expanded = false },
            ) {
                options.forEach { option ->
                    DropdownMenuItem(
                        text = { Text(option.label) },
                        enabled = enabled && option.enabled,
                        onClick = {
                            onSelected(option.value)
                            expanded = false
                        },
                    )
                }
            }
        }

        if (!helpText.isNullOrBlank()) Text(helpText)
        if (!errorText.isNullOrBlank()) Text(errorText)
    }
}
