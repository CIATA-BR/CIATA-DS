package org.ciata.ds.fileupload

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable

/** Implementação experimental do CMP-0020 File Upload para Jetpack Compose. */
@Composable
fun CiataFileUpload(
    label: String,
    mimeTypes: Array<String> = arrayOf("*/*"),
    onSelected: (List<Uri>) -> Unit,
) {
    require(label.isNotBlank()) { "label não pode ser vazio." }
    require(mimeTypes.isNotEmpty()) { "mimeTypes não pode ser vazio." }

    val launcher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.OpenMultipleDocuments(),
        onResult = onSelected,
    )

    TextButton(onClick = { launcher.launch(mimeTypes) }) {
        Text(label)
    }
}
