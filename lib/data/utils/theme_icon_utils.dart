import 'package:flutter/material.dart';

Icon getIcon(ThemeMode themeMode) {
  IconData iconData = switch (themeMode) {
    ThemeMode.system => Icons.contrast_rounded,
    ThemeMode.light => Icons.light_mode_rounded,
    ThemeMode.dark => Icons.dark_mode_rounded,
  };

  return Icon(iconData);
}