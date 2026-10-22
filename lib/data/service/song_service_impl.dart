import 'package:sqflite/sqflite.dart';
import 'package:worship_songs/data/service/song_service.dart';

class SongServiceImpl implements SongService {
  final Future<Database> _database;

  new({required this._database});

  @override
  Future<List<Map<String, Object?>>> getSongs() async => (await _database)
      .query("songs", columns: ["id", "title"], orderBy: "title");
}
