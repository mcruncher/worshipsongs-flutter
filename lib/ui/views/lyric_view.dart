import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worship_songs/ui/components/custom_card.dart';
import 'package:worship_songs/ui/view_models/lyric_view_view_model.dart';

class LyricView extends ConsumerWidget {
  LyricView({super.key, required this._songId});

  final int _songId;
  late ThemeData _themeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _themeData = Theme.of(context);
    var lyricView = ref.watch(lyricViewViewModelProvider(_songId));

    return Scaffold(
      appBar: AppBar(leading: BackButton()),
      body: lyricView.when(
        data: (data) {
          var ordering = data.ordering;
          var verseOrdering = data.verseOrdering;

          ListView buildListView;

          if (ordering.isEmpty) {
            buildListView = _buildLyricView(
              verseOrdering.length + 1,
              data.songName,
              data.artistName,
              (index) => verseOrdering.entries.elementAt(index - 1),
            );
          } else {
            buildListView = _buildLyricView(
              ordering.length + 1,
              data.songName,
              data.artistName,
              (index) {
                var key = ordering[index - 1];
                return MapEntry(key, verseOrdering[key]!);
              },
            );
          }

          return buildListView;
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Scaffold(),
      ),
    );
  }

  ListView _buildLyricView(
    int itemCount,
    String songName,
    String artistName,
    MapEntry<String, String> Function(int index) mapEntryFunction,
  ) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            padding: EdgeInsets.only(left: 12, bottom: 10),
            alignment: AlignmentGeometry.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSongName(songName),
                _buildArtistName(artistName),
              ],
            ),
          );
        } else {
          var mapEntry = mapEntryFunction.call(index);
          return _buildLyricContainer(mapEntry.key, mapEntry.value);
        }
      },
    );
  }

  Text _buildSongName(String songName) =>
      Text(songName, style: _themeData.textTheme.titleMedium);

  Text _buildArtistName(String artistName) =>
      Text(artistName, style: TextStyle(color: Colors.grey));

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
