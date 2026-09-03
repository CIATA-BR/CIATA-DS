package org.ciata.ds.tooltip

import androidx.compose.material3.PlainTooltip
import androidx.compose.material3.Text
import androidx.compose.material3.TooltipBox
import androidx.compose.material3.rememberTooltipState
import androidx.compose.runtime.Composable

/** Implementação experimental do CMP-0017 Tooltip para Jetpack Compose. */
@Composable
fun CiataTooltip(
    text: String,
    content: @Composable () -> Unit,
) {
    require(text.isNotBlank()) { "text não pode ser vazio." }

    TooltipBox(
        positionProvider = androidx.compose.material3.TooltipDefaults.rememberPlainTooltipPositionProvider(),
        tooltip = { PlainTooltip { Text(text) } },
        state = rememberTooltipState(),
    ) {
        content()
    }
}
