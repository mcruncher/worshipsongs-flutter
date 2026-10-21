import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/song.dart';
import 'package:worship_songs/provider/database_provider.dart';
import 'package:worship_songs/repository/song_repository.dart';
import 'package:worship_songs/repository/song_repository_impl.dart';
import 'package:worship_songs/service/song_service.dart';
import 'package:worship_songs/service/song_service_impl.dart';

part 'song_provider.g.dart';

@riverpod
SongService _songsService(Ref ref) =>
    SongServiceImpl(database: ref.watch(databaseProvider.future));

@riverpod
SongRepository _songRepository(Ref ref) => SongRepositoryImpl(
  viewSongService: ref.watch(_songsServiceProvider),
);

@riverpod
Future<List<Song>> songs(Ref ref) =>
    ref.watch(_songRepositoryProvider).getViewSongs();
