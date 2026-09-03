package org.ciata.ds.datepicker

import androidx.compose.material3.DatePicker
import androidx.compose.material3.DatePickerDialog
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.rememberDatePickerState
import androidx.compose.runtime.Composable

/** Implementação experimental do CMP-0019 Date Picker para Jetpack Compose. */
@Composable
fun CiataDatePicker(
    open: Boolean,
    title: String,
    selectedDateMillis: Long?,
    onDismissRequest: () -> Unit,
    onConfirm: (Long?) -> Unit,
) {
    require(title.isNotBlank()) { "title não pode ser vazio." }
    if (!open) return

    val state = rememberDatePickerState(initialSelectedDateMillis = selectedDateMillis)

    DatePickerDialog(
        onDismissRequest = onDismissRequest,
        confirmButton = {
            TextButton(onClick = { onConfirm(state.selectedDateMillis) }) {
                Text("Confirmar")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismissRequest) {
                Text("Cancelar")
            }
        },
    ) {
        Text(title)
        DatePicker(state = state)
    }
}
