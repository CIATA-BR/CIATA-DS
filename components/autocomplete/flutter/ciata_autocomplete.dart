import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0022 Autocomplete para Flutter.
class CiataAutocomplete extends StatelessWidget {
  CiataAutocomplete({
    super.key,
    required String label,
    required this.controller,
    required Iterable<String> options,
    required this.onSelected,
  })  : label = label.trim(),
        options = options.map((option) => option.trim()).toList(growable: false) {
    if (this.label.isEmpty) {
      throw ArgumentError.value(label, 'label', 'não pode ser vazio');
    }
    if (this.options.any((option) => option.isEmpty)) {
      throw ArgumentError.value(options, 'options', 'não pode conter rótulos vazios');
    }
    if (this.options.toSet().length != this.options.length) {
      throw ArgumentError.value(options, 'options', 'não pode conter rótulos duplicados');
    }
  }

  final String label;
  final TextEditingController controller;
  final List<String> options;
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
