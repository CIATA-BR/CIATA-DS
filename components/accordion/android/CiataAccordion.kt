package org.ciata.ds.accordion

import androidx.compose.foundation.layout.Column
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable

/** Implementação experimental do CMP-0014 Accordion para Jetpack Compose. */
@Composable
fun CiataAccordion(
    labels: List<String>,
    expanded: Set<Int>,
    onToggle: (Int) -> Unit,
    content: @Composable (Int) -> Unit,
) {
    require(labels.isNotEmpty()) { "labels não pode ser vazio." }
    require(labels.all { it.isNotBlank() }) { "rótulos não podem ser vazios." }
    require(expanded.all { it in labels.indices }) { "expanded contém índice inválido." }

    Column {
        labels.forEachIndexed { index, label ->
            val isExpanded = index in expanded
            TextButton(onClick = { onToggle(index) }) {
                Text("$label, ${if (isExpanded) "expandido" else "recolhido"}")
            }
            if (isExpanded) {
                content(index)
            }
        }
    }
}
