import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.rajdhaniTextTheme(),
  primaryColorDark: const Color(0xFF0097A7),
  primaryColorLight: const Color(0xFFB2EBF2),
  primaryColor: const Color(0xFF00BCD4),
  colorScheme: const ColorScheme.light(secondary: Color(0xFF009688)),
  appBarTheme: AppBarTheme(
    color: const Color(0xFF00BCD4),
    titleTextStyle: GoogleFonts.rajdhaniTextTheme(GoogleFonts.rajdhaniTextTheme())
        .apply(bodyColor: Colors.white)
        .titleLarge,
  ),
  scaffoldBackgroundColor: const Color(0xFFE0F2F1),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
