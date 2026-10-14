import 'package:worship_songs/domain/song.dart';

abstract class SongService {
  List<Song> getSongs();
}