import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0013 Tabs para Flutter.
class CiataTabs extends StatefulWidget {
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
  State<CiataTabs> createState() => _CiataTabsState();
}

class _CiataTabsState extends State<CiataTabs>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: widget.labels.length,
      initialIndex: widget.selectedIndex,
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant CiataTabs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.labels.length != widget.labels.length) {
      _controller.dispose();
      _controller = TabController(
        length: widget.labels.length,
        initialIndex: widget.selectedIndex,
        vsync: this,
      );
    } else if (_controller.index != widget.selectedIndex) {
      _controller.index = widget.selectedIndex;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabBar(
          controller: _controller,
          onTap: widget.onSelectionChange,
          tabs: [for (final label in widget.labels) Tab(text: label)],
        ),
        widget.panelBuilder(widget.selectedIndex),
      ],
    );
  }
}
