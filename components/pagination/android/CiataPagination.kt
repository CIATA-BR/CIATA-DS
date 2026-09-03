package org.ciata.ds.pagination

import androidx.compose.foundation.layout.Row
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics

/** Implementação experimental do CMP-0011 Pagination para Jetpack Compose. */
@Composable
fun CiataPagination(
    currentPage: Int,
    totalPages: Int,
    onPageChange: (Int) -> Unit,
) {
    require(totalPages > 0) { "totalPages deve ser maior que zero." }
    require(currentPage in 1..totalPages) { "currentPage fora do intervalo válido." }

    Row {
        TextButton(onClick = { onPageChange(currentPage - 1) }, enabled = currentPage > 1) {
            Text("Anterior")
        }
        for (page in 1..totalPages) {
            TextButton(
                onClick = { onPageChange(page) },
                enabled = page != currentPage,
                modifier = androidx.compose.ui.Modifier.semantics { selected = page == currentPage },
            ) { Text("Página $page") }
        }
        TextButton(onClick = { onPageChange(currentPage + 1) }, enabled = currentPage < totalPages) {
            Text("Próxima")
        }
    }
}
