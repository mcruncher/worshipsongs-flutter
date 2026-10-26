import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worship_songs/core/ui/views/song_database_songs_view.dart';
import 'package:worship_songs/core/ui/views/song_database_view.dart';
import 'package:worship_songs/core/utils/providers/song_database_providers.dart';

class SongDatabaseGateView extends ConsumerWidget {
  const SongDatabaseGateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedSongDatabaseViewModelProvider);

    return selected.when(
      data: (key) => key == null ? const SongDatabaseView() : SongDatabaseSongsView(databaseKey: key),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => const SongDatabaseView(),
    );
  }
}