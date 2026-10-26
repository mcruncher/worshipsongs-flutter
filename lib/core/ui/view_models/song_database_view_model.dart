import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:worship_songs/core/domain/models/song_database_metadata.dart';
import 'package:worship_songs/core/domain/repositories/song_database_metadata_repository.dart';

class SongDatabaseViewModel extends StateNotifier<AsyncValue<List<SongDatabaseMetadata>>> {
  final SongDatabaseMetadataRepository _repository;

  SongDatabaseViewModel(this._repository) : super(const AsyncValue.loading());

  Future<void> loadData() async {
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(() => _repository.findAll());
    if (!mounted) return;
    state = result;
  }
}