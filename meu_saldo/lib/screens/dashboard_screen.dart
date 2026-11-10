import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Gasto por categoria (dados fixos por enquanto, como no protótipo).
class Gasto {
  const Gasto(this.emoji, this.categoria, this.valor, this.limite);
  final String emoji;
  final String categoria;
  final double valor;
  final double limite;
}

const _gastos = [
  Gasto('🍔', 'Alimentação', 450, 900),
  Gasto('🏠', 'Casa', 900, 1200),
  Gasto('🚗', 'Transporte', 300, 900),
  Gasto('🎮', 'Lazer', 200, 750),
  Gasto('💊', 'Saúde', 200, 750),
];

String formatarReal(double valor, {bool centavos = true}) {
  final partes = valor.toStringAsFixed(2).split('.');
  final inteiro = partes[0].replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+$)'),
    (m) => '${m[1]}.',
  );
  return centavos ? 'R\$ $inteiro,${partes[1]}' : 'R\$ $inteiro';
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _abaAtual = 0;

  static const double _entradas = 3800;
  static const double _saidas = 2050;

  void _emBreve() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Em breve!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            _cabecalho(),
            const SizedBox(height: 16),
            _cardSaldo(),
            const SizedBox(height: 28),
            const Text(
              'Gastos do mês',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const Text(
              'Gastos por categoria',
              style: TextStyle(color: AppColors.textMuted, fontSize: 13),
            ),
            const SizedBox(height: 12),
            for (final g in _gastos) _linhaGasto(g),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: ElevatedButton(
              onPressed: _emBreve,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                side: BorderSide.none,
              ),
              child: const Text('+ Adicionar movimentação'),
            ),
          ),
          NavigationBar(
            selectedIndex: _abaAtual,
            backgroundColor: Colors.white,
            height: 64,
            onDestinationSelected: (i) {
              setState(() => _abaAtual = i);
              if (i != 0) _emBreve();
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: 'Início'),
              NavigationDestination(
                  icon: Icon(Icons.bar_chart), label: 'Relatórios'),
              NavigationDestination(
                  icon: Icon(Icons.add_circle_outline), label: 'Adicionar'),
              NavigationDestination(
                  icon: Icon(Icons.person_outline), label: 'Perfil'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cabecalho() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olá, Alexia! 👋',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                'Aqui está um resumo das suas finanças.',
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF2F2F2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: _emBreve,
          ),
        ),
      ],
    );
  }

  Widget _cardSaldo() {
    const saldo = _entradas - _saidas;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          const Text('Saldo disponível',
              style: TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 4),
          Text(
            formatarReal(saldo),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _resumo(Icons.arrow_upward, AppColors.income, 'Entradas',
                  _entradas),
              Container(width: 1, height: 28, color: Colors.white24),
              _resumo(Icons.arrow_downward, AppColors.expense, 'Saídas',
                  _saidas),
            ],
          ),
        ],
      ),
    );
  }

  Widget _resumo(IconData icone, Color cor, String titulo, double valor) {
    return Row(
      children: [
        Icon(icone, color: cor, size: 16),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo,
                style: const TextStyle(color: Colors.white70, fontSize: 11)),
            Text(
              formatarReal(valor),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }

  Widget _linhaGasto(Gasto g) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(g.emoji, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
              Expanded(child: Text(g.categoria)),
              Text(
                formatarReal(g.valor, centavos: false),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (g.valor / g.limite).clamp(0.0, 1.0),
              minHeight: 4,
              backgroundColor: AppColors.track,
              color: AppColors.bar,
            ),
          ),
        ],
      ),
    );
  }
}
