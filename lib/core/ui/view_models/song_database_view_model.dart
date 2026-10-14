import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:worship_songs/core/domain/models/song_database.dart';
import 'package:worship_songs/core/domain/repositories/song_database_repository.dart';

class SongDatabaseViewModel extends StateNotifier<AsyncValue<List<SongDatabase>>> {
  final SongDatabaseRepository _repository;

  SongDatabaseViewModel(this._repository) : super(const AsyncValue.loading()) {
    loadData();
  }

  Future<void> loadData() async {
    state = const AsyncValue.loading();
    final result = await AsyncValue.guard(() => _repository.findAll());
    if (!mounted) return;
    state = result;
  }
}