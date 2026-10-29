import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:worship_songs/data/repositories/lyric_repository_impl.dart';
import 'package:worship_songs/data/services/lyric_service.dart';
import 'package:worship_songs/domain/models/lyric.dart';
import 'package:worship_songs/domain/repositories/lyric_repository.dart';

import 'lyric_repository_impl_test.mocks.dart';

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
            "title": "One way Jesus",
            "display_name": "Hillsong Worship",
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
          songName: 'One way Jesus',
          artistName: 'Hillsong Worship',
          verseOrdering: {
            "v1": "I lay my life down at Your feet 'Cause You're the only one I need I turn to You and You are always there",
            "o1": "In troubled times, it's You I seek I put You first, that's all I need I humble all I am all to You",
            "p1": "One way, Jesus, You're the only one that I could live for",
            "v2": "You are always, always there Everyhow and everywhere Your grace abounds so deeply within me",
            "o2": "You will never, ever change Yesterday, today the same Forever 'til forever meets no end",
            "c1": "You are the way, the truth and the life I live by faith and not by sight for You We're livin' all for You",
          },
          ordering: ["v1", "o1", "p1", "v2", "o2", "p1", "c1", "p1", "c1"],
        ),
      );
    });

    test("Find lyric by song id - verse oder doesn't exist", () async {
      // setup
      when(lyricService.getLyricBySongId(1)).thenAnswer(
        (realInvocation) async => [
          {
            "title": "(Let Us Be)One Voice",
            "display_name": "Robert Gay",
            "lyrics":
            '<?xml version=\'1.0\' encoding=\'UTF-8\'?> '
                '<song version="1.0">'
                '<lyrics>'
                '<verse label="1" type="v">'
                '<![CDATA['
                'Father we ask of You this day Come and heal our land Knit our '
                'hearts together That Your glory may be seen in us Then the '
                'world will know That Jesus Christ is Lord]]>'
                '</verse>'
                '<verse label="1" type="c">'
                '<![CDATA[Let us be One Voice, that glorifies Your name Let us '
                'be One Voice, declaring that You reign Let us be One Voice, '
                'in love and harmony And we pray O God, grant us unity]]>'
                '</verse>'
                '<verse label="2" type="v">'
                '<![CDATA[Now is the time for you and I To join our hearts in '
                'prayer That the name of Jesus Will be lifted high above the '
                'earth Then the world will know That Jesus Christ is Lord]]>'
                '</verse>'
                '</lyrics>'
                '</song>',
            "verse_order": "",
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
          songName: "(Let Us Be)One Voice",
          artistName: "Robert Gay",
          verseOrdering: {
            "v1": "Father we ask of You this day Come and heal our land Knit our hearts together That Your glory may be seen in us Then the world will know That Jesus Christ is Lord",
            "c1": "Let us be One Voice, that glorifies Your name Let us be One Voice, declaring that You reign Let us be One Voice, in love and harmony And we pray O God, grant us unity",
            "v2": "Now is the time for you and I To join our hearts in prayer That the name of Jesus Will be lifted high above the earth Then the world will know That Jesus Christ is Lord",
          },
          ordering: [],
        ),
      );
    });
  });
}
