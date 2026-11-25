import 'package:flutter_test/flutter_test.dart';
import 'package:worship_songs/domain/models/song_database_metadata.dart';

void main() {
  group('SongDatabaseMetadataTest', () {
    test('Should map all fields from json', () {
      // given
      final json = {
        'key': 'songs_tamil',
        'name': 'Tamil Worship Songs',
        'description': 'Tamil songs',
        'url': 'https://github.com/mcruncher/worshipsongs-db-dev',
        'language': 'Tamil',
        'openLpVersion': '2.4',
      };

      // when
      final metadata = SongDatabaseMetadata.fromJson(json);

      // then
      expect(metadata.key, 'songs_tamil');
      expect(metadata.name, 'Tamil Worship Songs');
      expect(metadata.description, 'Tamil songs');
      expect(metadata.url, 'https://github.com/mcruncher/worshipsongs-db-dev');
      expect(metadata.language, 'Tamil');
      expect(metadata.openLpVersion, '2.4');
    });
  });
}