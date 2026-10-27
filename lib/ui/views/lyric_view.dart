import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:worship_songs/ui/components/custom_card.dart';
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
          var ordering = data.ordering;
          var verseOrdering = data.verseOrdering;

          if (ordering.isEmpty) {
            return ListView.builder(
              itemCount: verseOrdering.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildTitle();
                } else {
                  var map = verseOrdering.entries.elementAt(index - 1);

                  return _buildLyricContainer(map.key, map.value);
                }
              },
            );
          }

          return ListView.builder(
            itemCount: ordering.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildTitle();
              } else {
                var key = ordering[index - 1];

                return _buildLyricContainer(key, verseOrdering[key]!);
              }
            },
          );
        },
        error: (error, stackTrace) {
          return null;
        },
        loading: () {
          return Skeletonizer(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildTitle();
                } else {
                  return _buildLyricContainer("Verse 1", "Some random content" * 20);
                }
              }
            ),
          );
        },
      ),
    );
  }

  Container _buildTitle() => Container(
    alignment: AlignmentGeometry.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 18),
      child: const Text("Songs"),
    ),
  );

  Column _buildLyricContainer(String section, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 6,
            bottom: 0,
          ),
          child: Text(section),
        ),
        _buildLyricCard(content),
      ],
    );
  }

  Padding _buildLyricCard(String value) => Padding(
    padding: const EdgeInsets.only(right: 6, left: 6, bottom: 8),
    child: CustomCard(
      child: Padding(padding: const EdgeInsets.all(10), child: Text(value)),
    ),
  );
}
