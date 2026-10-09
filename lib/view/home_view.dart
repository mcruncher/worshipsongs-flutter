import 'package:flutter/material.dart';
import 'package:worship_songs/domain/song.dart';
import 'package:worship_songs/service/song_service.dart';
import 'package:worship_songs/service/song_service_impl.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final SongService _songService = SongServiceImpl();

  @override
  Widget build(BuildContext context) {
    List<Song> songs = _songService.getSongs();

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
