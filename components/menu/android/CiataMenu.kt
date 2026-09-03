package org.ciata.ds.menu

import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.DropdownMenuItem
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable

/** Implementação experimental do CMP-0015 Menu para Jetpack Compose. */
@Composable
fun CiataMenu(
    triggerLabel: String,
    expanded: Boolean,
    onExpandedChange: (Boolean) -> Unit,
    items: List<Pair<String, () -> Unit>>,
) {
    require(triggerLabel.isNotBlank()) { "triggerLabel não pode ser vazio." }
    require(items.isNotEmpty()) { "items não pode ser vazio." }
    require(items.all { it.first.isNotBlank() }) { "rótulos de itens não podem ser vazios." }

    TextButton(onClick = { onExpandedChange(!expanded) }) {
        Text(triggerLabel)
    }
    DropdownMenu(
        expanded = expanded,
        onDismissRequest = { onExpandedChange(false) },
    ) {
        items.forEach { (label, action) ->
            DropdownMenuItem(
                text = { Text(label) },
                onClick = {
                    action()
                    onExpandedChange(false)
                },
            )
        }
    }
}
