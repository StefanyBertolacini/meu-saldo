import 'package:flutter/material.dart';

import 'screens/cadastro_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/login_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MeuSaldoApp());
}

class MeuSaldoApp extends StatelessWidget {
  const MeuSaldoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Saldo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginScreen(),
        '/cadastro': (_) => const CadastroScreen(),
        '/dashboard': (_) => const DashboardScreen(),
      },
    );
  }
}
