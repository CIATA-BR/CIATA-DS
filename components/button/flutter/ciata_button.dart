import 'package:flutter/material.dart';

enum CiataButtonVariant { primary, secondary, danger, ghost }

class CiataButton extends StatelessWidget {
  const CiataButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = CiataButtonVariant.primary,
    this.loading = false,
    this.disabled = false,
    this.loadingLabel = 'Operação em andamento',
  });

  final String label;
  final VoidCallback? onPressed;
  final CiataButtonVariant variant;
  final bool loading;
  final bool disabled;
  final String loadingLabel;

  VoidCallback? get _effectiveOnPressed {
    if (disabled) return null;
    if (loading) return () {};
    return onPressed;
  }

  ButtonStyle _style(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final base = ButtonStyle(
      minimumSize: const WidgetStatePropertyAll(Size(44, 44)),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
    );

    switch (variant) {
      case CiataButtonVariant.primary:
        return base;
      case CiataButtonVariant.secondary:
        return base;
      case CiataButtonVariant.danger:
        return base.copyWith(
          backgroundColor: WidgetStatePropertyAll(colorScheme.error),
          foregroundColor: WidgetStatePropertyAll(colorScheme.onError),
        );
      case CiataButtonVariant.ghost:
        return base;
    }
  }

  Widget _content(BuildContext context) {
    final text = Text(
      label,
      textAlign: TextAlign.center,
    );

    if (!loading) return text;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ExcludeSemantics(
          child: SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(child: text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = Semantics(
      button: true,
      enabled: !disabled,
      label: label,
      value: loading ? loadingLabel : null,
      child: ExcludeSemantics(
        child: _buildNativeButton(context),
      ),
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 44, minWidth: 44),
      child: child,
    );
  }

  Widget _buildNativeButton(BuildContext context) {
    final style = _style(context);
    final child = _content(context);

    switch (variant) {
      case CiataButtonVariant.primary:
        return ElevatedButton(
          onPressed: _effectiveOnPressed,
          style: style,
          child: child,
        );
      case CiataButtonVariant.secondary:
        return OutlinedButton(
          onPressed: _effectiveOnPressed,
          style: style,
          child: child,
        );
      case CiataButtonVariant.danger:
        return ElevatedButton(
          onPressed: _effectiveOnPressed,
          style: style,
          child: child,
        );
      case CiataButtonVariant.ghost:
        return TextButton(
          onPressed: _effectiveOnPressed,
          style: style,
          child: child,
        );
    }
  }
}
