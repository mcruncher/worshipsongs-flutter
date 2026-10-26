import 'package:worship_songs/core/domain/models/song_database_metadata.dart';

abstract interface class SongDatabaseMetadataService {
  Future<List<SongDatabaseMetadata>> getSongDatabases();
}