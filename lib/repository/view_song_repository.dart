import 'package:worship_songs/domain/view_song.dart';

abstract class ViewSongRepository {
  Future<List<ViewSong>> getViewSongs();

  Future<int> getTotalSongs();
}