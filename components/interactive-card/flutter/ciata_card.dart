import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0010 Card interativo para Flutter.
class CiataCard extends StatelessWidget {
  const CiataCard({
    super.key,
    required this.title,
    this.description,
    this.onTap,
  }) : assert(title != '', 'title não pode ser vazio');

  final String title;
  final String? description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (description != null && description!.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(description!),
          ],
        ],
      ),
    );

    return Card(
      child: onTap == null
          ? content
          : InkWell(
              onTap: onTap,
              child: Semantics(button: true, label: title, child: content),
            ),
    );
  }
}
