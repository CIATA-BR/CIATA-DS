import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0014 Accordion para Flutter.
class CiataAccordion extends StatelessWidget {
  const CiataAccordion({
    super.key,
    required this.labels,
    required this.expanded,
    required this.onToggle,
    required this.panelBuilder,
  })  : assert(labels.length > 0, 'labels não pode ser vazio'),
        assert(expanded.every((index) => index >= 0 && index < labels.length),
            'expanded contém índice inválido');

  final List<String> labels;
  final Set<int> expanded;
  final ValueChanged<int> onToggle;
  final Widget Function(int) panelBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < labels.length; index++)
          ExpansionTile(
            key: ValueKey('ciata-accordion-$index'),
            title: Text(labels[index]),
            initiallyExpanded: expanded.contains(index),
            onExpansionChanged: (_) => onToggle(index),
            children: [panelBuilder(index)],
          ),
      ],
    );
  }
}
