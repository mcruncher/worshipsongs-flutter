import 'package:sqflite/sqflite.dart';
import 'package:worship_songs/data/services/lyric_service.dart';

class LyricServiceImpl implements LyricService {
  final Future<Database> _database;

  new({required this._database});

  @override
  Future<List<Map<String, Object?>>> getLyricBySongId(int songId) async =>
      (await _database).rawQuery("select s.id, s.title, s.lyrics, s.verse_order, a.display_name from songs s join authors_songs aus on s.id = aus.song_id join authors a on aus.author_id = a.id where s.id = ? ",[songId]);
}
