import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0009 Loading/Progress para Flutter.
class CiataProgress extends StatelessWidget {
  const CiataProgress({
    super.key,
    required this.label,
    this.value,
  }) : assert(label != '', 'label não pode ser vazio');

  final String label;
  final double? value;

  @override
  Widget build(BuildContext context) {
    final safe = value?.clamp(0.0, 1.0);
    final text = safe == null ? label : '$label: ${(safe * 100).round()}%';

    return Semantics(
      label: text,
      value: safe == null ? null : '${(safe * 100).round()}%',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: safe),
        ],
      ),
    );
  }
}
