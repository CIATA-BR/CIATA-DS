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
    require(message.isNotBlank()) { "message não pode ser vazio." }
    require((actionLabel == null) == (onAction == null)) {
        "actionLabel e onAction devem ser fornecidos juntos."
    }

    Snackbar(
        action = {
            if (actionLabel != null && onAction != null) {
                TextButton(onClick = onAction) {
                    Text(actionLabel)
                }
            }
        },
    ) {
        Text(message)
    }
}
