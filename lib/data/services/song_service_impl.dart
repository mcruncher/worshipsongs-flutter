import 'package:sqflite/sqflite.dart';
import 'package:worship_songs/data/services/song_service.dart';

class SongServiceImpl implements SongService {
  static const String _tableName = "songs";

  final Future<Database> _database;

  new({required this._database});

  @override
  Future<List<Map<String, Object?>>> getSongs() async => (await _database)
      .query(_tableName, columns: ["id", "title"], orderBy: "title");

  @override
  Future<List<Map<String, Object?>>> getSongByIdWithLyrics(int id) async =>
      (await _database).query(_tableName, where: "id = ?", whereArgs: [id]);

  @override
  Future<List<Map<String, Object?>>> getSongByName(String name) async =>
      (await _database).query(
        _tableName,
        columns: ["id", "title"],
        where: "title like '%$name%'",
      );
}
