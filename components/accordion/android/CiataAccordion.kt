package org.ciata.ds.accordion

import androidx.compose.foundation.layout.Column
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.semantics.semantics

/** Implementação experimental do CMP-0014 Accordion para Jetpack Compose. */
@Composable
fun CiataAccordion(
    labels: List<String>,
    expanded: Set<Int>,
    onToggle: (Int) -> Unit,
    content: @Composable (Int) -> Unit,
) {
    val normalizedLabels = labels.map(String::trim)

    require(normalizedLabels.isNotEmpty()) { "labels não pode ser vazio." }
    require(normalizedLabels.all { it.isNotEmpty() }) { "rótulos não podem ser vazios." }
    require(expanded.all { it in normalizedLabels.indices }) { "expanded contém índice inválido." }

    Column {
        normalizedLabels.forEachIndexed { index, label ->
            val isExpanded = index in expanded
            TextButton(
                onClick = { onToggle(index) },
                modifier = Modifier.semantics {
                    stateDescription = if (isExpanded) "Expandido" else "Recolhido"
                },
            ) {
                Text(label)
            }
            if (isExpanded) {
                content(index)
            }
        }
    }
}
