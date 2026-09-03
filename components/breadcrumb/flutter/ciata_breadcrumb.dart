import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0016 Breadcrumb para Flutter.
class CiataBreadcrumb extends StatelessWidget {
  const CiataBreadcrumb({
    super.key,
    required this.items,
  }) : assert(items.length > 0, 'items não pode ser vazio');

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
