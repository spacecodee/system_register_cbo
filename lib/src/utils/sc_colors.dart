import 'package:flutter/material.dart';

class ScColors {
  //colors
  static const Color primary = Color(0xE6000000);
  static const Color secondary = Color(0xFF5260E9);
  static const Color accent = Color(0xFFFFFFFF);

  static const MaterialColor primaryMaterial = MaterialColor(0xE6000000, <int, Color>{
    50: Color(0x0d000000),
    100: Color(0x1A000000),
    200: Color(0x33000000),
    300: Color(0x4D000000),
    400: Color(0x66000000),
    500: Color(0x80000000),
    600: Color(0x99000000),
    700: Color(0xB3000000),
    800: Color(0xCC000000),
    900: Color(0xE6000000),
  });
  static const MaterialColor secondaryMaterial = MaterialColor(0xFF5260E9, <int, Color>{});
  static const MaterialColor accentMaterial = MaterialColor(0xFFFFFFFF, <int, Color>{});
}
