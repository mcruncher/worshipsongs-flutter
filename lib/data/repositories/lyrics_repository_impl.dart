import 'package:worship_songs/data/services/lyrics_service.dart';
import 'package:worship_songs/domain/models/lyrics.dart';
import 'package:worship_songs/domain/repositories/lyrics_repository.dart';
import 'package:xml/xml.dart';

class LyricsRepositoryImpl implements LyricsRepository {
  final LyricsService _lyricsService;

  new({required this._lyricsService});

  @override
  Future<Lyrics> getLyricsBySongId(int songId) async {
    var rawLyric = (await _lyricsService.getLyricBySongId(songId))[0];

    String songName = _getSongName(rawLyric);
    Map<String, String> verseOrdering = _getVerses(rawLyric);
    List<String> ordering = _getOrdering(rawLyric);

    var lyric = Lyrics(
      songId: songId,
      title: songName,
      artistName: _getArtistName(rawLyric),
      verses: verseOrdering,
      verseOrdering: ordering,
    );
    return lyric;
  }

  String _getSongName(Map<String, Object?> rawLyric) =>
      rawLyric["title"] as String;

  String _getArtistName(Map<String, Object?> rawLyric) =>
      rawLyric["display_name"] as String;

  Map<String, String> _getVerses(Map<String, Object?> rawLyric) {
    var xmlDocument = XmlDocument.parse(rawLyric["lyrics"] as String);
    var songTag = xmlDocument.findElements("song").first;
    var lyricsTag = songTag.findElements("lyrics").first;

    var verseTags = lyricsTag.findAllElements("verse");
    return {
      for (var verseTag in verseTags)
        _getMapKey(verseTag): verseTag.innerText.trim(),
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
