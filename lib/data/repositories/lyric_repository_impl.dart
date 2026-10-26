import 'package:worship_songs/data/services/lyric_service.dart';
import 'package:worship_songs/domain/models/lyric.dart';
import 'package:worship_songs/domain/repositories/lyric_repository.dart';

class LyricRepositoryImpl implements LyricRepository {
  final LyricService _lyricService;

  new({required this._lyricService});

  @override
  Future<Lyric> getLyricBySongId(int songId) async {
    var rawLyric = await _lyricService.getLyricBySongId(songId);

    return Lyric(songId: songId, verses: [], ordering: []);
  }
}
