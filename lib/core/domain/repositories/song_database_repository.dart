import 'package:worship_songs/core/domain/models/song_database.dart';

abstract class SongDatabaseRepository {
  Future<List<SongDatabase>> findAll();
}