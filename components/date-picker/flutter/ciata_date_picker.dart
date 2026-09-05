import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0019 Date Picker para Flutter.
Future<DateTime?> showCiataDatePicker({
  required BuildContext context,
  required String helpText,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  final trimmedHelpText = helpText.trim();
  if (trimmedHelpText.isEmpty) {
    throw ArgumentError.value(helpText, 'helpText', 'não pode ser vazio');
  }
  if (firstDate.isAfter(lastDate)) {
    throw ArgumentError('firstDate deve ser anterior ou igual a lastDate');
  }
  if (initialDate.isBefore(firstDate) || initialDate.isAfter(lastDate)) {
    throw ArgumentError('initialDate deve estar entre firstDate e lastDate');
  }

  return showDatePicker(
    context: context,
    helpText: trimmedHelpText,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );
}
