import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/models/lyrics.dart';
import 'package:worship_songs/utils/providers/lyrics_provider.dart';

part 'lyrics_view_view_model.g.dart';

@riverpod
class LyricsViewViewModel extends _$LyricsViewViewModel {
  @override
  FutureOr<Lyrics> build(int songId) =>
      ref.watch(lyricsRepositoryProvider).getBySongId(songId);
}
