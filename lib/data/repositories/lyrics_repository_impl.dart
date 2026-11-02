import 'package:worship_songs/data/parser/lyrics_parser.dart';
import 'package:worship_songs/data/services/lyrics_service.dart';
import 'package:worship_songs/domain/models/lyrics.dart';
import 'package:worship_songs/domain/repositories/lyrics_repository.dart';

class LyricsRepositoryImpl implements LyricsRepository {
  final LyricsService _lyricsService;

  new({required this._lyricsService});

  @override
  Future<Lyrics> getBySongId(int songId) async {
    var rawLyrics = (await _lyricsService.getLyricBySongId(songId))[0];
    return LyricsParser.parseLyrics(songId, rawLyrics);
  }
}
