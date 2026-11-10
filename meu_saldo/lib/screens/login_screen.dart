import 'package:flutter/material.dart';

import '../widgets/labeled_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _entrar() {
    if (_formKey.currentState!.validate()) {
      // Por enquanto não há backend: só navega para o Dashboard.
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          LabeledField(
                            label: 'E-mail',
                            hint: 'Digite seu e-mail',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) =>
                                (v == null || !v.contains('@'))
                                    ? 'Informe um e-mail válido'
                                    : null,
                          ),
                          const SizedBox(height: 16),
                          LabeledField(
                            label: 'Senha',
                            hint: 'Digite sua senha',
                            controller: _senhaController,
                            obscure: true,
                            validator: (v) => (v == null || v.isEmpty)
                                ? 'Informe sua senha'
                                : null,
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: _entrar,
                            child: const Text('ENTRAR'),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                color: Colors.black87,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Ainda não possui uma conta? '),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/cadastro'),
                      child: const Text(
                        'Criar conta',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
