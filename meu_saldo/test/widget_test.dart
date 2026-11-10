import 'package:flutter_test/flutter_test.dart';

import 'package:meu_saldo/main.dart';

void main() {
  testWidgets('Tela de login abre com botão ENTRAR', (tester) async {
    await tester.pumpWidget(const MeuSaldoApp());
    expect(find.text('ENTRAR'), findsOneWidget);
    expect(find.text('Criar conta'), findsOneWidget);
  });
}
