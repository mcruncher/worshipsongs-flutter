import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worship_songs/domain/song.dart';
import 'package:worship_songs/provider/song_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Song> songs = ref.watch(songsProvider);

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: songs.length + 1,
      itemBuilder: (context, index) {
        Widget widget = index == 0
            ? Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(child: const Text("Songs")),
              )
            : _CardView(
                songTitle: songs.elementAt(index - 1).title,
                artist: songs.elementAt(index - 1).artistName,
              );

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: widget,
        );
      },
    );
  }
}

class _CardView extends StatelessWidget {
  const new({required this._songTitle, required this._artist});

  final String _songTitle;
  final String _artist;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Card.outlined(
      child: SizedBox(
        width: 500,
        height: 60,
        child: InkWell(onTap: () => {}, child: buildCardContent()),
      ),
    ),
  );

  Padding buildCardContent() => Padding(
    padding: EdgeInsetsGeometry.symmetric(vertical: 12, horizontal: 20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildCardTitle(), buildCardSubtitle()],
    ),
  );

  Text buildCardTitle() => Text(
    _songTitle,
    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  );

  Padding buildCardSubtitle() => Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      _artist,
      style: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 11,
        fontWeight: FontWeight.w200,
      ),
    ),
  );
}
