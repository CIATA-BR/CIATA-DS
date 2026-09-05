import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0009 Loading/Progress para Flutter.
class CiataProgress extends StatelessWidget {
  CiataProgress({
    super.key,
    required String label,
    this.value,
  }) : label = label.trim() {
    if (this.label.isEmpty) {
      throw ArgumentError.value(label, 'label', 'não pode ser vazio');
    }
    if (value != null && !value!.isFinite) {
      throw ArgumentError.value(value, 'value', 'deve ser finito quando informado');
    }
  }

  final String label;
  final double? value;

  @override
  Widget build(BuildContext context) {
    final safe = value?.clamp(0.0, 1.0).toDouble();
    final percent = safe == null ? null : (safe * 100).round();
    final text = percent == null ? label : '$label: $percent%';

    return Semantics(
      label: label,
      value: percent == null ? null : '$percent%',
      child: ExcludeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: safe),
          ],
        ),
      ),
    );
  }
}
