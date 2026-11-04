import 'package:xml/xml.dart';

class LyricsParser {
  const LyricsParser._();

  static Map<String, String> getVerses(Map<String, Object?> rawLyric) {
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

  static List<String> getOrdering(Map<String, Object?> rawLyric) {
    var verseOrder = rawLyric["verse_order"] as String;

    return verseOrder.isNotEmpty ? verseOrder.split(" ") : [];
  }
}
