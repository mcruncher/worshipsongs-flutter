import 'package:flutter_test/flutter_test.dart';
import 'package:worship_songs/core/domain/models/song_database.dart';

void main() {
  test('fromJson maps all metadata fields', () {
    final database = SongDatabase.fromJson({
      'name': 'Tamil Worship Songs',
      'description': 'Tamil songs',
      'githubUrl': 'https://github.com/mcruncher/worshipsongs-db',
      'language': 'Tamil',
      'openLpVersion': '2.4',
    });

    expect(database.name, 'Tamil Worship Songs');
    expect(database.description, 'Tamil songs');
    expect(database.githubUrl, 'https://github.com/mcruncher/worshipsongs-db');
    expect(database.language, 'Tamil');
    expect(database.openLpVersion, '2.4');
  });

  test('fromJson accepts a numeric openLpVersion', () {
    final database = SongDatabase.fromJson({
      'name': 'n',
      'description': 'd',
      'githubUrl': 'u',
      'language': 'l',
      'openLpVersion': 3.0,
    });

    expect(database.openLpVersion, '3.0');
  });
}