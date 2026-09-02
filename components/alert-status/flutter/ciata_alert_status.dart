import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0007 Alert/Status para Flutter.
class CiataAlertStatus extends StatelessWidget {
  const CiataAlertStatus({
    super.key,
    required this.message,
    this.title,
    this.priority = 'status',
  })  : assert(message != '', 'message não pode ser vazio'),
        assert(priority == 'status' || priority == 'alert', 'priority deve ser status ou alert');

  final String message;
  final String? title;
  final String priority;

  @override
  Widget build(BuildContext context) {
    final text = [
      if (title != null && title!.isNotEmpty) title!,
      message,
    ].join('. ');

    return Semantics(
      liveRegion: true,
      label: text,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null && title!.isNotEmpty)
            Text(title!, style: Theme.of(context).textTheme.titleMedium),
          Text(message),
        ],
      ),
    );
  }
}
