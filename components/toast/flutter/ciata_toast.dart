import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0012 Toast para Flutter.
class CiataToast extends StatelessWidget {
  CiataToast({
    super.key,
    required String message,
    String? actionLabel,
    this.onAction,
  })  : message = message.trim(),
        actionLabel = actionLabel?.trim() {
    if (this.message.isEmpty) {
      throw ArgumentError.value(message, 'message', 'não pode ser vazio');
    }
    if ((this.actionLabel == null) != (onAction == null)) {
      throw ArgumentError(
        'actionLabel e onAction devem ser fornecidos juntos',
      );
    }
    if (this.actionLabel != null && this.actionLabel!.isEmpty) {
      throw ArgumentError.value(
        actionLabel,
        'actionLabel',
        'não pode ser vazio',
      );
    }
  }

  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      container: true,
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(message)),
              if (actionLabel != null && onAction != null) ...[
                const SizedBox(width: 12),
                TextButton(onPressed: onAction, child: Text(actionLabel!)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
