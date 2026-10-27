import 'package:worship_songs/data/services/lyric_service.dart';
import 'package:worship_songs/domain/models/lyric.dart';
import 'package:worship_songs/domain/repositories/lyric_repository.dart';
import 'package:xml/xml.dart';

class LyricRepositoryImpl implements LyricRepository {
  final LyricService _lyricService;

  new({required this._lyricService});

  @override
  Future<Lyric> getLyricBySongId(int songId) async {
    var rawLyric = (await _lyricService.getLyricBySongId(songId))[0];

    Map<String, String> verseOrdering = _getVerses(rawLyric);
    List<String> ordering = _getOrdering(rawLyric);

    var lyric = Lyric(
      songId: songId,
      verseOrdering: verseOrdering,
      ordering: ordering,
    );
    return lyric;
  }

  Map<String, String> _getVerses(Map<String, Object?> rawLyric) {
    var xmlDocument = XmlDocument.parse(rawLyric["lyrics"] as String);
    var songTag = xmlDocument.findElements("song").first;
    var lyricsTag = songTag.findElements("lyrics").first;

    var verseTags = lyricsTag.findAllElements("verse");
    return {
      for (var verseTag in verseTags) _getMapKey(verseTag): verseTag.innerText.trim(),
    };
  }

  String _getMapKey(XmlElement verseTag) =>
      '${_getElementAttributeValue(verseTag, "type")}${_getElementAttributeValue(verseTag, "label")}';

  String _getElementAttributeValue(XmlElement xmlElement, String key) =>
      xmlElement.elementAttributes
          .firstWhere((element) => element.name.toString() == key)
          .value;

  List<String> _getOrdering(Map<String, Object?> rawLyric) {
    var verseOrder = rawLyric["verse_order"] as String;
    return verseOrder.isNotEmpty ? verseOrder.split(" ") : [];
  }
}
