import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worship_songs/domain/models/song_database_metadata.dart';
import 'package:worship_songs/ui/view_models/selected_song_database_view_model.dart';
import 'package:worship_songs/ui/view_models/song_database_view_model.dart';

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
            itemBuilder: (context, index) =>
                _buildDatabaseCard(context, ref, databases[index], selectedKey),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                Text(err.toString(), textAlign: TextAlign.center),
                FilledButton(
                  onPressed: () =>
                      ref.invalidate(songDatabaseViewModelProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatabaseCard(
    BuildContext context,
    WidgetRef ref,
    SongDatabaseMetadata database,
    String? selectedKey,
  ) => _SongDatabaseCard(
    database: database,
    selected: database.key == selectedKey,
    onTap: () => _selectDatabase(context, ref, database),
  );

  Future<void> _selectDatabase(
    BuildContext context,
    WidgetRef ref,
    SongDatabaseMetadata database,
  ) async {
    await ref
        .read(selectedSongDatabaseViewModelProvider.notifier)
        .onSelect(database.key);
    if (context.mounted)
      Navigator.of(context).popUntil((route) => route.isFirst);
  }
}

class _SongDatabaseCard extends StatelessWidget {
  final SongDatabaseMetadata database;
  final bool selected;
  final VoidCallback onTap;

  const _SongDatabaseCard({
    required this.database,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      database.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (selected)
                    Icon(Icons.check_circle, color: theme.colorScheme.primary),
                ],
              ),
              const SizedBox(height: 8),
              Text(database.description, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
