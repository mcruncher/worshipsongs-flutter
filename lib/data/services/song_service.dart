
abstract interface class SongService {
  Future<List<Map<String, Object?>>> getSongs();

  Future<List<Map<String, Object?>>> getSongByIdWithLyrics(int id);

  Future<List<Map<String, Object?>>> getSongByName(String name);
}