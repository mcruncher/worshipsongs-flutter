import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worship_songs/theme.dart';
import 'package:worship_songs/ui/route/routes.dart';
import 'package:worship_songs/utils/notifiers/theme_change_notifier.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: themeChangeNotifier,
    builder: (context, value, child) => MaterialApp.router(
      title: "Worship Song",
      theme: defaultLightTheme,
      darkTheme: defaultDarkTheme,
      themeMode: value,
      routerConfig: route,
    ),
  );
}
