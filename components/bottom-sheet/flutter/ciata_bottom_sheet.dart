import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0018 Bottom Sheet para Flutter.
Future<T?> showCiataBottomSheet<T>({
  required BuildContext context,
  required String title,
  required Widget child,
  String closeLabel = 'Fechar',
}) {
  final trimmedTitle = title.trim();
  final trimmedCloseLabel = closeLabel.trim();
  if (trimmedTitle.isEmpty) {
    throw ArgumentError.value(title, 'title', 'não pode ser vazio');
  }
  if (trimmedCloseLabel.isEmpty) {
    throw ArgumentError.value(closeLabel, 'closeLabel', 'não pode ser vazio');
  }

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(header: true, child: Text(trimmedTitle)),
            const SizedBox(height: 16),
            Flexible(child: SingleChildScrollView(child: child)),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(trimmedCloseLabel),
            ),
          ],
        ),
      ),
    ),
  );
}
