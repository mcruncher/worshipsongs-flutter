import 'package:flutter/material.dart';
import 'package:worship_songs/ui/views/settings_view.dart';

class SongDatabaseSongsView extends StatelessWidget {
  final String databaseKey;

  const SongDatabaseSongsView({super.key, required this.databaseKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.settings_rounded),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => const SettingsView()),
              ),
          ),
      title: Text(databaseKey),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(title: Text('Sample song ${index + 1}')),
      ),
    );
  }
}