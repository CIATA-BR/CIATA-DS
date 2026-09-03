import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0019 Date Picker para Flutter.
Future<DateTime?> showCiataDatePicker({
  required BuildContext context,
  required String helpText,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  assert(helpText.trim().isNotEmpty, 'helpText não pode ser vazio');
  assert(!firstDate.isAfter(lastDate), 'firstDate deve ser anterior ou igual a lastDate');

  return showDatePicker(
    context: context,
    helpText: helpText,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );
}
