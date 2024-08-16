
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static const Color secondary = Colors.blueAccent;
  static const Color background = Colors.white;
  static const Color error = Colors.red;

  static ThemeData lightTheme = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        color: primary,
        titleTextStyle: TextStyle(
            color: background,
            fontSize: 22
        )
      ),
      dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(
              color: primary,
              fontSize: 12
          )
      ),
    textButtonTheme:  TextButtonThemeData(
         style: TextButton.styleFrom(
           textStyle: const TextStyle(color: primary)
         )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: background
    )
  );
}