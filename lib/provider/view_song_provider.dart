import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/view_song.dart';
import 'package:worship_songs/provider/database_provider.dart';
import 'package:worship_songs/repository/view_song_repository.dart';
import 'package:worship_songs/repository/view_song_repository_impl.dart';
import 'package:worship_songs/service/view_song_service.dart';
import 'package:worship_songs/service/view_song_service_impl.dart';

part 'view_song_provider.g.dart';

@riverpod
ViewSongService _viewSongsService(Ref ref) =>
    ViewSongServiceImpl(database: ref.watch(databaseProvider.future));

@riverpod
ViewSongRepository _viewSongRepository(Ref ref) => ViewSongRepositoryImpl(
  viewSongService: ref.watch(_viewSongsServiceProvider),
);

@riverpod
Future<List<ViewSong>> viewSongs(Ref ref) =>
    ref.watch(_viewSongRepositoryProvider).getViewSongs();

@riverpod
Future<int> totalSongs(Ref ref) =>
    ref.watch(_viewSongRepositoryProvider).getTotalSongs();
