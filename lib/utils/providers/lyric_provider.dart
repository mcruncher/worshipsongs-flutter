import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/data/repositories/lyric_repository_impl.dart';
import 'package:worship_songs/data/services/lyric_service.dart';
import 'package:worship_songs/data/services/lyric_service_impl.dart';
import 'package:worship_songs/domain/repositories/lyric_repository.dart';
import 'package:worship_songs/utils/providers/database_provider.dart';

part 'lyric_provider.g.dart';

@riverpod
LyricService _lyricService(Ref ref) =>
    LyricServiceImpl(database: ref.watch(databaseProvider.future));

@riverpod
LyricRepository lyricRepository(Ref ref) =>
    LyricRepositoryImpl(lyricService: ref.watch(_lyricServiceProvider));
