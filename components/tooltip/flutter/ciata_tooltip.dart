import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0017 Tooltip para Flutter.
class CiataTooltip extends StatelessWidget {
  CiataTooltip({
    super.key,
    required String message,
    required this.child,
    this.excludeFromSemantics = false,
  }) : message = message.trim() {
    if (this.message.isEmpty) {
      throw ArgumentError.value(message, 'message', 'não pode ser vazio');
    }
  }

  final String message;
  final Widget child;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      excludeFromSemantics: excludeFromSemantics,
      child: child,
    );
  }
}
