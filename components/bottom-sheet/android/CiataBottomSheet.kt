package org.ciata.ds.bottomsheet

import androidx.compose.material3.ModalBottomSheet
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics

/** Implementação experimental do CMP-0018 Bottom Sheet para Jetpack Compose. */
@Composable
fun CiataBottomSheet(
    open: Boolean,
    title: String,
    onDismissRequest: () -> Unit,
    closeLabel: String = "Fechar",
    content: @Composable () -> Unit,
) {
    val normalizedTitle = title.trim()
    val normalizedCloseLabel = closeLabel.trim()

    require(normalizedTitle.isNotEmpty()) { "title não pode ser vazio." }
    require(normalizedCloseLabel.isNotEmpty()) { "closeLabel não pode ser vazio." }
    if (!open) return

    ModalBottomSheet(onDismissRequest = onDismissRequest) {
        Text(normalizedTitle, modifier = Modifier.semantics { heading() })
        content()
        TextButton(onClick = onDismissRequest) {
            Text(normalizedCloseLabel)
        }
    }
}
