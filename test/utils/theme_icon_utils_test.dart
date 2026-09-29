import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:worship_songs/utils/theme_icon_utils.dart';

void main() {
  test("Get the correct icons for the respective theme mode", () {
    // System theme mode should give contrast rounded icon
    expect(getIcon(ThemeMode.system).icon, Icons.contrast_rounded);

    // Light theme mode should give light mode rounded icon
    expect(getIcon(ThemeMode.light).icon, Icons.light_mode_rounded);

    // Dark theme mode should give dark mode rounded icon
    expect(getIcon(ThemeMode.dark).icon, Icons.dark_mode_rounded);
  });
}