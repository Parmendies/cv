import 'dart:ui';

import 'package:flutter/material.dart';

class AppConstants {
  // Theme Colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF000000);
  static const Color lightSurface = Color(0xFFF8F9FA);
  static const Color darkSurface = Color(0xFF0A0A0A);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color darkCard = Color(0xFF111111);
  static const Color lightBorder = Color(0xFFE5E7EB);
  static const Color darkBorder = Color(0xFF1F2937);

  // Text Colors
  static const Color lightTextPrimary = Color(0xFF111827);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
  static const Color lightTextMuted = Color(0xFF9CA3AF);
  static const Color darkTextMuted = Color(0xFF6B7280);

  // Spacing
  static EdgeInsets pagePadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal:
          MediaQuery.sizeOf(context).width > 1500
              ? ((MediaQuery.sizeOf(context).width - 1500) / 2)
              : 0,
    );
  }

  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
  static const double spacingXXXL = 64.0;

  // Layout
  static const double sidebarWidth = 280.0;
  static const double containerPadding = 80.0;
  static const double cardRadius = 12.0;
  static const double borderRadius = 8.0;

  // Typography
  static const String fontFamily = 'System';
}
