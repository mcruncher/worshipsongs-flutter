import 'package:worship_songs/core/domain/models/song_database.dart';

abstract class SongDatabaseService {
  Future<List<SongDatabase>> getSongDatabases();
}