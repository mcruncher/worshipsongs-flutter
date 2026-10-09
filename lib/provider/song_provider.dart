import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:worship_songs/domain/song.dart';
import 'package:worship_songs/service/song_service.dart';
import 'package:worship_songs/service/song_service_impl.dart';

part 'song_provider.g.dart';

@riverpod
SongService _songService(Ref ref) => SongServiceImpl();

@riverpod
List<Song> songs(Ref ref) => _songService(ref).getSongs();
