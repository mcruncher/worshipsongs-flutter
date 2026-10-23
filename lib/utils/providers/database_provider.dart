import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:worship_songs/data/services/database_service.dart';
import 'package:worship_songs/data/services/database_service_impl.dart';

part 'database_provider.g.dart';

@riverpod
DatabaseService _databaseService(Ref ref) => DatabaseServiceImpl();

@riverpod
Future<Database> database(Ref ref) async =>
    ref.watch(_databaseServiceProvider).getDatabase();
