import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/models/lyric.dart';
import 'package:worship_songs/utils/providers/lyric_provider.dart';

part 'lyric_view_view_model.g.dart';

@riverpod
class LyricViewViewModel extends _$LyricViewViewModel {
  @override
  FutureOr<Lyric> build(int songId) =>
      ref.watch(lyricRepositoryProvider).getLyricBySongId(songId);
}
