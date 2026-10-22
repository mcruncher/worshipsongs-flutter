import 'package:worship_songs/domain/song.dart';

abstract interface class SongRepository {
  Future<List<Song>> getSongs();
}