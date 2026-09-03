package org.ciata.ds.breadcrumb

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.dp

/** Implementação experimental do CMP-0016 Breadcrumb para Jetpack Compose. */
@Composable
fun CiataBreadcrumb(
    items: List<Pair<String, (() -> Unit)?>>,
) {
    require(items.isNotEmpty()) { "items não pode ser vazio." }
    require(items.all { it.first.isNotBlank() }) { "rótulos não podem ser vazios." }

    FlowRow(
        horizontalArrangement = Arrangement.spacedBy(8.dp),
        verticalArrangement = Arrangement.spacedBy(4.dp),
    ) {
        items.forEach { (label, action) ->
            if (action == null) {
                Text(label)
            } else {
                TextButton(onClick = action) {
                    Text(label)
                }
            }
        }
    }
}
