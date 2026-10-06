import 'package:flutter/material.dart';
import 'package:worship_songs/notifier/theme_change_notifier.dart';
import 'package:worship_songs/theme.dart';
import 'package:worship_songs/view/settings_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: themeChangeNotifier,
    builder: (context, value, child) => MaterialApp(
      title: "Worship Song",
      theme: defaultLightTheme,
      darkTheme: defaultDarkTheme,
      themeMode: value,
      home: _HomePage(),
    ),
  );
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.settings_rounded),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => SettingsView()),
        ),
      ),
    ),
  );
}
