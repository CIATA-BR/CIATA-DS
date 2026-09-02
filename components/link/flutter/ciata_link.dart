import 'package:flutter/material.dart';

class CiataLink extends StatelessWidget {
  const CiataLink({super.key, required this.label, required this.onTap, this.opensNewContext = false})
      : assert(label != '', 'label não pode ser vazio');

  final String label;
  final VoidCallback onTap;
  final bool opensNewContext;

  @override
  Widget build(BuildContext context) {
    final text = opensNewContext ? '$label (abre em novo contexto)' : label;
    return Semantics(
      link: true,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.underline)),
        ),
      ),
    );
  }
}
