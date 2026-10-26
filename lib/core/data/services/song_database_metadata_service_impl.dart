import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:worship_songs/core/data/services/song_database_metadata_service.dart';
import 'package:worship_songs/core/domain/models/song_database_metadata.dart';

class SongDatabaseMetadataServiceImpl implements SongDatabaseMetadataService {
  // TODO: replace the mock data with a fetch of the JSON metadata file from GitHub.
  @override
  Future<List<SongDatabaseMetadata>> getSongDatabases() async {
    final content = await rootBundle.loadString('song_databases.json');
    final List<dynamic> json = jsonDecode(content);
    return json.map((item) => SongDatabaseMetadata.fromJson(item as Map<String, dynamic>)).toList();
  }
}