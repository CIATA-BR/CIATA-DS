import 'package:flutter/material.dart';

class CiataTextField extends StatefulWidget {
  const CiataTextField({
    super.key,
    required this.controller,
    required this.label,
    this.helpText,
    this.errorText,
    this.requiredField = false,
    this.readOnly = false,
    this.enabled = true,
    this.password = false,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.minLines = 1,
    this.maxLines = 1,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String label;
  final String? helpText;
  final String? errorText;
  final bool requiredField;
  final bool readOnly;
  final bool enabled;
  final bool password;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final int minLines;
  final int? maxLines;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<CiataTextField> createState() => _CiataTextFieldState();
}

class _CiataTextFieldState extends State<CiataTextField> {
  bool _passwordVisible = false;

  String get _effectiveLabel => widget.requiredField
      ? '${widget.label} (obrigatório)'
      : widget.label;

  bool get _hasError => widget.errorText?.trim().isNotEmpty == true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autofillHints: widget.autofillHints,
      minLines: widget.password ? 1 : widget.minLines,
      maxLines: widget.password ? 1 : widget.maxLines,
      obscureText: widget.password && !_passwordVisible,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        labelText: _effectiveLabel,
        helperText: _hasError ? null : widget.helpText,
        errorText: _hasError ? widget.errorText : null,
        suffixIcon: widget.password
            ? TextButton(
                onPressed: widget.enabled && !widget.readOnly
                    ? () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      }
                    : null,
                child: Text(_passwordVisible ? 'Ocultar' : 'Mostrar'),
              )
            : null,
      ),
    );
  }
}
