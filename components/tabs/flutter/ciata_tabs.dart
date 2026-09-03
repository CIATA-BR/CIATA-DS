import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0013 Tabs para Flutter.
class CiataTabs extends StatelessWidget {
  const CiataTabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelectionChange,
    required this.panelBuilder,
  })  : assert(labels.length > 0, 'labels não pode ser vazio'),
        assert(selectedIndex >= 0 && selectedIndex < labels.length,
            'selectedIndex fora do intervalo válido');

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelectionChange;
  final Widget Function(int) panelBuilder;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: labels.length,
      initialIndex: selectedIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            onTap: onSelectionChange,
            tabs: [for (final label in labels) Tab(text: label)],
          ),
          panelBuilder(selectedIndex),
        ],
      ),
    );
  }
}
