import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0011 Pagination para Flutter.
class CiataPagination extends StatelessWidget {
  CiataPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChange,
    String previousLabel = 'Anterior',
    String nextLabel = 'Próxima',
    String Function(int page)? pageLabel,
  })  : previousLabel = previousLabel.trim(),
        nextLabel = nextLabel.trim(),
        pageLabel = pageLabel ?? ((page) => 'Página $page') {
    if (totalPages < 1) {
      throw ArgumentError.value(totalPages, 'totalPages', 'deve ser maior que zero');
    }
    if (currentPage < 1 || currentPage > totalPages) {
      throw ArgumentError.value(currentPage, 'currentPage', 'fora do intervalo válido');
    }
    if (this.previousLabel.isEmpty || this.nextLabel.isEmpty) {
      throw ArgumentError('previousLabel e nextLabel não podem ser vazios');
    }
  }

  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChange;
  final String previousLabel;
  final String nextLabel;
  final String Function(int page) pageLabel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        TextButton(
          onPressed: currentPage > 1 ? () => onPageChange(currentPage - 1) : null,
          child: Text(previousLabel),
        ),
        for (var page = 1; page <= totalPages; page++)
          Semantics(
            selected: page == currentPage,
            child: TextButton(
              onPressed: page == currentPage ? null : () => onPageChange(page),
              child: Text(_labelFor(page)),
            ),
          ),
        TextButton(
          onPressed: currentPage < totalPages ? () => onPageChange(currentPage + 1) : null,
          child: Text(nextLabel),
        ),
      ],
    );
  }

  String _labelFor(int page) {
    final label = pageLabel(page).trim();
    if (label.isEmpty) {
      throw ArgumentError.value(label, 'pageLabel', 'deve retornar texto não vazio');
    }
    return label;
  }
}
