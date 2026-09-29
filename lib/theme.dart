import 'package:flutter/material.dart';

final double _iconSize = 20;
final double _dropdownRadius = 10;

ThemeData defaultLightTheme = _buildTheme(brightness: Brightness.light);

ThemeData defaultDarkTheme = _buildTheme(brightness: Brightness.dark);

ThemeData _buildTheme({required Brightness brightness}) => ThemeData(
  brightness: brightness,
  iconTheme: _iconThemeData(),
  iconButtonTheme: _iconButtonThemeData(),
  dropdownMenuTheme: _dropdownMenuThemeData(),
);

IconThemeData _iconThemeData() => IconThemeData(size: _iconSize);

IconButtonThemeData _iconButtonThemeData() => IconButtonThemeData(
  style: ButtonStyle(iconSize: WidgetStatePropertyAll(_iconSize)),
);

DropdownMenuThemeData _dropdownMenuThemeData() => DropdownMenuThemeData(
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_dropdownRadius),
    ),
  ),
);
