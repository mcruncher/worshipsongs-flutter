import 'package:worship_songs/domain/models/lyrics.dart';

abstract interface class LyricsRepository
{
  Future<Lyrics> getBySongId(int songId);
}
