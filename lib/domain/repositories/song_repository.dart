import 'package:worship_songs/domain/models/song.dart';

abstract interface class SongRepository {
  Future<List<Song>> findAll();

  Future<Song> findByIdWithLyrics(int id);
}