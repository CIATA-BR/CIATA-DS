package org.ciata.ds.toast

import androidx.compose.material3.Snackbar
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable

/** Implementação experimental do CMP-0012 Toast para Jetpack Compose. */
@Composable
fun CiataToast(
    message: String,
    actionLabel: String? = null,
    onAction: (() -> Unit)? = null,
) {
    val normalizedMessage = message.trim()
    val normalizedActionLabel = actionLabel?.trim()

    require(normalizedMessage.isNotEmpty()) { "message não pode ser vazio." }
    require((normalizedActionLabel == null) == (onAction == null)) {
        "actionLabel e onAction devem ser fornecidos juntos."
    }
    require(normalizedActionLabel == null || normalizedActionLabel.isNotEmpty()) {
        "actionLabel não pode ser vazio."
    }

    Snackbar(
        action = {
            if (normalizedActionLabel != null && onAction != null) {
                TextButton(onClick = onAction) {
                    Text(normalizedActionLabel)
                }
            }
        },
    ) {
        Text(normalizedMessage)
    }
}
