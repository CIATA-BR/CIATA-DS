import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0010 Card interativo para Flutter.
class CiataCard extends StatelessWidget {
  CiataCard({
    super.key,
    required String title,
    String? description,
    this.onTap,
  })  : title = title.trim(),
        description = description?.trim() {
    if (this.title.isEmpty) {
      throw ArgumentError.value(title, 'title', 'não pode ser vazio');
    }
  }

  final String title;
  final String? description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final normalizedDescription =
        description?.isNotEmpty == true ? description : null;

    final content = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (normalizedDescription != null) ...[
            const SizedBox(height: 6),
            Text(normalizedDescription),
          ],
        ],
      ),
    );

    return Card(
      child: onTap == null
          ? content
          : Semantics(
              button: true,
              child: InkWell(onTap: onTap, child: content),
            ),
    );
  }
}
