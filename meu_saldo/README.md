# Meu Saldo 💰

Aplicativo de controle financeiro pessoal desenvolvido em **Flutter**.

Protótipo no Figma: [Meu Saldo - Protótipo](https://www.figma.com/design/msZd4ulFnb8d27MMj2rXEP/Meu-Saldo---Prot%C3%B3tipo?node-id=0-1)

## Telas implementadas (início do projeto)

- [x] Login
- [x] Cadastro (Criar uma conta)
- [x] Início / Dashboard (saldo, entradas, saídas e gastos por categoria)
- [ ] Movimentação
- [ ] Histórico
- [ ] Orçamento
- [ ] Perfil

> Nesta etapa os dados são fixos (mock). Ainda não há banco de dados nem autenticação real.

## Como rodar

```bash
flutter create .     # gera as pastas de plataforma (android, ios, web...) se ainda não existirem
flutter pub get
flutter run
```

## Estrutura

```
lib/
├── main.dart                  # rotas do app
├── theme/app_theme.dart       # cores e tema
├── widgets/labeled_field.dart # campo de formulário com rótulo
└── screens/
    ├── login_screen.dart
    ├── cadastro_screen.dart
    └── dashboard_screen.dart
```

## Grupo

| Nome | RA |
|------|----|
| Milena Souza de Melo | 2025116202 |
| Karina da Costa Pereira | 2025112234 |
| Gabriella Alexia de Oliveira Santos | 2025112966 |
| Vitoria Regina Silva Santos | 2025118200 |
| Stefany Alves Bertolacini | 2025103757 |
