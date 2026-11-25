import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service.dart';

class DatabaseServiceImpl implements DatabaseService {

  @override
  Future<Database> getDatabase(String key) async {
    final sqlFilename = "$key.sqlite";
    String databasesPath = await getDatabasesPath();
    var path = join(databasesPath, sqlFilename);
    var exists = await databaseExists(path);

    if (!exists) {
      await Directory(dirname(path)).create(recursive: true);

      ByteData data = await rootBundle.load(
        url.join("assets/db", sqlFilename),
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
