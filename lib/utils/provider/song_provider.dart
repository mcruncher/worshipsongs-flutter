import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/song.dart';
import 'package:worship_songs/utils/provider/database_provider.dart';
import 'package:worship_songs/domain/repositories/song_repository.dart';
import 'package:worship_songs/data/repository/song_repository_impl.dart';
import 'package:worship_songs/data/service/song_service.dart';
import 'package:worship_songs/data/service/song_service_impl.dart';

part 'song_provider.g.dart';

@riverpod
SongService _songService(Ref ref) =>
    SongServiceImpl(database: ref.watch(databaseProvider.future));

@riverpod
SongRepository _songRepository(Ref ref) =>
    SongRepositoryImpl(viewSongService: ref.watch(_songServiceProvider));

@riverpod
Future<List<Song>> songs(Ref ref) =>
    ref.watch(_songRepositoryProvider).getSongs();
