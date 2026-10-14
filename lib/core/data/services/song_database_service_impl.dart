import 'package:worship_songs/core/data/services/song_database_service.dart';
import 'package:worship_songs/core/domain/models/song_database.dart';

class SongDatabaseServiceImpl implements SongDatabaseService {
  // TODO: replace the mock data with a fetch of the JSON metadata file from GitHub.
  @override
  Future<List<SongDatabase>> getSongDatabases() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      SongDatabase(
        name: 'Tamil Worship Songs',
        description: 'Tamil Christian worship songs with lyrics, ready to import into OpenLP.',
        githubUrl: 'https://github.com/mcruncher/worshipsongs-db',
        language: 'Tamil',
        openLpVersion: '2.4',
      ),
      SongDatabase(
        name: 'English Worship Songs',
        description: 'A collection of English worship songs and hymns.',
        githubUrl: 'https://github.com/mcruncher/worshipsongs-db-english',
        language: 'English',
        openLpVersion: '2.4',
      ),
      SongDatabase(
        name: 'Malay Worship Songs',
        description: 'Lagu pujian dan penyembahan dalam Bahasa Melayu.',
        githubUrl: 'https://github.com/mcruncher/worshipsongs-db-malay',
        language: 'Malay',
        openLpVersion: '3.0',
      ),
    ];
  }
}