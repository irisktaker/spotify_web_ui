import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF121212),
    backgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(secondary: Color(0xFF1DB954)),
    iconTheme: const IconThemeData().copyWith(color: Colors.white),
    textTheme: TextTheme(
      headline2: const TextStyle(
        color: Colors.white,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
      ),
      headline4: TextStyle(
        fontSize: 12.0,
        color: Colors.grey[300],
        fontWeight: FontWeight.w500,
        letterSpacing: 2.0,
        fontFamily: 'Montserrat',
      ),
      bodyText1: TextStyle(
        color: Colors.grey[300],
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.0,
        fontFamily: 'Montserrat',
      ),
      bodyText2: TextStyle(
        color: Colors.grey[300],
        letterSpacing: 1.0,
        fontFamily: 'Montserrat',
      ),
    ),
  );
}
