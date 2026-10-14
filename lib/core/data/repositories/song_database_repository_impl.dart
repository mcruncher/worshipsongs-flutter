import 'package:worship_songs/core/data/services/song_database_service.dart';
import 'package:worship_songs/core/domain/models/song_database.dart';
import 'package:worship_songs/core/domain/repositories/song_database_repository.dart';

class SongDatabaseRepositoryImpl implements SongDatabaseRepository {
  final SongDatabaseService _songDatabaseService;

  SongDatabaseRepositoryImpl(this._songDatabaseService);

  @override
  Future<List<SongDatabase>> findAll() {
    return _songDatabaseService.getSongDatabases();
  }
}