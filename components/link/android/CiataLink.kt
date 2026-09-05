package org.ciata.ds.link

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
    newContextLabel: String = "abre em novo contexto",
) {
    val normalizedLabel = label.trim()
    val normalizedUrl = url.trim()
    val normalizedNewContextLabel = newContextLabel.trim()

    require(normalizedLabel.isNotEmpty()) { "label não pode ser vazio." }
    require(normalizedUrl.isNotEmpty()) { "url não pode ser vazia." }
    require(!opensNewContext || normalizedNewContextLabel.isNotEmpty()) {
        "newContextLabel não pode ser vazio quando opensNewContext estiver ativo."
    }

    val visibleLabel = if (opensNewContext) {
        "$normalizedLabel ($normalizedNewContextLabel)"
    } else normalizedLabel
    val text = buildAnnotatedString {
        withLink(LinkAnnotation.Url(normalizedUrl)) {
            append(visibleLabel)
        }
    }

    Text(
        text = text,
        modifier = modifier,
        textDecoration = TextDecoration.Underline,
    )
}
