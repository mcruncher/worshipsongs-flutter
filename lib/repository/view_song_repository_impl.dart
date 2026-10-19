import 'package:worship_songs/domain/view_song.dart';
import 'package:worship_songs/repository/view_song_repository.dart';
import 'package:worship_songs/service/view_song_service.dart';

class ViewSongRepositoryImpl extends ViewSongRepository {
  final ViewSongService _viewSongService;

  new({required this._viewSongService});

  @override
  Future<List<ViewSong>> getViewSongs() async {
    List<ViewSong> viewSongs = [];

    for (var element in await _viewSongService.getSongs()) {
      viewSongs.add(
        ViewSong(
          id: int.parse(element["id"].toString()),
          title: element["title"].toString(),
          artistName: element["display_name"].toString(),
        ),
      );
    }
    return viewSongs;
  }
}
