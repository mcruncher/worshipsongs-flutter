import 'package:worship_songs/domain/models/lyrics.dart';

abstract interface class LyricsRepository
{
  Future<Lyrics> getLyricsBySongId(int songId);
}
