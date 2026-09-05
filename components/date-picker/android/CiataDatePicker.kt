package org.ciata.ds.datepicker

import androidx.compose.material3.DatePicker
import androidx.compose.material3.DatePickerDialog
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.rememberDatePickerState
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics

/** Implementação experimental do CMP-0019 Date Picker para Jetpack Compose. */
@Composable
fun CiataDatePicker(
    open: Boolean,
    title: String,
    selectedDateMillis: Long?,
    onDismissRequest: () -> Unit,
    onConfirm: (Long?) -> Unit,
    confirmLabel: String = "Confirmar",
    cancelLabel: String = "Cancelar",
) {
    val normalizedTitle = title.trim()
    val normalizedConfirmLabel = confirmLabel.trim()
    val normalizedCancelLabel = cancelLabel.trim()

    require(normalizedTitle.isNotEmpty()) { "title não pode ser vazio." }
    require(normalizedConfirmLabel.isNotEmpty()) { "confirmLabel não pode ser vazio." }
    require(normalizedCancelLabel.isNotEmpty()) { "cancelLabel não pode ser vazio." }
    if (!open) return

    val state = rememberDatePickerState(initialSelectedDateMillis = selectedDateMillis)

    DatePickerDialog(
        onDismissRequest = onDismissRequest,
        confirmButton = {
            TextButton(onClick = { onConfirm(state.selectedDateMillis) }) {
                Text(normalizedConfirmLabel)
            }
        },
        dismissButton = {
            TextButton(onClick = onDismissRequest) {
                Text(normalizedCancelLabel)
            }
        },
    ) {
        Text(normalizedTitle, modifier = Modifier.semantics { heading() })
        DatePicker(state = state)
    }
}
