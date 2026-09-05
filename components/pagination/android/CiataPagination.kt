package org.ciata.ds.pagination

import androidx.compose.foundation.layout.Row
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.selected
import androidx.compose.ui.semantics.semantics

/** Implementação experimental do CMP-0011 Pagination para Jetpack Compose. */
@Composable
fun CiataPagination(
    currentPage: Int,
    totalPages: Int,
    onPageChange: (Int) -> Unit,
    previousLabel: String = "Anterior",
    nextLabel: String = "Próxima",
    pageLabel: (Int) -> String = { page -> "Página $page" },
) {
    require(totalPages > 0) { "totalPages deve ser maior que zero." }
    require(currentPage in 1..totalPages) { "currentPage fora do intervalo válido." }

    val normalizedPreviousLabel = previousLabel.trim()
    val normalizedNextLabel = nextLabel.trim()
    require(normalizedPreviousLabel.isNotEmpty()) { "previousLabel não pode ser vazio." }
    require(normalizedNextLabel.isNotEmpty()) { "nextLabel não pode ser vazio." }

    Row {
        TextButton(onClick = { onPageChange(currentPage - 1) }, enabled = currentPage > 1) {
            Text(normalizedPreviousLabel)
        }
        for (page in 1..totalPages) {
            val normalizedPageLabel = pageLabel(page).trim()
            require(normalizedPageLabel.isNotEmpty()) { "pageLabel deve retornar texto não vazio." }
            TextButton(
                onClick = { onPageChange(page) },
                enabled = page != currentPage,
                modifier = Modifier.semantics { selected = page == currentPage },
            ) { Text(normalizedPageLabel) }
        }
        TextButton(onClick = { onPageChange(currentPage + 1) }, enabled = currentPage < totalPages) {
            Text(normalizedNextLabel)
        }
    }
}
