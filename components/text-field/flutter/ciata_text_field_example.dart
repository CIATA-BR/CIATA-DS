import 'package:flutter/material.dart';
import 'ciata_text_field.dart';

class CiataTextFieldExample extends StatefulWidget {
  const CiataTextFieldExample({super.key});

  @override
  State<CiataTextFieldExample> createState() => _CiataTextFieldExampleState();
}

class _CiataTextFieldExampleState extends State<CiataTextFieldExample> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CMP-0002 TextField')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CiataTextField(
            controller: _emailController,
            label: 'E-mail',
            requiredField: true,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
            helpText: 'Use o endereço que você acessa com frequência.',
          ),
          const SizedBox(height: 16),
          CiataTextField(
            controller: _passwordController,
            label: 'Senha',
            password: true,
            requiredField: true,
            autofillHints: const [AutofillHints.password],
          ),
          const SizedBox(height: 16),
          CiataTextField(
            controller: _notesController,
            label: 'Observações',
            minLines: 3,
            maxLines: 6,
          ),
        ],
      ),
    );
  }
}
