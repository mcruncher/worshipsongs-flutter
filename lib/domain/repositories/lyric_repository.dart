import 'package:worship_songs/domain/models/lyrics.dart';

abstract interface class LyricRepository
{
  Future<Lyrics> getLyricBySongId(int songId);
}
