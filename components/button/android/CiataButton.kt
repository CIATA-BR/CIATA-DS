package org.ciata.ds.button

import androidx.compose.foundation.layout.RowScope
import androidx.compose.foundation.layout.defaultMinSize
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedButton
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.clearAndSetSemantics
import androidx.compose.ui.semantics.stateDescription
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.unit.dp

/** Variantes funcionais do CMP-0001. */
enum class CiataButtonVariant {
    Primary,
    Secondary,
    Danger,
    Ghost,
}

/**
 * Implementação experimental do CMP-0001 para Jetpack Compose.
 *
 * Mantém os componentes nativos do Material 3 e evita recriar comportamento de
 * foco, teclado, TalkBack e target size manualmente.
 */
@Composable
fun CiataButton(
    label: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    variant: CiataButtonVariant = CiataButtonVariant.Primary,
    enabled: Boolean = true,
    loading: Boolean = false,
    loadingStateDescription: String = "Processando",
    leadingContent: (@Composable RowScope.() -> Unit)? = null,
) {
    val normalizedLabel = label.trim()
    val normalizedLoadingStateDescription = loadingStateDescription.trim()
    require(normalizedLabel.isNotEmpty()) { "label não pode ser vazio." }
    require(normalizedLoadingStateDescription.isNotEmpty()) {
        "loadingStateDescription não pode ser vazio."
    }

    val effectiveOnClick: () -> Unit = {
        if (!loading) onClick()
    }

    val semanticModifier = modifier
        .defaultMinSize(minWidth = 48.dp, minHeight = 48.dp)
        .semantics {
            if (loading) {
                stateDescription = normalizedLoadingStateDescription
            }
        }

    val content: @Composable RowScope.() -> Unit = {
        if (loading) {
            CircularProgressIndicator(
                modifier = Modifier
                    .defaultMinSize(minWidth = 18.dp, minHeight = 18.dp)
                    .clearAndSetSemantics {},
                strokeWidth = 2.dp,
            )
        } else {
            leadingContent?.invoke(this)
        }
        Text(normalizedLabel)
    }

    when (variant) {
        CiataButtonVariant.Primary -> Button(
            onClick = effectiveOnClick,
            modifier = semanticModifier,
            enabled = enabled,
            content = content,
        )

        CiataButtonVariant.Secondary -> OutlinedButton(
            onClick = effectiveOnClick,
            modifier = semanticModifier,
            enabled = enabled,
            content = content,
        )

        CiataButtonVariant.Danger -> Button(
            onClick = effectiveOnClick,
            modifier = semanticModifier,
            enabled = enabled,
            colors = ButtonDefaults.buttonColors(
                containerColor = MaterialTheme.colorScheme.error,
                contentColor = MaterialTheme.colorScheme.onError,
            ),
            content = content,
        )

        CiataButtonVariant.Ghost -> TextButton(
            onClick = effectiveOnClick,
            modifier = semanticModifier,
            enabled = enabled,
            content = content,
        )
    }
}
