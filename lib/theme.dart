import 'package:flutter/material.dart';

ThemeData defaultLightTheme = ThemeData(
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
  brightness: Brightness.light,
);

ThemeData defaultDarkTheme = ThemeData(brightness: Brightness.dark);
