import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worship_songs/core/utils/providers/song_database_providers.dart';
import 'package:worship_songs/data/utils/theme_icon_utils.dart';
import 'package:worship_songs/utils/notifiers/theme_change_notifier.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedKey = ref.watch(selectedSongDatabaseViewModelProvider).value;
    final databases = ref.watch(songDatabaseViewModelProvider).value ?? const [];
    final selected = databases.where((database) => database.key == selectedKey).firstOrNull;
    
    return Scaffold(
      appBar: AppBar(leading: BackButton()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: _DatabaseCard(name: selected?.name, language: selected?.language),
          ),
          Row(
            spacing: 40,
              children: [_createAppearanceLabel(), _AppearanceDropdown()],
          )
        ],
      )
    );
  }

  Widget _createAppearanceLabel() => Padding(
    padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 30),
    child: Text("Appearance"),
  );
}

class _DatabaseCard extends StatelessWidget {
  final String? name;
  final String? language;

  const _DatabaseCard({required this.name, required this.language});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text('Database', style: theme.textTheme.titleMedium)),
              OutlinedButton(onPressed: () {}, child: const Text('Configure')),
            ],
          ),
          const SizedBox(height: 12),
          Text('Currently Selected', style: theme.textTheme.bodySmall),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? 'No database selected',
                        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      if (language != null) ...[
                        const SizedBox(height: 4),
                        Text(language!, style: theme.textTheme.bodySmall),
                      ],
                    ],
                  ),
                ),
                if (name != null) const Icon(Icons.check_circle_outline),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppearanceDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeChangeNotifier,
      builder: (context, theme, child) => DropdownMenu(
        width: 200,
        initialSelection: theme,
        leadingIcon: getIcon(theme),
        dropdownMenuEntries: ThemeMode.values
            .map(
              (themeMode) => DropdownMenuEntry(
                leadingIcon: getIcon(themeMode),
                value: themeMode,
                label: themeMode.name,
              ),
            )
            .toList(),

        onSelected: (value) {
          if (value != null) {
            themeChangeNotifier.value = value;
          }
        },
      ),
    );
  }
}
