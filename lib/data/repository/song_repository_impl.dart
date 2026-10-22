import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/domain/repositories/song_repository.dart';
import 'package:worship_songs/data/service/song_service.dart';

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
}
