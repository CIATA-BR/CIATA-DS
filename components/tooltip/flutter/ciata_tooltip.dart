import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0017 Tooltip para Flutter.
class CiataTooltip extends StatelessWidget {
  const CiataTooltip({
    super.key,
    required this.message,
    required this.child,
  }) : assert(message != '', 'message não pode ser vazio');

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: child,
    );
  }
}
