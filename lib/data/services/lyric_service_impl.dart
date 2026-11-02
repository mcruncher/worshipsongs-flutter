import 'package:sqflite/sqflite.dart';
import 'package:worship_songs/data/services/lyric_service.dart';

class LyricServiceImpl implements LyricService {
  final Future<Database> _database;

  new({required this._database});

  @override
  Future<List<Map<String, Object?>>> getLyricBySongId(int songId) async =>
      (await _database).rawQuery(
        "SELECT s.id, s.title, s.lyrics, s.verse_order, a.display_name "
        "FROM songs s "
        "LEFT JOIN authors_songs aus "
        "ON s.id = aus.song_id "
        "LEFT JOIN authors a "
        "ON aus.author_id = a.id "
        "WHERE s.id = ? ",
        [songId],
      );
}
