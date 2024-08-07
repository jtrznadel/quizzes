import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData(
  brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
        primary: Color(0xFF116DF6),
        onPrimary: Color(0xFFFDFEFF),
        secondary: Color(0xFFE2F2FF),
        onSecondary: Color(0xFF116DF6),
        surface: Color(0xFFF4F6F7),
        surfaceContainer: Color(0xFFFDFEFF),
        ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 32,
        height: 1.2,
        color: const Color(0xFF2E2E2E)
      ),
      headlineMedium: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontStyle: GoogleFonts.inter().fontStyle,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: const Color(0xFF2E2E2E)
      ),
      headlineSmall: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontStyle: GoogleFonts.inter().fontStyle,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.2,
        color: const Color(0xFF2E2E2E)
      ),
      bodyLarge: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: const Color(0xFF2E2E2E)
      ),
      bodyMedium: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: const Color(0xFF2E2E2E)
      ),
      bodySmall: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: const Color(0xFF2E2E2E)
      ),
      labelLarge: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF2E2E2E)
      ),
      labelMedium: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF2E2E2E)
      ),
      labelSmall: TextStyle(
        fontFamily: GoogleFonts.inter().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF2E2E2E)
      ),
    ));
