import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:worship_songs/core/data/repositories/song_database_metadata_repository_impl.dart';
import 'package:worship_songs/core/data/services/song_database_metadata_service.dart';
import 'package:worship_songs/core/data/services/song_database_metadata_service_impl.dart';
import 'package:worship_songs/core/domain/models/song_database_metadata.dart';
import 'package:worship_songs/core/domain/repositories/song_database_metadata_repository.dart';
import 'package:worship_songs/core/ui/view_models/selected_song_database_view_model.dart';
import 'package:worship_songs/core/ui/view_models/song_database_view_model.dart';

final songDatabaseMetadataServiceProvider = Provider<SongDatabaseMetadataService>((ref) {
  return SongDatabaseMetadataServiceImpl();
});

final songDatabaseMetadataRepositoryProvider = Provider<SongDatabaseMetadataRepository>((ref) {
  final service = ref.watch(songDatabaseMetadataServiceProvider);
  return SongDatabaseMetadataRepositoryImpl(service);
});

final songDatabaseViewModelProvider = StateNotifierProvider<SongDatabaseViewModel, AsyncValue<List<SongDatabaseMetadata>>>((ref) {
  final repository = ref.watch(songDatabaseMetadataRepositoryProvider);
  return SongDatabaseViewModel(repository)..loadData();
});

final selectedSongDatabaseViewModelProvider = StateNotifierProvider<SelectedSongDatabaseViewModel, AsyncValue<String?>>((ref) {
  return SelectedSongDatabaseViewModel()..loadData();
});