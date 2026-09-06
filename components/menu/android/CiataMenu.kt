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
    val normalizedTriggerLabel = triggerLabel.trim()
    val normalizedItems = items.map { (label, action) -> label.trim() to action }

    require(normalizedTriggerLabel.isNotEmpty()) { "triggerLabel não pode ser vazio." }
    require(normalizedItems.isNotEmpty()) { "items não pode ser vazio." }
    require(normalizedItems.all { it.first.isNotEmpty() }) { "rótulos de itens não podem ser vazios." }

    TextButton(onClick = { onExpandedChange(!expanded) }) {
        Text(normalizedTriggerLabel)
    }
    DropdownMenu(
        expanded = expanded,
        onDismissRequest = { onExpandedChange(false) },
    ) {
        normalizedItems.forEach { (label, action) ->
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
