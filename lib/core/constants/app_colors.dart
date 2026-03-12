import 'package:flutter/material.dart';

/// Color constants extracted from Tailwind design tokens.
/// Primary: #0f45b3, Accent Gold: #d4af37
class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF0F45B3);
  static const Color accentGold = Color(0xFFD4AF37);

  // Backgrounds
  static const Color backgroundLight = Color(0xFFF6F6F8);
  static const Color backgroundDark = Color(0xFF101622);
  static const Color cardDark = Color(0xFF1C2331);

  // Slate palette (matches Tailwind slate)
  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate200 = Color(0xFFE2E8F0);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate900 = Color(0xFF0F172A);

  // Semantic
  static const Color green = Color(0xFF22C55E);
  static const Color red = Color(0xFFEF4444);
  static const Color emerald = Color(0xFF10B981);
}
