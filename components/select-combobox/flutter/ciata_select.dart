import 'package:flutter/material.dart';

class CiataSelectOption<T> {
  const CiataSelectOption({
    required this.value,
    required this.label,
    this.enabled = true,
  });

  final T value;
  final String label;
  final bool enabled;
}

/// Implementação experimental do CMP-0005 Select para Flutter.
class CiataSelect<T> extends StatelessWidget {
  const CiataSelect({
    super.key,
    required this.label,
    required this.options,
    required this.value,
    required this.onChanged,
    this.requiredField = false,
    this.enabled = true,
    this.helpText,
    this.errorText,
  })  : assert(label != '', 'label não pode ser vazio'),
        assert(options.length > 0, 'options não pode ser vazio');

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
        helperText: helpText,
        errorText: errorText,
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
