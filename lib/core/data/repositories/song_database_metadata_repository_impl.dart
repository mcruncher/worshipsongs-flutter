import 'package:worship_songs/core/data/services/song_database_metadata_service.dart';
import 'package:worship_songs/core/domain/models/song_database_metadata.dart';
import 'package:worship_songs/core/domain/repositories/song_database_metadata_repository.dart';

class SongDatabaseMetadataRepositoryImpl implements SongDatabaseMetadataRepository {
  final SongDatabaseMetadataService _songDatabaseService;

  SongDatabaseMetadataRepositoryImpl(this._songDatabaseService);

  @override
  Future<List<SongDatabaseMetadata>> findAll() {
    return _songDatabaseService.getSongDatabases();
  }
}