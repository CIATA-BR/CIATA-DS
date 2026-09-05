import 'package:flutter/material.dart';

class CiataSelectOption<T> {
  CiataSelectOption({
    required this.value,
    required String label,
    this.enabled = true,
  }) : label = label.trim() {
    if (this.label.isEmpty) {
      throw ArgumentError.value(label, 'label', 'não pode ser vazio');
    }
  }

  final T value;
  final String label;
  final bool enabled;
}

/// Implementação experimental do CMP-0005 Select para Flutter.
class CiataSelect<T> extends StatelessWidget {
  CiataSelect({
    super.key,
    required String label,
    required this.options,
    required this.value,
    required this.onChanged,
    this.requiredField = false,
    this.enabled = true,
    String? helpText,
    String? errorText,
  })  : label = label.trim(),
        helpText = helpText?.trim(),
        errorText = errorText?.trim() {
    if (this.label.isEmpty) {
      throw ArgumentError.value(label, 'label', 'não pode ser vazio');
    }
    if (options.isEmpty) {
      throw ArgumentError('options não pode ser vazio');
    }
    final values = options.map((option) => option.value).toList(growable: false);
    if (values.toSet().length != values.length) {
      throw ArgumentError('Valores das opções devem ser únicos');
    }
    if (value != null && !values.contains(value)) {
      throw ArgumentError.value(value, 'value', 'não pertence às opções do Select');
    }
  }

  final String label;
  final List<CiataSelectOption<T>> options;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final bool requiredField;
  final bool enabled;
  final String? helpText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final visibleLabel = requiredField ? '$label (obrigatório)' : label;

    return DropdownButtonFormField<T>(
      value: value,
      onChanged: enabled ? onChanged : null,
      decoration: InputDecoration(
        labelText: visibleLabel,
        helperText: errorText?.isNotEmpty == true ? null : helpText,
        errorText: errorText?.isNotEmpty == true ? errorText : null,
      ),
      items: options
          .map(
            (option) => DropdownMenuItem<T>(
              value: option.value,
              enabled: enabled && option.enabled,
              child: Text(option.label),
            ),
          )
          .toList(),
    );
  }
}
