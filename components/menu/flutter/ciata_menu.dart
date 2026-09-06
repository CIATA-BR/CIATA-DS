import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0015 Menu para Flutter.
class CiataMenu extends StatelessWidget {
  CiataMenu({
    super.key,
    required String label,
    required List<(String, VoidCallback)> items,
  })  : label = label.trim(),
        items = List.unmodifiable(
          items.map((item) => (item.$1.trim(), item.$2)),
        ) {
    if (this.label.isEmpty) {
      throw ArgumentError('label não pode ser vazio');
    }
    if (this.items.isEmpty) {
      throw ArgumentError('items não pode ser vazio');
    }
    if (this.items.any((item) => item.$1.isEmpty)) {
      throw ArgumentError('rótulos de itens não podem ser vazios');
    }
  }

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
