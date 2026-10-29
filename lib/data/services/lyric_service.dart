abstract interface class LyricService {
  Future<List<Map<String, Object?>>> getLyricBySongId(int songId);
}