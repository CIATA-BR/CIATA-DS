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
    val normalizedLabel = label.trim()
    val normalizedOptions = options.map { option -> option.copy(label = option.label.trim()) }
    val normalizedHelpText = helpText?.trim()
    val normalizedErrorText = errorText?.trim()

    require(normalizedLabel.isNotEmpty()) { "label não pode ser vazio." }
    require(normalizedOptions.isNotEmpty()) { "options não pode ser vazio." }
    require(normalizedOptions.all { it.label.isNotEmpty() }) { "Rótulos das opções não podem ser vazios." }
    require(normalizedOptions.map { it.value }.distinct().size == normalizedOptions.size) { "Valores devem ser únicos." }
    require(selectedValue == null || normalizedOptions.any { it.value == selectedValue }) {
        "selectedValue não pertence às opções do Select."
    }

    var expanded by remember { mutableStateOf(false) }
    val selectedLabel = normalizedOptions.firstOrNull { it.value == selectedValue }?.label.orEmpty()
    val semanticModifier = if (!normalizedErrorText.isNullOrEmpty()) {
        modifier.semantics { error(normalizedErrorText) }
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
                label = { Text(if (required) "$normalizedLabel (obrigatório)" else normalizedLabel) },
                trailingIcon = { ExposedDropdownMenuDefaults.TrailingIcon(expanded) },
                modifier = Modifier.menuAnchor(),
                isError = !normalizedErrorText.isNullOrEmpty(),
            )

            ExposedDropdownMenu(
                expanded = expanded,
                onDismissRequest = { expanded = false },
            ) {
                normalizedOptions.forEach { option ->
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

        if (!normalizedHelpText.isNullOrEmpty()) Text(normalizedHelpText)
        if (!normalizedErrorText.isNullOrEmpty()) Text(normalizedErrorText)
    }
}
