package org.ciata.ds.link

import androidx.compose.foundation.text.InlineTextContent
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.LinkAnnotation
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.style.TextDecoration
import androidx.compose.ui.text.withLink

/** Implementação experimental do CMP-0006 Link para Jetpack Compose. */
@Composable
fun CiataLink(
    label: String,
    url: String,
    modifier: Modifier = Modifier,
    opensNewContext: Boolean = false,
) {
    require(label.isNotBlank()) { "label não pode ser vazio." }
    require(url.isNotBlank()) { "url não pode ser vazia." }

    val visibleLabel = if (opensNewContext) "$label (abre em novo contexto)" else label
    val text = buildAnnotatedString {
        withLink(LinkAnnotation.Url(url)) {
            append(visibleLabel)
        }
    }

    Text(
        text = text,
        modifier = modifier,
        textDecoration = TextDecoration.Underline,
    )
}
