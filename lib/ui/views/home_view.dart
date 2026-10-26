import 'package:flutter/material.dart';
import 'package:worship_songs/ui/views/song_list_view.dart';
import 'package:worship_songs/ui/views/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.settings_rounded),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const SettingsView()),
        ),
      ),
    ),
    body: const SongListView(),
  );
}
