import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:worship_songs/core/data/services/song_database_metadata_service.dart';

class SongDatabaseMetadataServiceImpl implements SongDatabaseMetadataService {
  @override
  Future<List<dynamic>> getSongDatabases() async {
    final content = await rootBundle.loadString('song_databases.json');
    final List<dynamic> json = jsonDecode(content);
    return json;
  }
}