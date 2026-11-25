import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:worship_songs/data/repositories/song_database_metadata_repository_impl.dart';
import 'package:worship_songs/data/services/song_database_metadata_service.dart';
import 'package:worship_songs/data/services/song_database_metadata_service_impl.dart';
import 'package:worship_songs/domain/repositories/song_database_metadata_repository.dart';

final songDatabaseMetadataServiceProvider = Provider<SongDatabaseMetadataService>((ref) {
  return SongDatabaseMetadataServiceImpl();
});

final songDatabaseMetadataRepositoryProvider = Provider<SongDatabaseMetadataRepository>((ref) {
  final service = ref.watch(songDatabaseMetadataServiceProvider);
  return SongDatabaseMetadataRepositoryImpl(service);
});