import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/models/song.dart';
import 'package:worship_songs/utils/providers/song_provider.dart';

part 'song_search_list_view_model.g.dart';

@riverpod
class SongSearchListViewModel extends _$SongSearchListViewModel {
  @override
  FutureOr<List<Song>> build(String name) async =>
      ref.watch(songRepositoryProvider).findByName(name);
}
