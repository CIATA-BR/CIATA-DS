import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0021 Search para Flutter.
class CiataSearch extends StatelessWidget {
  const CiataSearch({
    super.key,
    required this.label,
    required this.controller,
    required this.onSubmitted,
    this.enabled = true,
    this.readOnly = false,
  }) : assert(label.trim() != '', 'label não pode ser vazio');

  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final bool enabled;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(labelText: label),
    );
  }
}
