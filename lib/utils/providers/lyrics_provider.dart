import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/data/repositories/lyrics_repository_impl.dart';
import 'package:worship_songs/data/services/lyrics_service.dart';
import 'package:worship_songs/data/services/lyrics_service_impl.dart';
import 'package:worship_songs/domain/repositories/lyrics_repository.dart';
import 'package:worship_songs/utils/providers/database_provider.dart';

part 'lyrics_provider.g.dart';

@riverpod
LyricsService _lyricsService(Ref ref) =>
    LyricsServiceImpl(database: ref.watch(databaseProvider.future));

@riverpod
LyricsRepository lyricsRepository(Ref ref) =>
    LyricsRepositoryImpl(lyricsService: ref.watch(_lyricsServiceProvider));
