import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/data/repositories/song_repository_impl.dart';
import 'package:worship_songs/data/services/song_service.dart';
import 'package:worship_songs/data/services/song_service_impl.dart';
import 'package:worship_songs/domain/repositories/song_repository.dart';
import 'package:worship_songs/utils/providers/database_provider.dart';

part 'song_provider.g.dart';

@riverpod
SongService _songService(Ref ref, String key) =>
    SongServiceImpl(database: ref.watch(databaseProvider(key).future));

@riverpod
SongRepository songRepository(Ref ref, String key) =>
    SongRepositoryImpl(viewSongService: ref.watch(_songServiceProvider(key)));
