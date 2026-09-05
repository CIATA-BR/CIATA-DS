import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0008 Modal/Dialog para Flutter.
class CiataDialog extends StatelessWidget {
  CiataDialog({
    super.key,
    required String title,
    required String message,
    required String confirmLabel,
    required this.onConfirm,
    String dismissLabel = 'Cancelar',
    this.onDismiss,
  })  : title = title.trim(),
        message = message.trim(),
        confirmLabel = confirmLabel.trim(),
        dismissLabel = dismissLabel.trim() {
    if (this.title.isEmpty) {
      throw ArgumentError.value(title, 'title', 'não pode ser vazio');
    }
    if (this.confirmLabel.isEmpty) {
      throw ArgumentError.value(confirmLabel, 'confirmLabel', 'não pode ser vazio');
    }
    if (this.dismissLabel.isEmpty) {
      throw ArgumentError.value(dismissLabel, 'dismissLabel', 'não pode ser vazio');
    }
  }

  final String title;
  final String message;
  final String confirmLabel;
  final String dismissLabel;
  final VoidCallback onConfirm;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: message.isEmpty ? null : Text(message),
      actions: [
        TextButton(
          onPressed: onDismiss ?? () => Navigator.of(context).pop(),
          child: Text(dismissLabel),
        ),
        TextButton(onPressed: onConfirm, child: Text(confirmLabel)),
      ],
    );
  }
}
