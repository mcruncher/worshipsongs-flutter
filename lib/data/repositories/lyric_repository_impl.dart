import 'package:worship_songs/data/services/lyric_service.dart';
import 'package:worship_songs/domain/models/lyric.dart';
import 'package:worship_songs/domain/models/verse.dart';
import 'package:worship_songs/domain/repositories/lyric_repository.dart';
import 'package:xml/xml.dart';

class LyricRepositoryImpl implements LyricRepository {
  final LyricService _lyricService;

  new({required this._lyricService});

  @override
  Future<Lyric> getLyricBySongId(int songId) async {
    var rawLyric = (await _lyricService.getLyricBySongId(songId))[0];

    List<Verse> verses = _getVerses(rawLyric);
    List<String> ordering = _getOrdering(rawLyric);

    return Lyric(songId: songId, verses: verses, ordering: ordering);
  }

  List<Verse> _getVerses(Map<String, Object?> rawLyric) {
    var xmlDocument = XmlDocument.parse(rawLyric["lyrics"] as String);
    var songTag = xmlDocument.findElements("song").first;
    var lyricsTag = songTag.findElements("lyrics").first;

    return lyricsTag.findAllElements("verse").map((tag) {
      String typeValue = _getElementAttributeValue(tag, "type");
      String labelValue = _getElementAttributeValue(tag, "label");
      String content = tag.innerText;

      return Verse(type: typeValue, label: labelValue, content: content);
    }).toList();
  }

  String _getElementAttributeValue(XmlElement xmlElement, String key) =>
      xmlElement.elementAttributes
          .firstWhere((element) => element.name.toString() == key)
          .value;

  List<String> _getOrdering(Map<String, Object?> rawLyric) =>
      ((rawLyric["verse_order"] as String)).split(" ");
}
