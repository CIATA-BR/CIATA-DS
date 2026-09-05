package org.ciata.ds.alertstatus

import androidx.compose.foundation.layout.Column
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.LiveRegionMode
import androidx.compose.ui.semantics.liveRegion
import androidx.compose.ui.semantics.semantics

/** Implementação experimental do CMP-0007 Alert/Status para Jetpack Compose. */
@Composable
fun CiataAlertStatus(
    message: String,
    modifier: Modifier = Modifier,
    title: String? = null,
    priority: String = "status",
) {
    val normalizedMessage = message.trim()
    val normalizedTitle = title?.trim()?.takeIf { it.isNotEmpty() }
    val normalizedPriority = priority.trim()

    require(normalizedMessage.isNotEmpty()) { "message não pode ser vazio." }
    require(normalizedPriority == "status" || normalizedPriority == "alert") {
        "priority deve ser status ou alert."
    }

    val region = if (normalizedPriority == "alert") {
        LiveRegionMode.Assertive
    } else {
        LiveRegionMode.Polite
    }

    Column(
        modifier = modifier.semantics {
            liveRegion = region
        },
    ) {
        normalizedTitle?.let { Text(it) }
        Text(normalizedMessage)
    }
}
