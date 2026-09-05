package org.ciata.ds.dialog

import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable

/** Implementação experimental do CMP-0008 Modal/Dialog para Jetpack Compose. */
@Composable
fun CiataDialog(
    title: String,
    description: String,
    onDismissRequest: () -> Unit,
    confirmLabel: String,
    onConfirm: () -> Unit,
    dismissLabel: String? = null,
) {
    val normalizedTitle = title.trim()
    val normalizedDescription = description.trim()
    val normalizedConfirmLabel = confirmLabel.trim()
    val normalizedDismissLabel = dismissLabel?.trim()?.takeIf { it.isNotEmpty() }

    require(normalizedTitle.isNotEmpty()) { "title não pode ser vazio." }
    require(normalizedConfirmLabel.isNotEmpty()) { "confirmLabel não pode ser vazio." }

    AlertDialog(
        onDismissRequest = onDismissRequest,
        title = { Text(normalizedTitle) },
        text = { if (normalizedDescription.isNotEmpty()) Text(normalizedDescription) },
        confirmButton = {
            TextButton(onClick = onConfirm) { Text(normalizedConfirmLabel) }
        },
        dismissButton = normalizedDismissLabel?.let { label ->
            { TextButton(onClick = onDismissRequest) { Text(label) } }
        },
    )
}
