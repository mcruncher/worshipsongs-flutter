import 'package:worship_songs/domain/song.dart';
import 'package:worship_songs/data/repository/song_repository.dart';
import 'package:worship_songs/data/service/song_service.dart';

class SongRepositoryImpl extends SongRepository {
  final SongService _viewSongService;

  new({required this._viewSongService});

  @override
  Future<List<Song>> getSongs() async {
    List<Song> viewSongs = [];

    for (var element in await _viewSongService.getSongs()) {
      viewSongs.add(
        Song(
          id: int.parse(element["id"].toString()),
          title: element["title"].toString(),
        ),
      );
    }
    return viewSongs;
  }
}
