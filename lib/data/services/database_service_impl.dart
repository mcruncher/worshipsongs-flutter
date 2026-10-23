import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service.dart';

class DatabaseServiceImpl implements DatabaseService {
  final _sqlFilename = "songs.sqlite";

  @override
  Future<Database> getDatabase() async {
    String databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _sqlFilename);
    var exists = await databaseExists(path);

    if (!exists) {
      await Directory(dirname(path)).create(recursive: true);

      ByteData data = await rootBundle.load(
        url.join("assets/db", _sqlFilename),
      );

      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(path, readOnly: true);
  }
}
