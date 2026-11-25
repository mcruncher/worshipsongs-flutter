import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/utils/providers/song_provider.dart';

part 'lyrics_view_view_model.g.dart';

@riverpod
class LyricsViewViewModel extends _$LyricsViewViewModel {
  @override
  FutureOr<Song> build(int songId) =>
      ref.watch(songRepositoryProvider).findByIdWithLyrics(songId);
}
