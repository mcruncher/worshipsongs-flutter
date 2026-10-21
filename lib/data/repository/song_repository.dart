import 'package:worship_songs/domain/song.dart';

abstract class SongRepository {
  Future<List<Song>> getSongs();
}