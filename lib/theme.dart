import 'package:flutter/material.dart';

final double _iconSize = 20;
final double _dropdownRadius = 10;
final Color _splashColor = Colors.grey.shade600;

final ThemeData defaultLightTheme = _buildTheme(brightness: Brightness.light);

final ThemeData defaultDarkTheme = _buildTheme(brightness: Brightness.dark);

ThemeData _buildTheme({required Brightness brightness}) => ThemeData(
  brightness: brightness,
  iconTheme: _iconThemeData(),
  iconButtonTheme: _iconButtonThemeData(),
  dropdownMenuTheme: _dropdownMenuThemeData(),
  cardTheme: _cardThemeData(),
  splashColor: _splashColor,
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

CardThemeData _cardThemeData() => CardThemeData(
  clipBehavior: Clip.hardEdge,
  margin: EdgeInsetsGeometry.only(top: 13, left: 10, right: 10),
);
