import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/ui/view_models/selected_song_database_view_model.dart';
import 'package:worship_songs/utils/providers/song_provider.dart';

part 'lyrics_view_view_model.g.dart';

@riverpod
class LyricsViewViewModel extends _$LyricsViewViewModel {
  @override
  FutureOr<Song> build(int songId) async {
    final key = await ref.watch(selectedSongDatabaseViewModelProvider.future);
    return ref.watch(songRepositoryProvider(key!)).findByIdWithLyrics(songId);
  }
}
