import 'package:worship_songs/domain/models/lyrics.dart';
import 'package:xml/xml.dart';

class LyricsParser {
  const LyricsParser._();

  static Lyrics parseLyrics(int songId, Map<String, Object?> rawLyrics) {
    String songTitle = _getSongTitle(rawLyrics);
    String artistName = _getArtistName(rawLyrics);
    Map<String, String> verseOrdering = _getVerses(rawLyrics);
    List<String> ordering = _getOrdering(rawLyrics);

    return Lyrics(
      songId: songId,
      title: songTitle,
      artistName: artistName,
      verses: verseOrdering,
      verseOrdering: ordering,
    );
  }

  static String _getSongTitle(Map<String, Object?> rawLyric) =>
      rawLyric["title"] as String;

  static String _getArtistName(Map<String, Object?> rawLyric) =>
      rawLyric["display_name"] as String;

  static Map<String, String> _getVerses(Map<String, Object?> rawLyric) {
    var xmlDocument = XmlDocument.parse(rawLyric["lyrics"] as String);
    var songTag = xmlDocument.findElements("song").first;
    var lyricsTag = songTag.findElements("lyrics").first;

    var verseTags = lyricsTag.findAllElements("verse");
    Map<String, String> verses = {};
    for (var verseTag in verseTags) {
      var verseMapping = _getVerseMapping(verseTag);
      verses[verseMapping] = verseTag.innerText.trim();
    }

    return verses;
  }

  static String _getVerseMapping(XmlElement verseTag) {
    String verseType = _getElementAttributeValue(verseTag, "type");
    String verseLabel = _getElementAttributeValue(verseTag, "label");

    return "$verseType$verseLabel";
  }

  static String _getElementAttributeValue(XmlElement xmlElement, String key) =>
      xmlElement.elementAttributes
          .firstWhere((element) => element.name.toString() == key)
          .value;

  static List<String> _getOrdering(Map<String, Object?> rawLyric) {
    var verseOrder = rawLyric["verse_order"] as String;

    return verseOrder.isNotEmpty ? verseOrder.split(" ") : [];
  }
}
