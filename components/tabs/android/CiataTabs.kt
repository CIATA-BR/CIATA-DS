package org.ciata.ds.tabs

import androidx.compose.foundation.layout.Column
import androidx.compose.material3.Tab
import androidx.compose.material3.TabRow
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable

/** Implementação experimental do CMP-0013 Tabs para Jetpack Compose. */
@Composable
fun CiataTabs(
    labels: List<String>,
    selectedIndex: Int,
    onSelectionChange: (Int) -> Unit,
    content: @Composable (Int) -> Unit,
) {
    val normalizedLabels = labels.map(String::trim)

    require(normalizedLabels.isNotEmpty()) { "labels não pode ser vazio." }
    require(selectedIndex in normalizedLabels.indices) { "selectedIndex fora do intervalo válido." }
    require(normalizedLabels.all { it.isNotEmpty() }) { "rótulos de abas não podem ser vazios." }

    Column {
        TabRow(selectedTabIndex = selectedIndex) {
            normalizedLabels.forEachIndexed { index, label ->
                Tab(
                    selected = index == selectedIndex,
                    onClick = { onSelectionChange(index) },
                    text = { Text(label) },
                )
            }
        }
        content(selectedIndex)
    }
}
