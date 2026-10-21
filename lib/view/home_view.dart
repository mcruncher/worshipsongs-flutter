import 'package:flutter/material.dart';
import 'package:worship_songs/view/list_songs_view.dart';
import 'package:worship_songs/view/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
    body: ListSongsView(),
  );
}
