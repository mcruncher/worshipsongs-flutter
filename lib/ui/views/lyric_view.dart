import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:worship_songs/ui/view_models/lyric_view_view_model.dart';

class LyricView extends ConsumerWidget {
  const LyricView({super.key, required this._songId});

  final int _songId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lyricView = ref.watch(lyricViewViewModelProvider(_songId));

    return Scaffold(
      appBar: AppBar(leading: BackButton()),
      body: lyricView.when(
        data: (data) {
          var verses = data.verses;
          return ListView.builder(
            itemCount: verses.length,
            itemBuilder: (context, index) =>
                Card(child: Text(verses[index].content)),
          );
        },
        error: (error, stackTrace) {
          return null;
        },
        loading: () {
          return Skeletonizer(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Card(child: Text("Hello")),
            ),
          );
        },
      ),
    );
  }
}
