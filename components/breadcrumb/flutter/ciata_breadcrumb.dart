import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0016 Breadcrumb para Flutter.
class CiataBreadcrumb extends StatelessWidget {
  CiataBreadcrumb({
    super.key,
    required List<(String, VoidCallback?)> items,
  }) : items = [
          for (final item in items) (item.$1.trim(), item.$2),
        ] {
    if (this.items.isEmpty) {
      throw ArgumentError.value(items, 'items', 'não pode ser vazio');
    }
    if (this.items.any((item) => item.$1.isEmpty)) {
      throw ArgumentError.value(items, 'items', 'rótulos não podem ser vazios');
    }
    if (this.items.last.$2 != null) {
      throw ArgumentError.value(items, 'items', 'o item atual deve ser não interativo');
    }
    if (this.items.take(this.items.length - 1).any((item) => item.$2 == null)) {
      throw ArgumentError.value(items, 'items', 'itens anteriores ao atual devem ser interativos');
    }
  }

  final List<(String, VoidCallback?)> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final item in items)
          if (item.$2 == null)
            Text(item.$1)
          else
            TextButton(
              onPressed: item.$2,
              child: Text(item.$1),
            ),
      ],
    );
  }
}
