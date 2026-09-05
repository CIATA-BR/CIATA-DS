import 'package:flutter/material.dart';

class CiataRadioOption<T> {
  CiataRadioOption({
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

/// Implementação experimental do CMP-0004 Radio para Flutter.
class CiataRadioGroup<T> extends StatelessWidget {
  CiataRadioGroup({
    super.key,
    required String legend,
    required this.options,
    required this.value,
    required this.onChanged,
    this.requiredField = false,
    this.enabled = true,
    String? helpText,
    String? errorText,
  })  : legend = legend.trim(),
        helpText = helpText?.trim(),
        errorText = errorText?.trim() {
    if (this.legend.isEmpty) {
      throw ArgumentError.value(legend, 'legend', 'não pode ser vazio');
    }
    if (options.length < 2) {
      throw ArgumentError('Radio Group deve possuir ao menos duas opções');
    }
    final values = options.map((option) => option.value).toList(growable: false);
    if (values.toSet().length != values.length) {
      throw ArgumentError('Valores das opções devem ser únicos');
    }
    if (value != null && !values.contains(value)) {
      throw ArgumentError.value(value, 'value', 'não pertence às opções do grupo');
    }
  }

  final String legend;
  final List<CiataRadioOption<T>> options;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final bool requiredField;
  final bool enabled;
  final String? helpText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final visibleLegend = requiredField ? '$legend (obrigatório)' : legend;

    return Semantics(
      container: true,
      label: visibleLegend,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            visibleLegend,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          RadioGroup<T>(
            groupValue: value,
            onChanged: enabled ? onChanged : null,
            child: Column(
              children: options
                  .map(
                    (option) => RadioListTile<T>(
                      value: option.value,
                      enabled: enabled && option.enabled,
                      title: Text(option.label),
                      contentPadding: EdgeInsets.zero,
                    ),
                  )
                  .toList(),
            ),
          ),
          if (helpText case final text? when text.isNotEmpty)
            Text(text, style: Theme.of(context).textTheme.bodySmall),
          if (errorText case final text? when text.isNotEmpty)
            Semantics(
              liveRegion: false,
              label: 'Erro: $text',
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
