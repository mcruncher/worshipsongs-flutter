import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'database_provider.g.dart';

@riverpod
Future<Database> database(Ref ref) async {
  String databasesPath = await getDatabasesPath();
  var path = join(databasesPath, "songs.sqlite");
  var exists = await databaseExists(path);

  if (!exists) {
    await Directory(dirname(path)).create(recursive: true);

    ByteData data = await rootBundle.load(
      url.join("assets/db", "songs.sqlite"),
    );

    List<int> bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );

    await File(path).writeAsBytes(bytes, flush: true);
  }

  return await openDatabase(path, readOnly: true);
}
