import 'package:flutter/material.dart';

/// Cores e tema do Meu Saldo, baseados no protótipo do Figma.
class AppColors {
  static const primary = Color(0xFF2E6B45); // verde dos botões
  static const primaryDark = Color(0xFF1F4D30); // card de saldo
  static const income = Color(0xFF6FCF97);
  static const expense = Color(0xFFEB5757);
  static const text = Color(0xFF1A1A1A);
  static const textMuted = Color(0xFF8A8A8A);
  static const border = Color(0xFF1A1A1A);
  static const track = Color(0xFFE6E6E6);
  static const bar = Color(0xFF2B2F3A);
}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        hintStyle: const TextStyle(
          color: AppColors.textMuted,
          fontStyle: FontStyle.italic,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.expense),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.expense, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.border),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
