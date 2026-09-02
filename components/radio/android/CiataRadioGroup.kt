package org.ciata.ds.radio

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.selection.selectable
import androidx.compose.foundation.selection.selectableGroup
import androidx.compose.material3.RadioButton
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.semantics.error
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.unit.dp

data class CiataRadioOption(
    val value: String,
    val label: String,
    val enabled: Boolean = true,
)

/** Implementação experimental do CMP-0004 Radio para Jetpack Compose. */
@Composable
fun CiataRadioGroup(
    legend: String,
    options: List<CiataRadioOption>,
    selectedValue: String?,
    onSelected: (String) -> Unit,
    modifier: Modifier = Modifier,
    required: Boolean = false,
    enabled: Boolean = true,
    helpText: String? = null,
    errorText: String? = null,
) {
    require(legend.isNotBlank()) { "legend não pode ser vazio." }
    require(options.size >= 2) { "Radio Group deve possuir ao menos duas opções." }
    require(options.all { it.label.isNotBlank() }) { "Rótulos não podem ser vazios." }
    require(options.map { it.value }.distinct().size == options.size) { "Valores devem ser únicos." }

    val groupModifier = if (!errorText.isNullOrBlank()) {
        modifier
            .selectableGroup()
            .semantics { error(errorText) }
    } else {
        modifier.selectableGroup()
    }

    Column(modifier = groupModifier) {
        Text(if (required) "$legend (obrigatório)" else legend)

        options.forEach { option ->
            val optionEnabled = enabled && option.enabled
            Row(
                modifier = Modifier.selectable(
                    selected = selectedValue == option.value,
                    enabled = optionEnabled,
                    role = Role.RadioButton,
                    onClick = { onSelected(option.value) },
                ),
                verticalAlignment = Alignment.CenterVertically,
            ) {
                RadioButton(
                    selected = selectedValue == option.value,
                    onClick = null,
                    enabled = optionEnabled,
                )
                Spacer(Modifier.width(8.dp))
                Text(option.label)
            }
        }

        if (!helpText.isNullOrBlank()) {
            Text(helpText)
        }
        if (!errorText.isNullOrBlank()) {
            Text(errorText)
        }
    }
}
