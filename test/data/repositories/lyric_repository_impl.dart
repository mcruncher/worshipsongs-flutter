import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:worship_songs/data/repositories/lyric_repository_impl.dart';
import 'package:worship_songs/data/services/lyric_service.dart';
import 'package:worship_songs/domain/models/lyric.dart';
import 'package:worship_songs/domain/models/verse.dart';
import 'package:worship_songs/domain/repositories/lyric_repository.dart';

import 'lyric_repository_impl.mocks.dart';

@GenerateNiceMocks([MockSpec<LyricService>()])
void main() {
  group("LyricRepositoryImplTest", () {
    late LyricService lyricService;

    setUp(() {
      lyricService = MockLyricService();
    });

    test("Find lyric by song id", () async {
      // setup
      when(lyricService.getLyricBySongId(1)).thenAnswer(
        (realInvocation) async => [
          {
            "lyrics":
                '<?xml version=\'1.0\' encoding=\'UTF-8\'?> '
                '<song version="1.0">'
                '<lyrics>'
                '<verse label="1" type="v">'
                '<![CDATA[I lay my life down at Your feet \'Cause You\'re the only one I need I turn to You and You are always there]]>'
                '</verse>'
                '<verse label="1" type="o">'
                '<![CDATA[In troubled times, it\'s You I seek I put You first, that\'s all I need I humble all I am all to You]]>'
                '</verse>'
                '<verse label="1" type="p">'
                '<![CDATA[One way, Jesus, You\'re the only one that I could live for]]>'
                '</verse>'
                '<verse label="2" type="v">'
                '<![CDATA[You are always, always there Everyhow and everywhere Your grace abounds so deeply within me]]>'
                '</verse>'
                '<verse label="2" type="o">'
                '<![CDATA[You will never, ever change Yesterday, today the same Forever \'til forever meets no end]]>'
                '</verse>'
                '<verse label="1" type="c">'
                '<![CDATA[You are the way, the truth and the life I live by faith and not by sight for You We\'re livin\' all for You]]>'
                '</verse>'
                '</lyrics>'
                '</song>',
            "verse_order": "v1 o1 p1 v2 o2 p1 c1 p1 c1",
          },
        ],
      );

      // and
      LyricRepository lyricRepository = LyricRepositoryImpl(
        lyricService: lyricService,
      );

      // when
      var lyric = await lyricRepository.getLyricBySongId(1);

      // then
      expect(
        lyric,
        Lyric(
          songId: 1,
          verses: [
            Verse(
              type: "v",
              label: "1",
              content: "I lay my life down at Your feet 'Cause You're the only one I need I turn to You and You are always there",
            ),
            Verse(
              type: "o",
              label: "1",
              content: "In troubled times, it's You I seek I put You first, that's all I need I humble all I am all to You",
            ),
            Verse(
              type: "p",
              label: "1",
              content:
                  "One way, Jesus, You're the only one that I could live for",
            ),

            Verse(
              type: "v",
              label: "2",
              content: "You are always, always there Everyhow and everywhere Your grace abounds so deeply within me",
            ),
            Verse(
              type: "o",
              label: "2",
              content: "You will never, ever change Yesterday, today the same Forever 'til forever meets no end",
            ),
            Verse(
              type: "c",
              label: "1",
              content: "You are the way, the truth and the life I live by faith and not by sight for You We're livin' all for You",
            ),
          ],
          ordering: ["v1", "o1", "p1", "v2", "o2", "p1", "c1", "p1", "c1"],
        ),
      );
    });
  });
}
