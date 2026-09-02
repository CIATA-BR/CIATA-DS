import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0008 Modal/Dialog para Flutter.
class CiataDialog extends StatelessWidget {
  const CiataDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmLabel,
    required this.onConfirm,
    this.dismissLabel = 'Cancelar',
    this.onDismiss,
  })  : assert(title != '', 'title não pode ser vazio'),
        assert(confirmLabel != '', 'confirmLabel não pode ser vazio'),
        assert(dismissLabel != '', 'dismissLabel não pode ser vazio');

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
        TextButton(onPressed: onDismiss ?? () => Navigator.of(context).pop(), child: Text(dismissLabel)),
        TextButton(onPressed: onConfirm, child: Text(confirmLabel)),
      ],
    );
  }
}
