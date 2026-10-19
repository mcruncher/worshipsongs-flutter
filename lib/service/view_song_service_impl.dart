import 'package:sqflite/sqflite.dart';
import 'package:worship_songs/service/view_song_service.dart';

class ViewSongServiceImpl extends ViewSongService {
  final Future<Database> _database;

  final _selectSongsQuery =
      "SELECT song.id, song.title, author.display_name "
      "FROM songs song "
      "JOIN authors_songs author_song ON song.id = author_song.song_id "
      "JOIN authors author ON author_song.author_id = author.id";

  new({required this._database});

  @override
  Future<List<Map<String, Object?>>> getSongs() async =>
      (await _database).rawQuery(_selectSongsQuery);
}
