import 'package:flutter/material.dart';

class AppTheme {
  //Colors
  static const primary = Color(0xFF2F82FF);
  static const background = Color(0xFFF3F7FD);

  //Screen
  static const mainPadding = 20.0;

  //Buttons
  static const buttonRadius = 10.0;

  ///Elevated Button
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
    ),
  );
  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.white,
      elevation: 3.0,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
    ),
  );

  //Card
  static const cardRadius = 15.0;
  static final cardTheme = CardTheme(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(cardRadius),
    ),
  );

  //Field
  static const inputRadius = 10.0;

  ///TextField
  static final textFieldTheme = InputDecorationTheme(
    filled: true,
    fillColor: background,
    hintStyle: TextStyle(
      fontSize: 14,
      color: Color(0xFF97A5C9),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(inputRadius),
      //borderSide: BorderSide.none,
    ),
  );

  //Dialog
  static const dialogRadius = 15.0;
  static final dialogTheme = DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(dialogRadius),
    ),
  );

  //Light Theme
  static final lightTheme = ThemeData(
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    cardTheme: cardTheme,
    inputDecorationTheme: textFieldTheme,
    dialogTheme: dialogTheme,
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
      secondary: primary,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: background,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );
}
