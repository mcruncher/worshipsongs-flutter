import 'package:flutter_test/flutter_test.dart';
import 'package:worship_songs/data/parser/lyrics_parser.dart';

void main() {
  group("LyricsParserTest", () {
    setUp(() {});

    test("Get verses", () {
      // when
      var verses = LyricsParser.getVerses({
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
      });

      // then
      expect(verses, {
        "v1": "I lay my life down at Your feet 'Cause You're the only one I need I turn to You and You are always there",
        "o1": "In troubled times, it's You I seek I put You first, that's all I need I humble all I am all to You",
        "p1": "One way, Jesus, You're the only one that I could live for",
        "v2": "You are always, always there Everyhow and everywhere Your grace abounds so deeply within me",
        "o2": "You will never, ever change Yesterday, today the same Forever 'til forever meets no end",
        "c1": "You are the way, the truth and the life I live by faith and not by sight for You We're livin' all for You",
      });
    });

    test("Get ordering", () {
      // when
      var ordering = LyricsParser.getOrdering({
        "verse_order": "v1 o1 p1 v2 o2 p1 c1 p1 c1",
      });

      // then
      expect(ordering, ["v1", "o1", "p1", "v2", "o2", "p1", "c1", "p1", "c1"]);
    });

    test("Get ordering - verse_ordering is empty", () {
      // when
      var ordering = LyricsParser.getOrdering({"verse_order": ""});

      // then
      expect(ordering, []);
    });
  });
}
