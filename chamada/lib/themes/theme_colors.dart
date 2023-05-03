import 'package:flutter/material.dart';

class ThemeColors {
  static const MaterialColor primaryColor = MaterialColor(0xFF0D0D0D, {
    50: Color.fromRGBO(13, 13, 13, 0.1),
    100: Color.fromRGBO(13, 13, 13, 0.2),
    200: Color.fromRGBO(13, 13, 13, 0.3),
    300: Color.fromRGBO(13, 13, 13, 0.4),
    400: Color.fromRGBO(13, 13, 13, 0.5),
    500: Color.fromRGBO(13, 13, 13, 0.6),
    600: Color.fromRGBO(13, 13, 13, 0.7),
    700: Color.fromRGBO(13, 13, 13, 0.8),
    800: Color.fromRGBO(13, 13, 13, 0.9),
    900: Color.fromRGBO(13, 13, 13, 1.0),
  });
  LinearGradient myGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0D0D0D),
      Color(0xFFF2CB05),
    ],
  );

  static const division = Color.fromRGBO(166, 166, 166, 1.0);
  static const textYellow = Color.fromRGBO(242, 203, 5, 1);
  static const textColor = Colors.white;
}
