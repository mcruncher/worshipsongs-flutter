import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../view_models/song_search_list_view_model.dart';

class SongSearchView extends HookConsumerWidget {
  const SongSearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchController = useSearchController();
    var textStyle = TextStyle(
      fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
      color: Colors.grey,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SearchAnchor.bar(
        barElevation: const WidgetStatePropertyAll<double>(1.0),
        dividerColor: Colors.transparent,
        barHintText: "What are you searching for?",
        barHintStyle: WidgetStatePropertyAll(TextStyle(fontSize: 14)),
        constraints: const BoxConstraints(minHeight: 40, maxHeight: 40),
        barShape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15),
          ),
        ),
        searchController: searchController,
        suggestionsBuilder:
            (BuildContext context, SearchController controller) async {
              var text = controller.text;
              var trimmedName = text.trim();
              if (trimmedName.isEmpty) {
                return [];
              }

              var songs = await ref.watch(
                songSearchListViewModelProvider(trimmedName).future,
              );

              if (songs.isEmpty) {
                return [
                  Text(
                    "We searched high and low for your song and came up empty",
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ];
              }

              return songs.map(
                (song) => ListTile(
                  title: Text(song.title),
                  onTap: () {
                    context.pushNamed(
                      "Lyrics View",
                      pathParameters: {"song_id": song.id.toString()},
                    );
                  },
                ),
              );
            },
      ),
    );
  }
}
