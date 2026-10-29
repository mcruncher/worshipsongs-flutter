import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worship_songs/core/domain/models/song_database_metadata.dart';
import 'package:worship_songs/core/utils/providers/song_database_providers.dart';

class SongDatabaseView extends ConsumerWidget {
  const SongDatabaseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final databasesAsync = ref.watch(songDatabaseViewModelProvider);
    final selectedKey = ref.watch(selectedSongDatabaseViewModelProvider).value;

    return Scaffold(
      appBar: AppBar(title: const Text('Song Databases')),
      body: databasesAsync.when(
        data: (databases) {
          if (databases.isEmpty) {
            return const Center(child: Text('No song databases available'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: databases.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final database = databases[index];
              return _SongDatabaseCard(
                database: database,
                selected: database.key == selectedKey,
                onTap: () => ref.read(selectedSongDatabaseViewModelProvider.notifier).select(database.key),
              );
            }
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(err.toString(), textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.read(songDatabaseViewModelProvider.notifier).loadData(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SongDatabaseCard extends StatelessWidget {
  final SongDatabaseMetadata database;
  final bool selected;
  final VoidCallback onTap;

  const _SongDatabaseCard(
      {required this.database, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text(database.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold))),
                    if (selected) const Icon(Icons.check_circle),
                  ],
                ),
                const SizedBox(height: 8),
                Text(database.description, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 12),
                Chip(avatar: const Icon(Icons.language, size: 18),
                    label: Text(database.language)),
              ],
            ),
          ),
        )
    );
  }
}