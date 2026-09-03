import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0015 Menu para Flutter.
class CiataMenu extends StatelessWidget {
  const CiataMenu({
    super.key,
    required this.label,
    required this.items,
  })  : assert(label != '', 'label não pode ser vazio'),
        assert(items.length > 0, 'items não pode ser vazio');

  final String label;
  final List<(String, VoidCallback)> items;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      tooltip: label,
      onSelected: (index) => items[index].$2(),
      itemBuilder: (context) => [
        for (var index = 0; index < items.length; index++)
          PopupMenuItem<int>(
            value: index,
            child: Text(items[index].$1),
          ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Text(label),
      ),
    );
  }
}
