import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:worship_songs/data/services/song_service.dart';
import 'package:worship_songs/data/services/song_service_impl.dart';

import 'song_service_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Database>()])
void main() {
  group("SongServiceImplTest", () {
    late SongService songService;

    late Database database;

    setUpAll(() {
      database = MockDatabase();
      songService = SongServiceImpl(database: Future.value(database));
    });

    test("Get songs", () async {
      // setup
      when(
        database.query(
          "songs",
          columns: captureAnyNamed("columns"),
          orderBy: captureAnyNamed("orderBy"),
        ),
      ).thenAnswer(
        (_) async => [
          {"id": 1, "title": "A Sinner Saved By Grace"},
          {"id": 2, "title": "(Let Us Be)One Voice"},
          {"id": 3, "title": "A Wonderful Savior is Jesus my Lord"},
          {"id": 4, "title": "Alice alice my Jesus is alive"},
        ],
      );

      // when
      var songs = await songService.getSongs();

      // then
      expect(songs, [
        {"id": 1, "title": "A Sinner Saved By Grace"},
        {"id": 2, "title": "(Let Us Be)One Voice"},
        {"id": 3, "title": "A Wonderful Savior is Jesus my Lord"},
        {"id": 4, "title": "Alice alice my Jesus is alive"},
      ]);
    });

    test("Get song by id with lyrics", () async {
      // setup
      when(
        database.query(
          'songs',
          where: captureAnyNamed("where"),
          whereArgs: captureAnyNamed("whereArgs"),
        ),
      ).thenAnswer(
        (_) async => [
          {
            "id": 1,
            "title": "A Sinner Saved By Grace",
            "lyrics": "Some lyrics",
          },
        ],
      );

      // when
      var songs = await songService.getSongByIdWithLyrics(1);

      // then
      expect(songs, [
        {"id": 1, "title": "A Sinner Saved By Grace", "lyrics": "Some lyrics"},
      ]);
    });

    test("Get song by name", () async {
      // setup
      when(
        database.query(
          'songs',
          columns: captureAnyNamed("columns"),
          where: captureAnyNamed("where"),
        ),
      ).thenAnswer(
        (_) async => [
          {"id": 1, "title": "A Sinner Saved By Grace"},
        ],
      );

      // when
      var songs = await songService.getSongByName("grace");

      // then
      expect(songs, [
        {"id": 1, "title": "A Sinner Saved By Grace"},
      ]);
    });
  });
}
