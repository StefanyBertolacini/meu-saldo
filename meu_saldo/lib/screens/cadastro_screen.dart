import 'package:flutter/material.dart';

import '../widgets/labeled_field.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarController.dispose();
    super.dispose();
  }

  void _criarConta() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Conta criada com sucesso!')),
      );
      Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_circle_left_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: const Text(
          'Criar uma conta',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LabeledField(
                  label: 'Nome',
                  hint: 'Seu nome',
                  controller: _nomeController,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Informe seu nome' : null,
                ),
                const SizedBox(height: 16),
                LabeledField(
                  label: 'E-mail',
                  hint: 'Seu e-mail',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => (v == null || !v.contains('@'))
                      ? 'Informe um e-mail válido'
                      : null,
                ),
                const SizedBox(height: 16),
                LabeledField(
                  label: 'Senha',
                  hint: 'Crie uma senha',
                  controller: _senhaController,
                  obscure: true,
                  validator: (v) => (v == null || v.length < 6)
                      ? 'A senha precisa ter ao menos 6 caracteres'
                      : null,
                ),
                const SizedBox(height: 16),
                LabeledField(
                  label: 'Confirmar senha',
                  hint: 'Digite novamente',
                  controller: _confirmarController,
                  obscure: true,
                  validator: (v) => v != _senhaController.text
                      ? 'As senhas não conferem'
                      : null,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _criarConta,
                  child: const Text('CRIAR CONTA'),
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Já possui uma conta? '),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
