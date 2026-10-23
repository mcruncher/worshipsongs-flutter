import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:worship_songs/data/repositories/song_repository_impl.dart';
import 'package:worship_songs/data/services/song_service.dart';
import 'package:worship_songs/domain/models/song.dart';

import 'song_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SongService>()])
void main() {
  group("SongRepositoryImplTest", () {
    late MockSongService songService;

    setUp(() {
      songService = MockSongService();
    });

    test("findAll", () async {
      // setup
      when(songService.getSongs()).thenAnswer(
        (realInvocation) async => [
          {"id": 1, "title": "Test song"},
          {"id": 2, "title": "foo song"},
          {"id": 3, "title": "bar song"},
          {"id": 4, "title": "baz song"},
        ],
      );

      var songRepositoryImpl = SongRepositoryImpl(viewSongService: songService);

      // when
      var songs = await songRepositoryImpl.findAll();

      // then
      expectLater(songs, [
        Song(id: 1, title: "Test song"),
        Song(id: 2, title: "foo song"),
        Song(id: 3, title: "bar song"),
        Song(id: 4, title: "baz song"),
      ]);
    });
  });
}
