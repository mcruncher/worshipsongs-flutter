import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/models/song_database_metadata.dart';
import 'package:worship_songs/utils/providers/song_database_providers.dart';

part 'song_database_view_model.g.dart';

@riverpod
class SongDatabaseViewModel extends _$SongDatabaseViewModel {
  @override
  FutureOr<List<SongDatabaseMetadata>> build() =>
      ref.watch(songDatabaseMetadataRepositoryProvider).findAll();
}