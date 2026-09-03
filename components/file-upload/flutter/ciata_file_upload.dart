import 'package:flutter/material.dart';

/// Implementação experimental do CMP-0020 File Upload para Flutter.
///
/// Este componente preserva a ação acessível no Design System sem impor
/// dependência de plugin. O host deve conectar `onPressed` ao seletor nativo
/// de documentos suportado pela aplicação.
class CiataFileUpload extends StatelessWidget {
  const CiataFileUpload({
    super.key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
  }) : assert(label.trim() != '', 'label não pode ser vazio');

  final String label;
  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onPressed : null,
      child: Text(label),
    );
  }
}
