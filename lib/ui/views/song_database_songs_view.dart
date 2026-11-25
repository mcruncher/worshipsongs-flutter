import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:worship_songs/ui/views/song_list_view.dart';

class SongDatabaseSongsView extends StatelessWidget {
  final String databaseKey;

  const SongDatabaseSongsView({super.key, required this.databaseKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings_rounded),
          onPressed: () => context.pushNamed("Settings"),
        ),
        title: Text(databaseKey),
      ),
      body: SongListView(databaseKey: databaseKey),
    );
  }
}
