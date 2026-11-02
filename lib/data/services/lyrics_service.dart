abstract interface class LyricsService {
  Future<List<Map<String, Object?>>> getLyricBySongId(int songId);
}