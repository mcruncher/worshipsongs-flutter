import 'package:flutter/material.dart';
import 'package:worship_songs/notifier/theme_change_notifier.dart';
import 'package:worship_songs/utils/theme_icon_utils.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton()),
      body: Row(
        spacing: 40,
        children: [_createAppearanceLabel(), _AppearanceDropdown()],
      ),
    );
  }
}

Padding _createAppearanceLabel() => Padding(
  padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 30),
  child: Text("Appearance"),
);

class _AppearanceDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeChangeNotifier,
      builder: (context, theme, child) => DropdownMenu(
        width: 200,
        initialSelection: theme,
        leadingIcon: getIcon(theme),
        dropdownMenuEntries: ThemeMode.values
            .map(
              (themeMode) => DropdownMenuEntry(
                leadingIcon: getIcon(themeMode),
                value: themeMode,
                label: themeMode.name,
              ),
            )
            .toList(),

        onSelected: (value) {
          if (value != null) {
            themeChangeNotifier.value = value;
          }
        },
      ),
    );
  }
}
