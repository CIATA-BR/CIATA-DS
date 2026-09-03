import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0012 Toast para Flutter.
class CiataToast extends StatelessWidget {
  const CiataToast({
    super.key,
    required this.message,
    this.actionLabel,
    this.onAction,
  })  : assert(message != '', 'message não pode ser vazio'),
        assert((actionLabel == null) == (onAction == null),
            'actionLabel e onAction devem ser fornecidos juntos');

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
