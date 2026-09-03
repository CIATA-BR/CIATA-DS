import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0022 Autocomplete para Flutter.
class CiataAutocomplete extends StatelessWidget {
  const CiataAutocomplete({
    super.key,
    required this.label,
    required this.controller,
    required this.options,
    required this.onSelected,
  }) : assert(label.trim() != '', 'label não pode ser vazio');

  final String label;
  final TextEditingController controller;
  final Iterable<String> options;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      initialValue: controller.value,
      optionsBuilder: (value) {
        final query = value.text.trim().toLowerCase();
        if (query.isEmpty) return const Iterable<String>.empty();
        return options.where((option) => option.toLowerCase().contains(query));
      },
      onSelected: (value) {
        controller.text = value;
        onSelected(value);
      },
      fieldViewBuilder: (context, textController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: textController,
          focusNode: focusNode,
          decoration: InputDecoration(labelText: label),
          onSubmitted: (_) => onFieldSubmitted(),
        );
      },
    );
  }
}
