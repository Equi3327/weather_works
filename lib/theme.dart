import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
    useMaterial3:true,
  primaryColorDark:  const Color(0xffffffff).withOpacity(0.5),
  primaryColorLight: const Color(0xffffffff).withOpacity(0.5),
  // primaryColorDark: const Color(0xFF0097A7),
  // primaryColorLight: const Color(0xFFB2EBF2),
  // primaryColor: const Color(0xFF00BCD4),
  primaryColor: const Color(0xffffffff).withOpacity(0.5),
  colorScheme:  ColorScheme.light(
      // secondary: Color(0xFF009688),
    secondary:  Color(0xffffffff).withOpacity(0.5),
  ),
  appBarTheme: AppBarTheme(
    color: const Color(0xffffffff).withOpacity(0.5),
    titleTextStyle: GoogleFonts.poppinsTextTheme(GoogleFonts.poppinsTextTheme())
        .apply(bodyColor: Color(0xFF363B64),)
        .titleLarge,
  ),
  // scaffoldBackgroundColor: const Color(0xFFE0F2F1),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
