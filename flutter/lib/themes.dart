import 'package:flutter/material.dart';

const cookingGold = Color.fromRGBO(233, 200, 55, 1);

class CookingTheme {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900),
    primaryColor: cookingGold,
    secondaryHeaderColor: Color(0xFFFFEDAE),
    colorScheme: const ColorScheme.dark().copyWith(primary: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          cookingGold,
        ),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    primaryColor: cookingGold,
    secondaryHeaderColor: Color(0xFFFFEDAE),
    colorScheme: const ColorScheme.light().copyWith(primary: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          cookingGold,
        ),
      ),
    ),
  );
}
