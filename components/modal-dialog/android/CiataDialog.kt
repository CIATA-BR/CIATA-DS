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
    require(title.isNotBlank()) { "title não pode ser vazio." }
    require(confirmLabel.isNotBlank()) { "confirmLabel não pode ser vazio." }

    AlertDialog(
        onDismissRequest = onDismissRequest,
        title = { Text(title) },
        text = { if (description.isNotBlank()) Text(description) },
        confirmButton = {
            TextButton(onClick = onConfirm) { Text(confirmLabel) }
        },
        dismissButton = dismissLabel?.takeIf { it.isNotBlank() }?.let { label ->
            { TextButton(onClick = onDismissRequest) { Text(label) } }
        },
    )
}
