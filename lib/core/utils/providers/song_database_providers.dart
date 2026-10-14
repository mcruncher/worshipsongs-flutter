import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:worship_songs/core/data/repositories/song_database_repository_impl.dart';
import 'package:worship_songs/core/data/services/song_database_service.dart';
import 'package:worship_songs/core/data/services/song_database_service_impl.dart';
import 'package:worship_songs/core/domain/models/song_database.dart';
import 'package:worship_songs/core/domain/repositories/song_database_repository.dart';
import 'package:worship_songs/core/ui/view_models/song_database_view_model.dart';

final songDatabaseServiceProvider = Provider<SongDatabaseService>((ref) {
  return SongDatabaseServiceImpl();
});

final songDatabaseRepositoryProvider = Provider<SongDatabaseRepository>((ref) {
  final service = ref.watch(songDatabaseServiceProvider);
  return SongDatabaseRepositoryImpl(service);
});

final songDatabaseProvider = StateNotifierProvider<SongDatabaseViewModel, AsyncValue<List<SongDatabase>>>((ref) {
  final repository = ref.watch(songDatabaseRepositoryProvider);
  return SongDatabaseViewModel(repository);
});