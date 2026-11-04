import 'package:flutter/material.dart';
import 'package:worship_songs/ui/views/song_list_view.dart';
import 'package:worship_songs/core/ui/views/settings_view.dart';

class HomeView extends StatelessWidget {
  final String databaseKey;
  const HomeView({super.key, required this.databaseKey});

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
    body: SongListView(databaseKey: databaseKey,),
  );
}
