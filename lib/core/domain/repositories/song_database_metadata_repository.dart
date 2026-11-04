import 'package:worship_songs/core/domain/models/song_database_metadata.dart';

abstract interface class SongDatabaseMetadataRepository {
  Future<List<SongDatabaseMetadata>> findAll();
}