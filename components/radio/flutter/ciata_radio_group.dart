import 'package:flutter/material.dart';

class CiataRadioOption<T> {
  const CiataRadioOption({
    required this.value,
    required this.label,
    this.enabled = true,
  });

  final T value;
  final String label;
  final bool enabled;
}

/// Implementação experimental do CMP-0004 Radio para Flutter.
class CiataRadioGroup<T> extends StatelessWidget {
  const CiataRadioGroup({
    super.key,
    required this.legend,
    required this.options,
    required this.value,
    required this.onChanged,
    this.requiredField = false,
    this.enabled = true,
    this.helpText,
    this.errorText,
  })  : assert(legend != '', 'legend não pode ser vazio'),
        assert(options.length >= 2, 'Radio Group deve possuir ao menos duas opções');

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
          ...options.map(
            (option) => RadioListTile<T>(
              value: option.value,
              groupValue: value,
              onChanged: enabled && option.enabled ? onChanged : null,
              title: Text(option.label),
              contentPadding: EdgeInsets.zero,
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
