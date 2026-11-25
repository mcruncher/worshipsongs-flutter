import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/utils/providers/song_provider.dart';

part 'song_list_view_model.g.dart';

@riverpod
class SongListViewModel extends _$SongListViewModel {
  @override
  FutureOr<List<Song>> build(String key) async =>
      ref.watch(songRepositoryProvider(key)).findAll();
}
