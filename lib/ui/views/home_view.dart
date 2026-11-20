import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:worship_songs/ui/views/song_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings_rounded),
          onPressed: () => context.push("/settings"),
        ),
      ),
      body: const SongListView(),
    );
  }
}
