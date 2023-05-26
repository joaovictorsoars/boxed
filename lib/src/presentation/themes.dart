import 'package:boxed/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxedThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: BoxedColors.white,
    brightness: Brightness.light,
    textTheme: GoogleFonts.interTextTheme().copyWith(
      titleLarge: const TextStyle(color: BoxedColors.black),
    ),
  );
}
