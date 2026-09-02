import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0003 Checkbox para Flutter.
class CiataCheckbox extends StatelessWidget {
  const CiataCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.requiredField = false,
    this.enabled = true,
    this.helpText,
    this.errorText,
    this.tristate = false,
  }) : assert(label != '', 'label não pode ser vazio');

  final String label;
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final bool requiredField;
  final bool enabled;
  final String? helpText;
  final String? errorText;
  final bool tristate;

  @override
  Widget build(BuildContext context) {
    final effectiveOnChanged = enabled ? onChanged : null;
    final visibleLabel = requiredField ? '$label (obrigatório)' : label;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          value: value,
          tristate: tristate,
          onChanged: effectiveOnChanged,
          title: Text(visibleLabel),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
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
    );
  }
}
