package org.ciata.ds.progress

import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.ProgressBarRangeInfo
import androidx.compose.ui.semantics.contentDescription
import androidx.compose.ui.semantics.progressBarRangeInfo
import androidx.compose.ui.semantics.semantics

/** Implementação experimental do CMP-0009 Loading/Progress para Jetpack Compose. */
@Composable
fun CiataProgress(
    label: String,
    modifier: Modifier = Modifier,
    value: Float? = null,
) {
    val normalizedLabel = label.trim()
    require(normalizedLabel.isNotEmpty()) { "label não pode ser vazio." }
    require(value == null || value.isFinite()) { "value deve ser finito quando informado." }

    if (value == null) {
        CircularProgressIndicator(
            modifier = modifier.semantics {
                contentDescription = normalizedLabel
                progressBarRangeInfo = ProgressBarRangeInfo.Indeterminate
            },
        )
        Text(normalizedLabel)
    } else {
        val safe = value.coerceIn(0f, 1f)
        LinearProgressIndicator(
            progress = { safe },
            modifier = modifier.semantics {
                contentDescription = normalizedLabel
                progressBarRangeInfo = ProgressBarRangeInfo(safe, 0f..1f)
            },
        )
        Text("$normalizedLabel: ${(safe * 100).toInt()}%")
    }
}
