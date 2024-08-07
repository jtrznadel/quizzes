import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/theme/app_color_scheme.dart';

final TextTheme textTheme = TextTheme(
  headlineLarge: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 32,
      height: 1.2,
      color: AppColorScheme.textPrimary),
  headlineMedium: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontStyle: GoogleFonts.inter().fontStyle,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.2,
      color: AppColorScheme.textPrimary),
  headlineSmall: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontStyle: GoogleFonts.inter().fontStyle,
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.2,
      color: AppColorScheme.textPrimary),
  bodyLarge: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColorScheme.textPrimary),
  bodyMedium: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColorScheme.textPrimary),
  bodySmall: TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColorScheme.textPrimary),
  labelLarge:
      TextStyle(fontFamily: GoogleFonts.inter().fontFamily, fontSize: 18, fontWeight: FontWeight.w700, color: AppColorScheme.textPrimary),
  labelMedium:
      TextStyle(fontFamily: GoogleFonts.inter().fontFamily, fontSize: 16, fontWeight: FontWeight.w700, color: AppColorScheme.textPrimary),
  labelSmall:
      TextStyle(fontFamily: GoogleFonts.inter().fontFamily, fontSize: 14, fontWeight: FontWeight.w700, color: AppColorScheme.textPrimary),
);
