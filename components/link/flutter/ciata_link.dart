import 'package:flutter/material.dart';

class CiataLink extends StatelessWidget {
  CiataLink({
    super.key,
    required String label,
    required this.onTap,
    this.opensNewContext = false,
    String newContextLabel = 'abre em novo contexto',
  })  : label = label.trim(),
        newContextLabel = newContextLabel.trim() {
    if (this.label.isEmpty) {
      throw ArgumentError.value(label, 'label', 'não pode ser vazio');
    }
    if (opensNewContext && this.newContextLabel.isEmpty) {
      throw ArgumentError.value(
        newContextLabel,
        'newContextLabel',
        'não pode ser vazio quando opensNewContext estiver ativo',
      );
    }
  }

  final String label;
  final VoidCallback onTap;
  final bool opensNewContext;
  final String newContextLabel;

  @override
  Widget build(BuildContext context) {
    final text = opensNewContext ? '$label ($newContextLabel)' : label;
    return Semantics(
      link: true,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}
