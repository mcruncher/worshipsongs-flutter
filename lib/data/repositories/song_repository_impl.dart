import 'package:worship_songs/data/parser/lyrics_parser.dart';
import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/domain/repositories/song_repository.dart';
import 'package:worship_songs/data/services/song_service.dart';

class SongRepositoryImpl implements SongRepository {
  final SongService _viewSongService;

  new({required this._viewSongService});

  @override
  Future<List<Song>> findAll() async {
    List<Song> songs = [];

    for (var element in await _viewSongService.getSongs()) {
      songs.add(
        Song(
          id: int.parse(element["id"].toString()),
          title: element["title"].toString(),
        ),
      );
    }
    return songs;
  }

  @override
  Future<Song> findByIdWithLyrics(int id) async {
    var song = (await _viewSongService.getSongByIdWithLyrics(id)).first;
    return Song(
      id: int.parse(song["id"].toString()),
      title: song["title"].toString(),
      verses: LyricsParser.getVerses(song),
      verseOrdering: LyricsParser.getOrdering(song),
    );
  }
}
