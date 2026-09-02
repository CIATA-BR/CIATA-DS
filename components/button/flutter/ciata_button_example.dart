import 'package:flutter/material.dart';

import 'ciata_button.dart';

class CiataButtonExample extends StatefulWidget {
  const CiataButtonExample({super.key});

  @override
  State<CiataButtonExample> createState() => _CiataButtonExampleState();
}

class _CiataButtonExampleState extends State<CiataButtonExample> {
  bool loading = false;

  Future<void> _save() async {
    if (loading) return;

    setState(() => loading = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CiataButton(
          label: 'Salvar alterações',
          loading: loading,
          onPressed: _save,
        ),
        const SizedBox(height: 12),
        CiataButton(
          label: 'Cancelar',
          variant: CiataButtonVariant.secondary,
          onPressed: () {},
        ),
        const SizedBox(height: 12),
        CiataButton(
          label: 'Excluir arquivo',
          variant: CiataButtonVariant.danger,
          onPressed: () {},
        ),
      ],
    );
  }
}
