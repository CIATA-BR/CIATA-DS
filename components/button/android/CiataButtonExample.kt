package org.ciata.ds.button

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun CiataButtonExample(
    saving: Boolean,
    onSave: () -> Unit,
    onDelete: () -> Unit,
) {
    MaterialTheme {
        Column {
            CiataButton(
                label = "Salvar alterações",
                onClick = onSave,
                loading = saving,
            )

            Spacer(Modifier.height(16.dp))

            CiataButton(
                label = "Excluir conta",
                variant = CiataButtonVariant.Danger,
                onClick = onDelete,
            )
        }
    }
}
