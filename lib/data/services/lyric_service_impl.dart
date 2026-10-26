import 'package:sqflite/sqflite.dart';
import 'package:worship_songs/data/services/lyric_service.dart';

class LyricServiceImpl implements LyricService {
  final Future<Database> _database;

  new({required this._database});

  @override
  Future<List<Map<String, Object?>>> getLyricBySongId(int songId) async =>
      (await _database).query(
        "songs",
        columns: ["lyrics", "verse_order"],
        where: "id = ?1",
        whereArgs: [songId],
      );
}
