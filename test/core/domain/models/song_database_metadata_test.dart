import 'package:flutter_test/flutter_test.dart';
import 'package:worship_songs/core/domain/models/song_database_metadata.dart';

void main() {
  group('SongDatabaseMetadataTest', () {
    test('Should map all fields from json', () {
      // given
      final json = {
        'key': 'tamil_worship_songs',
        'name': 'Tamil Worship Songs',
        'description': 'Tamil songs',
        'url': 'https://github.com/mcruncher/worshipsongs-db',
        'language': 'Tamil',
        'openLpVersion': '2.4',
      };

      // when
      final metadata = SongDatabaseMetadata.fromJson(json);

      // then
      expect(metadata.key, 'tamil_worship_songs');
      expect(metadata.name, 'Tamil Worship Songs');
      expect(metadata.description, 'Tamil songs');
      expect(metadata.url, 'https://github.com/mcruncher/worshipsongs-db');
      expect(metadata.language, 'Tamil');
      expect(metadata.openLpVersion, '2.4');
    });
  });
}