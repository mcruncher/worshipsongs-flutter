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

          ListView buildListView;

          if (ordering.isEmpty) {
            buildListView = _buildListView(
              verseOrdering.length + 1,
              (index) => verseOrdering.entries.elementAt(index - 1),
            );
          } else {
            buildListView = _buildListView(ordering.length + 1, (index) {
              var key = ordering[index - 1];
              return MapEntry(key, verseOrdering[key]!);
            });
          }

          return buildListView;
        },
        error: (error, stackTrace) {
          return null;
        },
        loading: () => Skeletonizer(
          child: _buildListView(10, (_) => MapEntry("Verse 1", "Some" * 20)),
        ),
      ),
    );
  }

  ListView _buildListView(
    int itemCount,
    MapEntry<String, String> Function(int index) function,
  ) => ListView.builder(
    itemCount: itemCount,
    itemBuilder: (context, index) =>
        _buildLyricView(index, function.call(index)),
  );

  Widget _buildLyricView(int index, MapEntry<String, String> mapEntry) =>
      index == 0
      ? _buildTitle()
      : _buildLyricContainer(mapEntry.key, mapEntry.value);

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
          padding: const EdgeInsets.only(left: 15, top: 6, bottom: 0),
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
