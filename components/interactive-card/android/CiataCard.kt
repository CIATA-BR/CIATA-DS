package org.ciata.ds.card

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Column
import androidx.compose.material3.Card
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier

/** Implementação experimental do CMP-0010 Card interativo para Jetpack Compose. */
@Composable
fun CiataCard(
    title: String,
    modifier: Modifier = Modifier,
    description: String? = null,
    onClick: (() -> Unit)? = null,
) {
    require(title.isNotBlank()) { "title não pode ser vazio." }

    val cardModifier = if (onClick != null) modifier.clickable(onClick = onClick) else modifier

    Card(modifier = cardModifier) {
        Column {
            Text(title)
            if (!description.isNullOrBlank()) {
                Text(description)
            }
        }
    }
}
