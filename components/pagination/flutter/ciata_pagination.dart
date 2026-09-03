import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0011 Pagination para Flutter.
class CiataPagination extends StatelessWidget {
  const CiataPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChange,
  })  : assert(totalPages > 0, 'totalPages deve ser maior que zero'),
        assert(currentPage >= 1 && currentPage <= totalPages, 'currentPage fora do intervalo válido');

  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChange;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        TextButton(
          onPressed: currentPage > 1 ? () => onPageChange(currentPage - 1) : null,
          child: const Text('Anterior'),
        ),
        for (var page = 1; page <= totalPages; page++)
          Semantics(
            selected: page == currentPage,
            child: TextButton(
              onPressed: page == currentPage ? null : () => onPageChange(page),
              child: Text('Página $page'),
            ),
          ),
        TextButton(
          onPressed: currentPage < totalPages ? () => onPageChange(currentPage + 1) : null,
          child: const Text('Próxima'),
        ),
      ],
    );
  }
}
