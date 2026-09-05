import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0007 Alert/Status para Flutter.
class CiataAlertStatus extends StatelessWidget {
  CiataAlertStatus({
    super.key,
    required String message,
    String? title,
    String priority = 'status',
  })  : message = message.trim(),
        title = title?.trim(),
        priority = priority.trim() {
    if (this.message.isEmpty) {
      throw ArgumentError.value(message, 'message', 'não pode ser vazio');
    }
    if (this.priority != 'status' && this.priority != 'alert') {
      throw ArgumentError.value(
        priority,
        'priority',
        'deve ser status ou alert',
      );
    }
  }

  final String message;
  final String? title;
  final String priority;

  @override
  Widget build(BuildContext context) {
    final normalizedTitle = title?.isNotEmpty == true ? title : null;
    final text = [
      if (normalizedTitle != null) normalizedTitle,
      message,
    ].join('. ');

    return Semantics(
      liveRegion: true,
      label: text,
      child: ExcludeSemantics(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (normalizedTitle != null)
              Text(
                normalizedTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
