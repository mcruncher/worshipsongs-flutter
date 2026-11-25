import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/ui/components/custom_card.dart';
import 'package:worship_songs/ui/view_models/song_list_view_model.dart';
import 'package:worship_songs/ui/views/song_search_view.dart';

class SongListView extends ConsumerWidget {
  const SongListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var songsViewModelProvider = ref.watch(songListViewModelProvider);

    return songsViewModelProvider.when(
      data: (data) => _listSongs(data),
      error: (error, stackTrace) => Text("error $stackTrace"),
      loading: () => _skeletonView(),
    );
  }

  Widget _listSongs(List<Song> data) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: data.length + 2,
      itemBuilder: (context, index) {
        Widget content;
        if (index == 0) {
          content = _pageTitle();
        } else if (index == 1) {
          content = SongSearchView();
        } else {
          content = _CardView(song: data.elementAt(index - 2));
        }
        return _buildContent(content);
      },
    );
  }

  Skeletonizer _skeletonView() {
    return Skeletonizer(
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => _buildContent(
          index == 0
              ? Skeleton.keep(child: _pageTitle())
              : _CardView(song: Song(id: 1, title: "Song" * 10)),
        ),
      ),
    );
  }

  Padding _pageTitle() => const Padding(
    padding: EdgeInsets.only(bottom: 10, left: 15),
    child: Text("Songs"),
  );

  Padding _buildContent(Widget widget) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: widget,
  );
}

class _CardView extends StatelessWidget {
  const new({required this._song});

  final Song _song;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 50,
      child: InkWell(
        onTap: () => context.pushNamed(
          "Lyrics View",
          pathParameters: {"song_id": _song.id.toString()},
        ),
        child: Container(
          alignment: AlignmentGeometry.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: buildCardTitle(context),
          ),
        ),
      ),
    );
  }

  Text buildCardTitle(BuildContext context) =>
      Text(_song.title, style: Theme.of(context).textTheme.labelMedium);
}
