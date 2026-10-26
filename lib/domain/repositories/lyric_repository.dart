import 'package:worship_songs/domain/models/lyric.dart';

abstract interface class LyricRepository
{
  Future<Lyric> getLyricBySongId(int songId);
}
