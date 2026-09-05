import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0021 Search para Flutter.
class CiataSearch extends StatelessWidget {
  CiataSearch({
    super.key,
    required String label,
    required this.controller,
    required this.onSubmitted,
    this.enabled = true,
    this.readOnly = false,
    this.hintText,
  }) : label = label.trim() {
    if (this.label.isEmpty) {
      throw ArgumentError.value(label, 'label', 'não pode ser vazio');
    }
  }

  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final bool enabled;
  final bool readOnly;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      textInputAction: TextInputAction.search,
      onSubmitted: enabled && !readOnly ? onSubmitted : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
      ),
    );
  }
}
