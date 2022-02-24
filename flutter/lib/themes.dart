import 'package:flutter/material.dart';

const cookingGold = Color.fromRGBO(233, 200, 55, 1);

class CookingTheme {

    static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900),
    primaryColor: cookingGold,
    colorScheme: const ColorScheme.dark().copyWith(primary: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: cookingGold,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: cookingGold,
        ),
      ),
    ),
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
    colorScheme: const ColorScheme.light().copyWith(primary: Colors.black),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: cookingGold,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: cookingGold,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          cookingGold,
        ),
      ),
    ),
  );
}
