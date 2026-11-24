import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worship_songs/ui/views/song_list_view.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.goNamed("Search"),
          icon: Icon(Icons.search_rounded),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(top: 20),
        child: const SongListView(),
      ),
    );
  }
}
