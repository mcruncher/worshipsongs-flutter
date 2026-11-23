import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worship_songs/ui/view_models/song_search_list_view_model.dart';
import 'package:worship_songs/ui/views/song_list_view.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var searchController = useSearchController();

    return Scaffold(
      appBar: AppBar(
        title: SearchAnchor.bar(
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
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(top: 20),
        child: const SongListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: searchController.openView,
        backgroundColor: Colors.grey.shade600,
        foregroundColor: Colors.black,
        child: Icon(Icons.search_rounded),
      ),
    );
  }
}
