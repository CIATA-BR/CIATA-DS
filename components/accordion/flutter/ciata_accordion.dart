import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0014 Accordion para Flutter.
class CiataAccordion extends StatelessWidget {
  CiataAccordion({
    super.key,
    required List<String> labels,
    required Set<int> expanded,
    required this.onToggle,
    required this.panelBuilder,
  })  : labels = List.unmodifiable(labels.map((label) => label.trim())),
        expanded = Set.unmodifiable(expanded) {
    if (this.labels.isEmpty) {
      throw ArgumentError('labels não pode ser vazio');
    }
    if (this.labels.any((label) => label.isEmpty)) {
      throw ArgumentError('rótulos não podem ser vazios');
    }
    if (this.expanded.any((index) => index < 0 || index >= this.labels.length)) {
      throw ArgumentError('expanded contém índice inválido');
    }
  }

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
